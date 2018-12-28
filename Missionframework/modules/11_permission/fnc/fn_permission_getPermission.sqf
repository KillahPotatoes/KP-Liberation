/*
    KPLIB_fnc_getPermission

    File: fn_permission_getPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-10
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks the given permission and returns the result.

    Parameter(s):
        _target     - Target player     [OBJECT, defaults to objNull]
        _permission - Permission name   [STRING, defaults to ""]

    Returns:
        State of the given permission [BOOL]
*/

params [
    ["_target", objNull, [objNull]],
    ["_permission", "", [""]]
];

if !(KPLIB_param_permission) exitWith {
    true
};

private _playerPermissions = [];
_permission = toLower _permission;

// Search for the player permissions
private _playerPermissions = KPLIB_permission_list select (KPLIB_permission_list findIf {
    (_x select 0) isEqualTo (getPlayerUID player)
}) select 2;

// Check if the permission is added to the player and return the state
private _index = _playerPermissions findIf {(_x select 0) isEqualTo _permission};
if !(_index isEqualTo -1) exitWith {
    (_playerPermissions select _index) select 1
};

// Otherwise look for a default value. If even this fails, return just false
_index = KPLIB_permission_default findIf {(_x select 0) isEqualTo _permission};
if !(_index isEqualTo -1) then {
    (KPLIB_permission_default select _index) select 1
} else {
    false
};
