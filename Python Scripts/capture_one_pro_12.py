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


def set_value():
    # command = command_stub +
    pass


def reset(value):
    pass


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
        pass
