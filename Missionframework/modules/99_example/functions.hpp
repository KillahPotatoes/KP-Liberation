/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-02-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class example {
    file = "modules\99_example\fnc";

    // Loads module specific data from the save
    class example_loadData {};

    // Module post initialization
    class example_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class example_preInit {
        preInit = 1;
    };

    // Saves module specific data for the save
    class example_saveData {};

    // CBA Settings for this module
    class example_settings {};
};
