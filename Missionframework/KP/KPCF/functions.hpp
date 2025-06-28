/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2020-07-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class cratefiller {
    file = "KP\KPCF\fnc";

    // Adds the given amount of the selected item to the inventory
    class cratefiller_addEquipment {
        requiredAddons[] = {"cba_main"};
    };

    // Changes the shown equipment category
    class cratefiller_createEquipmentList {
        requiredAddons[] = {"cba_main"};
    };

    // Creates a list with valueable magazines or attachments
    class cratefiller_createSubList {
        requiredAddons[] = {"cba_main"};
    };

    // Deletes the selected preset
    class cratefiller_deletePreset {
        requiredAddons[] = {"cba_main"};
    };

    // Exports the active inventory
    class cratefiller_export {
        requiredAddons[] = {"cba_main"};
    };

    // Gets all inventory items of the storage
    class cratefiller_getInventory {
        requiredAddons[] = {"cba_main"};
    };

    // Gets the config path / type of the given classname
    class cratefiller_getConfigPath {
        requiredAddons[] = {"cba_main"};
    };

    // Gets all player groups and adds them to the listbox
    class cratefiller_getGroups {
        requiredAddons[] = {"cba_main"};
    };

    // Scans the fob for possible storages
    class cratefiller_getNearStorages {
        requiredAddons[] = {"cba_main"};
    };

    // Gets all weapons of the selected player
    class cratefiller_getPlayerInventory {
        requiredAddons[] = {"cba_main"};
    };

    // Gets all players from the selected group and adds them to the listbox
    class cratefiller_getPlayers {
        requiredAddons[] = {"cba_main"};
    };

    // Returns the active storage
    class cratefiller_getStorage {
        requiredAddons[] = {"cba_main"};
    };

    // Imports the selected inventory
    class cratefiller_import {
        requiredAddons[] = {"cba_main"};
    };

    // Opens the cratefiller dialog
    class cratefiller_openDialog {
        requiredAddons[] = {"cba_main"};
    };

    // Module post initialization
    class cratefiller_postInit {
        requiredAddons[] = {"cba_main"};
    };

    // Module pre initialization
    class cratefiller_preInit {
        preInit = 1;
        requiredAddons[] = {"cba_main"};
    };

    // Creates the different categories of the whitelisted items
    class cratefiller_presets {
        requiredAddons[] = {"cba_main"};
    };

    // Removes the given amount of the selected item from the storage
    class cratefiller_removeEquipment {
        requiredAddons[] = {"cba_main"};
    };

    // Search for a weapon with the name entered in the search bar
    class cratefiller_search {
        requiredAddons[] = {"cba_main"};
    };

    // Adds the items to the active storage
    class cratefiller_setInventory {
        requiredAddons[] = {"cba_main"};
    };

    // CBA Settings for this module
    class cratefiller_settings {
        requiredAddons[] = {"cba_main"};
    };

    // Displays the items of the active storage
    class cratefiller_showInventory {
        requiredAddons[] = {"cba_main"};
    };

    // Shows the cratefiller overview display
    class cratefiller_showOverview {
        requiredAddons[] = {"cba_main"};
    };

    // Reads all saved presets and lists them
    class cratefiller_showPresets {
        requiredAddons[] = {"cba_main"};
    };

    // Sorts the displaynames of the given item array
    class cratefiller_sortList {
        requiredAddons[] = {"cba_main"};
    };
};
