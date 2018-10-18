/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class garrison {
    file = "modules\05_garrison\fnc";

    // Loads module specific data from the save
    class garrison_loadData {};

    // Module post initialization
    class garrison_postInitModule {
        postInit = 1;
    };

    // Module pre initialization
    class garrison_preInitModule {
        preInit = 1;
    };

    // Saves module specific data for the save
    class garrison_saveData {};
};
