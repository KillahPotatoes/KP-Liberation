/*
    KPLIB_fnc_init_placeTowers

    File: fn_init_placeTowers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-11
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Places Antennas at Radio Tower markers.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

private _antenna = objNull;

{
    // Create antenna and make sure it isn't aligned to terrain
    _antenna = createVehicle ["Land_Communication_F", markerPos _x, [], 0, "CAN_COLLIDE"];
    _antenna setpos (markerpos _x);
    _antenna setVectorUp [0,0,1];

    // Make sure this little antenna can't be destroyed by accident
    _antenna allowDamage false;
} forEach KPLIB_sectors_tower;

true
