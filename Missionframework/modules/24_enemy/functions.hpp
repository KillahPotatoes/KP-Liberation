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

class enemy {
    file = "modules\24_enemy\fnc";

    // Get valid transport vehicle for given amount of soldiers
    class enemy_getTransportClasses {};

    // Loads module specific data from the save
    class enemy_loadData {};

    // Module post initialization
    class enemy_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class enemy_preInit {
        preInit = 1;
    };

    // Send given troops from nearest military base to sector
    class enemy_reinforceGarrison {};

    // Saves module specific data for the save
    class enemy_saveData {};

    // CBA Settings for this module
    class enemy_settings {};

    // Strength increase event function
    class enemy_strengthInc {};

    // Transfer given troops from one sector to another
    class enemy_transferGarrison {};
};
