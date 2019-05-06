#include "script_component.hpp"
/*
    KPLIB_fnc_getPermission

    File: fn_permission_getPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-10
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Checks the given permission and returns the result.

    Parameter(s):
        _permission - Permission name   [STRING, defaults to ""]
        _target     - Target player     [OBJECT, defaults to player]

    Returns:
        State of the given permission [BOOL]
*/

params [
    ["_permission", "", [""]],
    ["_target", player, [objNull]]
];

if (!KPLIB_param_permission || serverCommandAvailable "#kick") exitWith {
    true
};

// Variables
private _list =  PGVAR("permissionList", []);
private _default = PGVAR("permissionDefault", []);
private _playerPermissions = [];

_permission = toLower _permission;

// Search for the player permissions
private _playerPermissions = _list select (_list findIf {
    (_x select 0) isEqualTo (getPlayerUID player)
}) select 2;

// Check if the permission is added to the player and return the state
private _index = _playerPermissions findIf {
    (_x select 0) isEqualTo _permission
};
if !(_index isEqualTo -1) exitWith {
    (_playerPermissions select _index) select 1
};

// Otherwise look for a default value. If even this fails, return just false
_index = _default findIf {
    (_x select 0) isEqualTo _permission
};
if !(_index isEqualTo -1) then {
    (_default select _index) select 1
} else {
    false
};
