/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-06-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class enemy {
    file = "modules\24_enemy\fnc";

    // Add/Remove awareness amount
    class enemy_addAwareness {};

    // Add/Remove strength amount
    class enemy_addStrength {};

    // Enemy commander FSM for decision making
    class enemy_commanderLogic {
        ext = ".fsm";
    };

    // Get valid transport vehicle for given amount of soldiers
    class enemy_getTransportClasses {};

    // Handles transfer convoy arrival
    class enemy_handleConvoyEnd {};

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

    // Handle sector activation
    class enemy_sectorAct {};

    // Handle sector capture
    class enemy_sectorCapture {};

    // Handle sector deactivation
    class enemy_sectorDeact {};

    // CBA Settings for this module
    class enemy_settings {};

    // Spawns an enemy patrol
    class enemy_spawnPatrol {};

    // Strength increase event function
    class enemy_strengthInc {};

    // Transfer given troops from one sector to another
    class enemy_transferGarrison {};
};
