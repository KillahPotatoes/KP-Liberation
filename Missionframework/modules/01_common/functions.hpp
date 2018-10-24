/*
    KP LIBERATION COMMON FUNCTIONS

    File: functions.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-15
    Last Update: 2018-10-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Defines for all common utility functions
*/

class common {
    file = "modules\01_common\fnc";

    // Clears vehicle cargo
    class common_clearVehicleCargo {};

    // Creates a group at given side with given groupmembers
    class common_createGroup {};

    // Creates a unit with given classname in given group
    class common_createUnit {};

    // Creates a vehicle at given position with given direction
    class common_createVehicle {};

    // Generate positions in circle
    class common_getCirclePositions {};

    // getPos wrapper for ATL positions
    class common_getPos {};
};
