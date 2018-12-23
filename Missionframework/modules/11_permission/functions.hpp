/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class permission {
    file = "modules\11_permission\fnc";

    // Adds a new permission to the permission system
    class permission_addPermissionHandler {};

    // Changes the selected permission on the given player
    class permission_changePermission {};

    // Checks the given permission and executes the registered code
    class permission_checkPermission {};

    // Checks the given vehicle permission and executes the registered code
    class permission_checkVehiclePermission {};

    // Ejects the player and creates a hint
    class permission_ejectPlayer {};

    // Checks the given permission and returns the result
    class permission_getPermission {};

    // Initializes the default permissions
    class permission_initDefault {};

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

    // Checks if the player is already registered to the permission system
    class permission_registerPlayer {};

    // Resets all permissions to default
    class permission_resetToDefault {};

    // Saves module specific data for the save
    class permission_saveData {};

    // Reads the player permissions and applies them to the dialog controls
    class permission_setupPermissionControls {};

    // Setup of actions available to players
    class permission_setupPlayerActions {};

    // Receive client variables and send them to all clients
    class permission_syncClients {};
};
