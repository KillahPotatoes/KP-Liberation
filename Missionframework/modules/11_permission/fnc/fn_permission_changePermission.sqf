/*
    KPLIB_fnc_permission_changePermission

    File: fn_permission_changePermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-28
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

// Colors
private _red = [0.9,0,0,1];
private _green = [0,0.8,0,1];
private _white = [1,1,1,1];

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

switch (_playerUID) do {
    case "default": {
        _index = KPLIB_permission_default findIf {(_x select 0) isEqualTo (toLower _permission)};
        (KPLIB_permission_default select _index) set [1, !_state];
    };
    default {
        // Change the player permission or apply them
        _index = KPLIB_permission_list findIf {(_x select 0) isEqualTo (_playerUID)};
        if (_index != -1) then {
            // Ref to player array in permission list
            _playerArray = KPLIB_permission_list select _index;
            _index = (_playerArray select 2) findIf {(_x select 0) isEqualTo (toLower _permission)};

            // If the player already has the permission, change the state
            if (_index != -1) then {
                ((_playerArray select 2) select _index) set [1, !_state];
            } else {
                // Otherwise add the permission
                (_playerArray select 2) pushBack [toLower _permission, !_state];
            };
        };
    };
};

// Edit the control
if (_state) then {
    _control setVariable ["Data", [_permission, false]];
    _control ctrlSetTextColor _red;
} else {
    _control setVariable ["Data", [_permission, true]];
    _control ctrlSetTextColor _green;
};

true
