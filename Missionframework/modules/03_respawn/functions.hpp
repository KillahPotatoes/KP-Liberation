/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-11
    Last Update: 2018-11-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all functions, which are brought by this module.
*/

class respawn {
    file = "modules\03_respawn\fnc";

    // Do a camera fly by from-to position
    class respawn_camFlyBy {};

    // Handle respawn confirmation
    class respawn_displayConfirm {};

    // Focus map control on currently selected respawn area
    class respawn_displayFocusMap {};

    // Handle respawn display load
    class respawn_displayLoad {};

    // Handle loadout list selection change
    class respawn_displayLoadoutSelChanged {};

    // Handle respawn list selection change
    class respawn_displaySpawnSelChanged {};

    // Handle resapwn display unload
    class respawn_displayUnload {};

    // Update list of available loadouts
    class respawn_displayUpdateLoadouts {};

    // Update list of available respawns
    class respawn_displayUpdateRespawns {};

    // Get an array of available respawns
    class respawn_getRespawns {};

    // Handle player killed
    class respawn_onKilled {};

    // Handle player respawn
    class respawn_onRespawn {};

    // Open respawn menu
    class respawn_open {};

    // Module post initialization
    class respawn_postInit {
        postInit = 1;
    };

    // Module pre initialization
    class respawn_preInit {
        preInit = 1;
    };

    // CBA Settings for this module
    class respawn_settings {};

    // Spawns player at given position
    class respawn_spawnPlayer {};
};
