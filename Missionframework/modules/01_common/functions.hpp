/*
    KP LIBERATION COMMON FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-15
    Last Update: 2019-06-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all common utility functions
*/

class common {
    file = "modules\01_common\fnc";

    // Adds action to object with correct localized title
    class common_addAction {};

    // Let a camera circle around a given target with given params
    class common_cameraCircleTarget {};

    // Do a camera fly by from-to position
    class common_cameraFlyBy {};

    // Clears vehicle cargo
    class common_clearVehicleCargo {};

    // Spawns a full crew for given vehicle
    class common_createCrew {};

    // Creates a group of given side with given groupmembers
    class common_createGroup {};

    // Creates a unit with given classname in given group
    class common_createUnit {};

    // Creates a vehicle at given position with given direction
    class common_createVehicle {};

    // Check current FPS or if they are higher or equal than given number
    class common_fps {};

    // Generate positions in circle
    class common_getCirclePositions {};

    // Gets fob alphabet name
    class common_getFobAlphabetName {};

    // Gets path for className icon
    class common_getIcon {};

    // Returns the FOB of the given player
    class common_getPlayerFob {};

    // getPos wrapper for ATL positions
    class common_getPos {};

    // Gets random class of given type from preset
    class common_getPresetClass {};

    // Gets a random spawn marker
    class common_getRandomSpawnMarker {};

    // Gets array of soldier classnames from preset
    class common_getSoldierArray {};

    // Checks if player occupies a slot
    class common_isSlot {};

    // Logs given text to server rpt
    class common_log {};

    // Initialize common module
    class common_preInit {
        preInit = 1;
    };
};
