/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class res {
    file = "modules\10_resources\fnc";

    // Loads module specific data from the save
    class res_loadData {};

    // Module post initialization
    class res_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class res_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class res_saveData {};
};
