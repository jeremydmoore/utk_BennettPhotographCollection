# ============ imports ============ #
import applescript
from pathlib import Path

# ============ variables ============ #
tell_co12 = 'Tell application \"Capture One 12\"'
command_stub = ['use AppleScript version "2.4"', 'use scripting additions']
scripts_dir_path = Path('/Users/jeremy/Library/Scripts/Capture One Scripts/')


# ============ functions ============ #
def disable_recipes():
    disable_recipes_script_path = scripts_dir_path.joinpath('Background Scripts', 'disable_recipes.scpt')
    applescript.process_script(disable_recipes_script_path)


def enable_recipe(recipe_name):
    enable_recipe_script_path = scripts_dir_path.joinpath('Background Scripts', 'enable_recipe.scpt')
    recipe_subprocess = applescript.process_script(enable_recipe_script_path, args=recipe_name)
    python_list = applescript.python_list_from_script(recipe_subprocess)
    applescript.display_dialog(f'enable recipe python list: {python_list}')
    return python_list


def get_selected_variants():

    command = command_stub + [f'{tell_co12} to set selected_variants to (get selected variants)', 'return selected_variants']
    selected_variants_list = applescript.python_list(command)

    # if there are less than 2 items in the list and the first item is empty
    if len(selected_variants_list) < 2 and selected_variants_list[0] == '':
        applescript.display_dialog('No images selected, select at least 1 image and run again')
        selected_variants_list = None

    return selected_variants_list


def set_value():
    pass


def reset(value):
    pass


# class Document():
#
#     def __init__(self, current_document):
#
#         # set current document to document
#         command = command_stub + [f'{tell_co12} to set current document to document {current_document}']
#         applescript.display_dialog(f'command: {command}')
#         applescript.python_list(command)
#
#         # self.tell = f'{tell_co12} ¬ tell current document
#         # Option + L to create multi-line Applescript
#
#         self.tell = f'{tell_co12} to tell current document'
#
#         # get name of current document
#         command = command_stub + [f'{self.tell} to set document_name to (get name of current document)', 'return document_name']
#         self.name = applescript.python_list(command)[0]  # should only be 1 value!
#         applescript.display_dialog(f'document name: {self.name}')
#
#
#         # command = [f'{self.tell} to set recipe_list to (get name of recipes)', 'return recipe_list']
#         # command = [f'{self.tell} to set number to (get count of recipes)', 'return number']
#         # number_of_recipes = int(applescript.python_list(command)[0])
#         # applescript.display_dialog(f'# of recipes: {number_of_recipes}')
#         # self.recipes_list = applescript.python_list(command)
#         # applescript.display_dialog(f'Recipes: {self.recipes_list}')
#
#     def disable_recipes(self):
#         applescript.display_dialog(f'document name: {self.name}')
#         command = command_stub + [f'{self.tell} to repeat with counter from 1 to count of recipes', 'set the_recipe to item counter of recipes', 'set enabled of the_recipe to false']
#         applescript.display_dialog(command)
#         applescript.process(command)




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
