/*
    KPLIB_fnc_permission_changePermission

    File: fn_permission_changePermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-16
    Last Update: 2018-12-19
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

    };
    default {
        // Change the player permission or apply them
        _index = KPLIB_permissionList findIf {(_x select 0) isEqualTo (_playerUID)};
        if (_index != -1) then {
            _playerArray = KPLIB_permissionList deleteAt _index;
            _playerPermissions = _playerArray deleteAt 2;
            _index = _playerPermissions findIf {(_x select 0) isEqualTo (toLower _permission)};
            if (_index != -1) then {
                _permissionArray = _playerPermissions deleteAt _index;
                _permissionArray set [1, !_state];
                _playerPermissions pushBack _permissionArray;
            } else {
                _playerPermissions pushBack [toLower _permission, !_state];
            };
            _playerArray pushBack _playerPermissions;
            KPLIB_permissionList pushBack _playerArray;
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
