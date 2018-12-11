/*
    KP LIBERATION COMMON FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-15
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Defines for all common utility functions
*/

class common {
    file = "modules\01_common\fnc";

    // Adds action to object with correct localized title
    class common_addAction {};

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

    // Generate positions in circle
    class common_getCirclePositions {};

    // Gets fob alphabet name
    class common_getFobAlphabetName {};

    // Gets path for className icon
    class common_getIcon {};

    // getPos wrapper for ATL positions
    class common_getPos {};

    // Gets random class of given type from preset
    class common_getPresetClass {};

    // Gets a random spawn marker
    class common_getRandomSpawnMarker {};

    // Initialize common module
    class common_preInit {
        preInit = 1;
    };
};
