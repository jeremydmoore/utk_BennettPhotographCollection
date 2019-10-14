# ============ imports ============ #
import applescript
import capture_one_pro_12 as co
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
    co.disable_all_recipes()

    # enable autocrop recipe and get output_folder/_extension
    # current_recipe_name, output_folder_path, output_extension = co.enable_recipe(autocrop_recipe_name)
    _, autocrop_output_folder_path, autocrop_output_extension = co.enable_recipe(autocrop_recipe_name)

    # load first variant from list to get collection info for stuff, e.g. recipes
    # variant = co.Variant(selected_variants_list[0])

    # get pixel padding input
    pixel_padding = applescript.get_user_input_int('pixel_padding', 75)
    applescript.display_dialog(f'Pixel padding: {pixel_padding}')

    # process each image -- once i get everything, may be able to map?
    for selected_variant in selected_variants_list:
        variant = co.Variant(selected_variant)
        applescript.display_dialog(f'document: {variant.document}')
        applescript.display_dialog(f'variant id: {variant.id}')

        # test_command = [f'Tell application \"Capture One 12\" to set adjustment_values to rotation of adjustments of variant {variant.id} in document {variant.document}', 'return adjustment_values']
        # test_output = applescript.process(test_command)
        # applescript.display_dialog(f'output: {test_output}')
        test_value = co.get_adjustment_values(variant.document, variant.id, 'rotation')
        applescript.display_dialog(f'rotation before: {test_value}')
        test_value = co.set_adjustment(variant.document, variant.id, 'rotation', '0.0')
        applescript.display_dialog(f'rotation after: {test_value}')
        # rotation_value = variant.reset_rotation()

    applescript.display_dialog(end_message)
