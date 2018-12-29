#include "script_component.hpp"
/*
    KPLIB_fnc_permission_changePermission

    File: fn_permission_changePermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Changes the selected permission of the given player.

    Parameter(s):
        _args - Provided arguments of the EH [ARRAY, defaults to []]]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_args", [], [[]]]
];

_args params ["_control"];

// Dialog controls
private _dialog = findDisplay 758011;
private _ctrlPlayerList = _dialog displayCtrl 68740;

// Read the control
(_control getVariable ["Data", ["", false]]) params [
    "_permission",
    "_state"
];

// Get the listbox data
private _index = lbCurSel _ctrlPlayerList;
private _playerUID = _ctrlPlayerList lbData _index;
private _playerArray = [];
private _playerPermissions = [];
private _permissionArray = [];
_permission = toLower _permission;

switch (_playerUID) do {
    case "default": {
        _index = KPLIB_permission_default findIf {(_x select 0) isEqualTo (_permission)};
        (KPLIB_permission_default select _index) set [1, !_state];
    };
    default {
        // Change the player permission or apply them
        _index = KPLIB_permission_list findIf {(_x select 0) isEqualTo (_playerUID)};
        if (_index != -1) then {
            // Ref to player array in permission list
            _playerArray = KPLIB_permission_list select _index;
            _index = (_playerArray select 2) findIf {(_x select 0) isEqualTo (_permission)};

            // If the player already has the permission, change the state
            if (_index != -1) then {
                ((_playerArray select 2) select _index) set [1, !_state];
            } else {
                // Otherwise add the permission
                (_playerArray select 2) pushBack [_permission, !_state];
            };
        };
    };
};

// Edit the control
_control setVariable ["Data", [_permission, !_state]];
_control ctrlSetTextColor ([KPLIB_COLOR_GREEN, KPLIB_COLOR_RED] select _state);

true
