/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class permission {
    file = "modules\11_permission\fnc";

    // Adds a new permission to the permission system
    class permission_addPermission {};

    // Checks the given permission and returns the result.
    class permission_checkPermission {};

    // Module post initialization
    class permission_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class permission_preInit {
        preInit = 1;
    };

};
