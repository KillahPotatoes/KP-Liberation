/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-11
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class respawn {
    file = "modules\02_respawn\fnc";

    // Handle respawn confirmation
    class respawn_displayConfirm {};

    // Get currently selected respawn position
    class respawn_displayGetSpawnPos {};

    // Handle respawn list selection change
    class respawn_displayLbSelChanged {};

    // Handle respawn display load
    class respawn_displayLoad {};

    // Update list of available respawns
    class respawn_displayUpdateList {};

    class respawn_displayUpdateMap {};

    // Get an array of available respawns
    class respawn_getRespawns {};

    // Module initialization
    class respawn_initModule {
        postInit = 1;
    };

    class respawn_onKilled {};

    class respawn_onRespawn {};

    // Open respawn menu
    class respawn_open {};

    class respawn_spawnPlayer {};
};
