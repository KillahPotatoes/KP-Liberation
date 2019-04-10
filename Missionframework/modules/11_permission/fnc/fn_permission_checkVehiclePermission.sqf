/*
    KPLIB_fnc_permission_checkVehiclePermission

    File: fn_permission_checkVehiclePermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-21
    Last Update: 2019-04-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks the given vehicle permission and executes the registered code.

    Parameter(s):
        _unit       - Unit for the Check    [OBJECT, defaults to player]
        _role       - Player role           [STRING, defaults to ""]
        _vehicle    - Player vehicle        [OBJECT, defaults to objNull]

    Returns:
        Result of the registered code [BOOL]
*/

params [
    ["_unit", player, [objNull]],
    ["_role", "", [""]],
    ["_vehicle", objNull, [objNull]]
];

if !(KPLIB_param_permission) exitWith {
    true
};

private _data = [];
private _permission = "";
private _classNames = [];

if (
    _role isEqualTo "cargo" ||
    typeOf _vehicle isEqualTo KPLIB_preset_potatoF ||
    typeOf _vehicle isEqualTo KPLIB_preset_addHeliF ||
    typeOf _vehicle isEqualTo KPLIB_preset_addBoatF
) exitWith {
    true
};

// Check the given vehicle category
private _types = KPLIB_permission_data getVariable ["permissionTypes", []];
{
    _data = KPLIB_permission_data getVariable [toLower _x, []];
    if ((typeOf vehicle _unit) in (_data select 2)) then {
        _permission = _x;
    };
} forEach _types;

// Exit if no permission is found
if (_permission isEqualTo "") exitWith {
    true
};

[_permission] call KPLIB_fnc_permission_checkPermission
