/*
    File: fn_swapInventory.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sets loadout of one given unit to the loadout of second given unit.

    Parameter(s):
        _from   - Unit to get the loadout from              [OBJECT, defaults to objNull]
        _to     - Unit which should get the loadout applied [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_from", objNull, [objNull]],
    ["_to", objNull, [objNull]]
];

if (isNull _from || isNull _to) exitWith {["Null object given"] call BIS_fnc_error; false};

[_to, [_from, ["repetitive"]] call KPLIB_fnc_getLoadout] call KPLIB_fnc_setLoadout;

true
