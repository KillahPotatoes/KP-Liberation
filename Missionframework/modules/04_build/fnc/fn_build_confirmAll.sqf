#include "script_components.hpp"
/*
    KPLIB_fnc_build_confirmAll

    File: fn_build_confirmAll.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-28
    Last Update: 2018-11-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Confirms and builds every item in build queue.

    Parameter(s):
        NONE

    Returns:
        Items were built [BOOL]
*/

private _validItems = LGVAR(buildQueue) select {_x getVariable ["KPLIB_validPos", true]};
LSVAR("buildQueue", LGVAR(buildQueue) - _validItems);

// TODO implement build queue handling (resource check etc.)
systemChat "buildConfirm: Resource check not implemented yet!";
{
    private _dirAndUp = [vectorDir _x, vectorUp _x];
    private _pos = getPosATL _x;
    private _class = typeOf _x;

    deleteVehicle _x;

    [[_class, _pos, 0, true], _dirAndUp, player] remoteExecCall ["KPLIB_fnc_build_confirmSingle", 2];

} forEach _validItems;

true
