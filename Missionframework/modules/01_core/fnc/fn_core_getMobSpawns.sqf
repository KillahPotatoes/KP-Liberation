/*
    KPLIB_fnc_core_getMobSpawns

    File: fn_core_getMobSpawns.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-30
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Returns an array with all mobile spawn objects.

    Parameter(s):
    NONE

    Returns:
    ARRAY
*/

private _return = vehicles select {
    (typeOf _x == KPLIB_preset_respawnTruck || typeOf _x == KPLIB_preset_potato) &&
    ((_x distance KPLIB_eden_startbase) > 500) &&
    !surfaceIsWater (getPos _x) &&
    ((getPos _x) select 2) < 5 &&
    alive _x &&
    speed _x < 5
};

_return
