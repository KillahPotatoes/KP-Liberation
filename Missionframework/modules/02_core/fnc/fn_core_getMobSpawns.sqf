/*
    KPLIB_fnc_core_getMobSpawns

    File: fn_core_getMobSpawns.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-30
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns an array with all mobile spawn objects.

    Parameter(s):
        NONE

    Returns:
        Mobile spawn objects [ARRAY]
*/

private _return = vehicles select {
    private _pos = getPos _x;

    (_x getVariable ["KPLIB_respawn", false]) &&
    ((_x distance KPLIB_eden_startbase) > 500) &&
    ( (surfaceIsWater _pos  && _x isKindOf "Ship") || (!surfaceIsWater _pos && !(_x isKindOf "Ship")) ) &&
    (_pos select 2) < 5 &&
    alive _x &&
    speed _x < 5
};

_return
