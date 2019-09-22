# ============ imports ============ #
import applescript
import capture_one_pro_12 as co
# from capture_one_pro_12 import get_selected_variants, Document, Variant
from pathlib import Path

# ============ variables ============ #
begin_message = f'Begin - Python - {Path(__file__).name}'
end_message = f'End - Python - {Path(__file__).name}'
autocrop_recipe_name = 'autocrop_jpg'


# ============ run script ============ #
if __name__ == '__main__':
    applescript.display_dialog(begin_message)

    # get list of selected variants to process
    selected_variants_list = co.get_selected_variants()

    # reset recipes
    co.disable_recipes()

    # enable autocrop recipe and get output_folder/_extension
    # current_recipe_name, output_folder_path, output_extension = co.enable_recipe(autocrop_recipe_name)
    recipe_subprocess = co.enable_recipe(autocrop_recipe_name)

    # load first variant from list to get collection info for stuff, e.g. recipes
    # variant = co.Variant(selected_variants_list[0])

    # get pixel padding input
    pixel_padding = applescript.get_user_input_int('pixel_padding', 75)
    applescript.display_dialog(f'Pixel padding: {pixel_padding}')

    # process each image -- once i get everything, may be able to map?
    for selected_variant in selected_variants_list:
        variant = co.Variant(selected_variant)

    applescript.display_dialog(end_message)
