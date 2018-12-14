/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class permission {
    file = "modules\11_permission\fnc";

    // Adds a new permission to the permission system
    class permission_addPermissionHandler {};

    // Checks the given permission and executes the registered code
    class permission_checkPermission {};

    // Checks the given permission and returns the result
    class permission_getPermission {};

    // Loads module specific data from the save
    class permission_loadData {};

    // Open the dialog
    class permission_openDialog {};


    // Module post initialization
    class permission_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class permission_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class permission_saveData {};

    // Setup of actions available to players
    class permission_setupPlayerActions {};
};
