/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-12
    Last Update: 2018-11-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class arsenal {
    file = "modules\12_arsenal\fnc";

    // Applies the selected loadout to the player
    class arsenal_applyLoadout {};

    // Check player gear against blacklist
    class arsenal_checkGear {};

    // Copies the loadout from selected player
    class arsenal_copyLoadout {};

    // Initializes the virtual arsenal
    class arsenal_fillArsenal {};

    // Lists all near players in a predefined radius
    class arsenal_getNearPlayers {};

    // Opens the arsenal dependent on the selected type
    class arsenal_openArsenal {};

    // Open the dialog
    class arsenal_openDialog {};

    // Module post initialization
    class arsenal_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class arsenal_preInit {
        preInit = 1;
    };

    // Stores the selected loadout as default loadout
    class arsenal_setDefaultLoadout {};

    // CBA Settings initialization for this module
    class arsenal_settings {};

    // Setup of actions available to players
    class arsenal_setupPlayerActions {};

};
