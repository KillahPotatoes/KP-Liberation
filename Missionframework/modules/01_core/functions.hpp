/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-08-26
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class core {
    file = "modules\01_core\fnc";

    // Check if units are near a position
    class core_areUnitsNear {};

    // Build fob and register it
    class core_buildFob {};

    // Checks if player can build fob
    class core_canBuildFob {};

    // Change the owner of a sector
    class core_changeSectorOwner {};

    // Check player gear against blacklist
    class core_checkGear {};

    // Check if win conditions are met
    class core_checkWinCond {};

    // The intro cinematic procedure
    class core_cinematic {};

    // Creates FOB marker
    class core_createFobMarker {};

    // Get all mobile respawn vehicles
    class core_getMobSpawns {};

    // Get the nearest capturable sector
    class core_getNearestSector {};

    // Handle an activated sector
    class core_handleSector {};

    // Start the intro cinematic
    class core_intro {};

    // Creates diary entries with parameter values
    class core_paramDiaryList {};

    // Converts value of param to "texts" string
    class core_paramToText {};

    // Opens the redeploy/spawn dialog
    class core_redeploy {};

    // Initialize BIS revive
    class core_reviveInit {
        postInit = 1;
    };

    // Setup of actions avaible to players
    class core_setupPlayerActions {};

    // The spawn camera sequence
    class core_spawnCam {};

    // Spawning of the Potato 01 helicopter
    class core_spawnPotato {};

    // Spawning of the start fob box
    class core_spawnStartFobBox {};

    // Spawning of the start vehicles
    class core_spawnStartVeh {};

    // Updates the fob markers labels
    class core_updateFobMarkers {};

    // Updates the sector marker colors
    class core_updateSectorMarkers {};
};

// Common utility functions
class common {
    file = "modules\01_core\fnc\common";

    // Creates namespace
    class common_createNamespace {};

    // Get all human players
    class common_getAllPlayers {};

    // Generate positions in circle
    class common_getCirclePositions {};

    // Spawning of a vehicle at given position with given direction
    class common_spawnVehicle {};
};
