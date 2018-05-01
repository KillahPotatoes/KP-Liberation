/*
    KP LIBERATION MODULE FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all functions, which are brought by this module.
*/

class core {
    file = "modules\01_core\fnc";

    // Check player gear against blacklist
    class core_checkGear {};

    // The intro cinematic procedure
    class core_cinematic {};

    // Get all mobile respawn vehicles
    class core_getMobSpawns {};

    // Get the nearest capturable sector
    class core_getNearestSector {};

    // Start the intro cinematic
    class core_intro {};

    // Spawning of the Potato 01 helicopter
    class core_spawnPotato {};

    // Spawning of the start vehicles
    class core_spawnStartVeh {};

    // Opens the redeploy/spawn dialog
    class core_redeploy {};

    // The spawn camera sequence
    class core_spawnCam {};
};
