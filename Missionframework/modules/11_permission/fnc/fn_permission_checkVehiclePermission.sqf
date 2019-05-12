#include "script_component.hpp"
/*
    KPLIB_fnc_permission_checkVehiclePermission

    File: fn_permission_checkVehiclePermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-21
    Last Update: 2019-05-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Checks the given vehicle permission and executes the registered code.

    Parameter(s):
        _unit       - Unit for the Check    [OBJECT, defaults to player]
        _vehicle    - Player vehicle        [OBJECT, defaults to objNull]

    Returns:
        Result of the registered code [BOOL]
*/

params [
    ["_unit", player, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

if !(KPLIB_param_permission) exitWith {
    true
};

// Variables
private _types = PGVAR("permissionTypes", []);
private _data = [];
private _permission = "";
private _isCargo = (_vehicle getCargoIndex _unit) != -1;
private _whitelist = [
    KPLIB_preset_potatoF,
    KPLIB_preset_addHeliF,
    KPLIB_preset_addBoatF
];

if (_isCargo || typeOf _vehicle in _whitelist) exitWith {
    true
};

// Check the given vehicle category
{
    _data = PGVAR(_x, []);
    if ((typeOf vehicle _unit) in (_data select 2)) then {
        _permission = _x;
    };
} forEach _types;

// Exit if no permission is found
if (_permission isEqualTo "") exitWith {
    true
};

[_permission] call KPLIB_fnc_permission_checkPermission
