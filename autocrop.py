# importing
import argparse
from pathlib import Path
from subprocess import call

import cv2
import numpy as np
from ipywidgets import IntProgress, Label, VBox
from IPython.display import display
from PIL import Image

import img_qc.img_qc as img_qc

# parse arguments
parser = argparse.ArgumentParser(description='Autocrop jpeg')
parser.add_argument('imagepath')
parser.add_argument('-p', '--padding', type=int, default=10)

args = parser.parse_args()
image_path = Path(args.imagepath)
padding = args.padding


# functions

def rotate_bound(image, angle, center=None, scale=1.0):
    # grab the dimensions of the image and then determine the
    # center
    (height, width) = image.shape[:2]

    # if the center is None, initialize it as the center of
    # the image
    if center is None:
        centerX = (w // 2)
        centerY = (h // 2)
    else:
        centerX, centerY = center

    # grab the rotation matrix (applying the negative of the
    # angle to rotate clockwise), then grab the sine and cosine
    # (i.e., the rotation components of the matrix)
    M = cv2.getRotationMatrix2D((centerX, centerY), -angle, scale)
    cos = np.abs(M[0, 0])
    sin = np.abs(M[0, 1])

    # compute the new bounding dimensions of the image
    width_new = int((height * sin) + (width * cos))
    height_new = int((height * cos) + (width * sin))

    # adjust the rotation matrix to take into account translation
    M[0, 2] += (width_new / 2) - centerX
    M[1, 2] += (height_new / 2) - centerY

    # perform the actual rotation and return the image
    return cv2.warpAffine(image, M, (width_new, height_new), flags=cv2.INTER_CUBIC)


def autocrop(image_path, compression=None, dpi=None, padding=0, rotate_odd_even=False):

    # set debug directory
    debug_directory_path = image_path.parents[0].joinpath(f'{image_path.stem}_debug')
    debug_directory_path.mkdir(exist_ok=True)

    # === AutoCrop
    if not dpi:
        image = Image.open(image_path)
        dpi = image.info['dpi'][0]

    # load the image
    image = cv2.imread(str(image_path))

    # crop image inside blue tape, but don't use if not necessary
    #image = image[1200:8600, 400:5000]

    # compute the ratio of the max height of the sensor to the processed image
    ratio = 6192 / image.shape[0]  # height of Fuji GFX50s sensor in pixels

    # clone image
    image_original = image.copy()

    # DEBUG: save image
    pil_image = Image.fromarray(image)
    test_jpg_path = debug_directory_path.joinpath('open_and_save.jpg')
    pil_image.save(test_jpg_path)

    # resize image
    #image = img_qc.get_resized_cv_image(image, height=800)

    # convert the image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # blur the image
    blurred = cv2.GaussianBlur(gray, (5, 5), 0)

    # apply Otsu's automatic thresholding
    (T, thresh) = cv2.threshold(blurred, 0, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)

    # set a manual threshold
    # _, thresh = cv2.threshold(blurred, 127, 255, cv2.THRESH_BINARY)

    # DEBUG: save thresholded image
    pil_image = Image.fromarray(thresh, mode='L')
    thresh_jpg_path = debug_directory_path.joinpath('threshold.jpg')
    pil_image.save(thresh_jpg_path)

    # find the contours in the thresholded image keeping the external one
    _, contours, hierarchy = cv2.findContours(thresh.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

    cnts = contours

    # sort the contours from left to right
    (cnts, bounding_boxes) = img_qc.sort_contours(cnts)

    # loop over the contours individually
    for (i, c) in enumerate(cnts):
        # if the contour is not sufficiently large, ignore it
        if cv2.contourArea(c) < 20000:  # use 20000 for scrapbook pages
            continue

        # compute the rotated bounding box of the contour
        box = cv2.minAreaRect(c)
        box = cv2.boxPoints(box)
        box = np.int0(box)

        # DEBUG: draw found contour & show image
        clone = image_original.copy()
        cv2.drawContours(clone, [box], 0, (0, 0, 255), 2)
        pil_image = Image.fromarray(clone)
        contour_jpg_path = debug_directory_path.joinpath(f'contour_{str(i).zfill(3)}.jpg')
        pil_image.save(contour_jpg_path)

        # re-order the points in tl, tr, br, bl order
        rect = img_qc.order_points(box)

        # find the points and angle for minAreaRectangle
        (x, y), (w, h), theta = cv2.minAreaRect(c)

        # rotate image around center of minAreaRect by theta amount
        #if theta < -45:
            #theta = 90 + theta

        # the `cv2.minAreaRect` function returns values in the
        # range [-90, 0); as the rectangle rotates clockwise the
        # returned angle trends to 0 -- in this special case we
        # need to add 90 degrees to the angle
        if theta < -45:
            angle = -(90 + theta)

        # otherwise, just take the inverse of the angle to make
        # it positive
        else:
            angle = -theta

        # DEBUG: rotate & show image
#         clone = image.copy()
#         image_rotated = img_qc.rotate(clone, theta, (x, y))
#         plt.imshow(image_rotated)

    # multiply the rectangle by the original ratio
    rect *= ratio

    # find the points we need to crop the full size original
    tl, tr, br, bl = rect
    startX = max(min(tl[0], bl[0]), 0)
    startY = max(min(tl[1], tr[1]), 0)
    endX = max(tr[0], br[0])
    endY = max(bl[1], br[1])

    # rotate original by theta from minAreaRect
    x *= ratio
    y *= ratio
    image_rotated = img_qc.rotate(image_original, theta, (x, y))

    # add padding (default hard-coded is 0 pixels)
    pixel_padding = int(padding)
    startX -= pixel_padding
    startY -= pixel_padding
    endX += pixel_padding
    endY += pixel_padding

    # startX/startY to max of current value and 0 to stay inside image
    startX = max(startX, 0)
    startY = max(startY, 0)

    # endX/endY to min of current value and max width/height of image to stay inside image
    endX = min(endX, 8256)  # NOTE: NOT USING ROTATED MAX SIZE
    endY = min(endY, 6192)

    # crop the image in memory
    image_cropped = image_rotated[int(startY):int(endY), int(startX):int(endX)]

    # create output directory and set output path
    output_directory_path = image_path.parents[0].joinpath('00_cropped')
    output_directory_path.mkdir(exist_ok=True)
    output_path = output_directory_path.joinpath(image_path.name)

    # convert to pillow Image
    image_cropped = cv2.cvtColor(image_cropped, cv2.COLOR_BGR2RGB)  # convert to RGB!
    pillow_image = Image.fromarray(image_cropped)

    dpi = float(dpi)  # dpi MUST be a float for Pillow

    pillow_image.save(output_path, compression=compression, dpi=(dpi, dpi))

    crop_box = [int(startY), int(endY), int(startX), int(endX)]

    # round off theta to 3 digits
    # rotation_angle = round(angle, 3)
    rotation_angle = angle

    # rotation, centerX, centerY, width, height
    capture_one_data = [rotation_angle, int(x), int(y), int(endX - startX), int(endY - startY)]

    capture_one_data_as_str = [str(x) for x in capture_one_data]

    return capture_one_data_as_str

if __name__ == "__main__":

    # single autocrop
    capture_one_data_as_str = autocrop(image_path, padding=padding)

    print("\n".join(capture_one_data_as_str))
