/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-04-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class cratefiller {
    file = "modules\26_cratefiller\fnc";

    // Changes the shown equipment category
    class cratefiller_createEquipmentList {};

    // Creates a list with valueable magazines or attachments
    class cratefiller_createSubList {};

    // Gets the config path / type of the given classname
    class cratefiller_getConfigPath {};

    // Scans the fob for possible storages
    class cratefiller_getNearStorages {};

    // Opens the cratefiller dialog
    class cratefiller_openDialog {};

    // Module post initialization
    class cratefiller_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class cratefiller_preInit {
        preInit = 1;
    };

    // Creates the different categories of the whitelisted items
    class cratefiller_presets {};

    // CBA Settings for this module
    class cratefiller_settings {};

    // Reads all saved presets and lists them
    class cratefiller_showPresets {};

    // Sorts the displaynames of the given item array
    class cratefiller_sortList {};
};
