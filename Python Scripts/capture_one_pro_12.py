# ============ imports ============ #
import applescript
from pathlib import Path

# ============ variables ============ #
tell_co12 = 'Tell application \"Capture One 12\"'
command_stub = ['use AppleScript version "2.4"', 'use scripting additions']
scripts_dir_path = Path('/Users/jeremy/Library/Scripts/')
python_scripts_dir_path = scripts_dir_path.joinpath('Python Scripts')
applescript_scripts_dir_path = scripts_dir_path.joinpath('AppleScript Scripts')


# ============ functions ============ #
def run_applescript_script(script_name, args=None):
    script_path = applescript_scripts_dir_path.joinpath(script_name)
    python_list = applescript.python_list_from_script(script_path, args)
    return python_list


def disable_all_recipes():
    script_name = 'disable_all_recipes.scpt'
    all_recipes_list = run_applescript_script(script_name)
    return all_recipes_list


def enable_recipe(recipe_name):
    """
    Input (str): recipe_name to activate and set as current recipe

    Returns (list): info for processed variants in capture_one_pro_12
        [recipe_name, output_folder_path, output_extension]
    """
    script_name = 'enable_recipe.scpt'
    # if isinstance(recipe_names, list):  # there are multiple recipes to enable
        # for recipe_name in recipe_names:
    output_info_list = run_applescript_script(script_name, args=recipe_name)
    return output_info_list


def get_selected_variants():

    command = command_stub + [f'{tell_co12} to set selected_variants to (get selected variants)', 'return selected_variants']
    selected_variants_list = applescript.python_list(command)

    # if there are less than 2 items in the list and the first item is empty
    if len(selected_variants_list) < 2 and selected_variants_list[0] == '':
        applescript.display_dialog('No images selected, select at least 1 image and run again')
        selected_variants_list = None

    return selected_variants_list

def set_crop(document, variant_id, crop_box):
    pass


def set_adjustment(document, variant_id, adjustment, value):

    # returned_list is [Boolean, document, variant_id]
    reset_variant_list = do_i_have_to_reset_the_primary_variant(document, variant_id)

    # set adjustment to new value
    command = command_stub + [f'{tell_co12} to set {adjustment} of adjustments of primary variant to "{value}"']
    applescript.process(command)

    # get adjustment values list and return
    adjustment_values_list = get_adjustment_values(document, variant_id, adjustment)

    if reset_variant_list[0] is True:
        set_variant_as_primary(reset_variant_list[1], reset_variant_list[2])

    return adjustment_values_list


def get_adjustment_values(document, variant_id, adjustment):

    # returned_list is [Boolean, document, variant_id]
    reset_variant_list = do_i_have_to_reset_the_primary_variant(document, variant_id)

    command = command_stub + [f'{tell_co12} to set adjustment_values to {adjustment} of adjustments of primary variant', 'return adjustment_values']
    adjustment_values_list = applescript.python_list(command)

    if reset_variant_list[0] is True:
        set_variant_as_primary(reset_variant_list[1], reset_variant_list[2])

    return adjustment_values_list

def reset_adjustment(adjustment):
    pass

def get_primary_variant_id():
    command = command_stub + [f'{tell_co12} to set primary_variant_id to id of primary variant', 'return primary_variant_id']
    primary_variant_id = applescript.python_list(command)[0]
    return primary_variant_id

def get_primary_variant_document():
    command = command_stub + [f'{tell_co12} to set primary_variant_document to document of primary variant', 'return primary_variant_document']
    primary_variant_document = applescript.python_list(command)[0]
    return get_primary_variant_document

def set_variant_as_primary(document, variant_id):
    command = command_stub + [f'{tell_co12} to set primary variant to variant {variant_id} in document {document}']
    applescript.process(command)
    new_primary_variant_id = get_primary_variant_id()
    if variant_id != new_primary_variant_id:
        applescript.display_dialog(f'ERROR: new id {new_primary_variant_id} != wanted value {variant_id}')
    return

def do_i_have_to_reset_the_primary_variant(document, variant_id):

    old_primary_variant_document = get_primary_variant_document()
    old_primary_variant_id = get_primary_variant_id()
    reset_variant_list = [False, old_primary_variant_document, old_primary_variant_id]

    # check if we need to change the variant or not
    if old_primary_variant_document != document and old_primary_variant_id != variant_id:
        set_variant_as_primary(document, variant_id)
        reset_variant_list[0] = True

    return reset_variant_list



class Variant():

    def __init__(self, selected_variant):
        self.info = selected_variant

        # self.info in form of 'variant id {self.id} of collection id {self.collection_id} of document {self.document}'
        # assumes collection id and document do NOT have spaces in them!
        info_list = self.info.split(' ')
        self.id = info_list[2]
        self.collection_id = info_list[6]
        self.document = info_list[-1]


    def display_info(self):
        applescript.display_dialog(self.info)
        applescript.display_dialog(f'variant ID: {self.id}')
        applescript.display_dialog(f'{self.collection_id}')
        applescript.display_dialog(f'{self.document}')


    def reset_rotation(self):
        rotation_values_list = set_adjustment(self.document, self.id, 'rotation', '0.0')
        rotation_value = rotation_values_list[0]
        applescript.display_dialog(f'rotation value: {rotation_value}')
        return rotation_value
