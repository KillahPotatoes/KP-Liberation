/*
    KP LIBERATION PERSISTENCE MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-03-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by persistence module.
*/

class persistence {
    file = "modules\03_persistence\fnc";

    // Loads module specific data from the save
    class persistence_loadData {};

    // Persistence pre initialization
    class persistence_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class persistence_saveData {};
};
