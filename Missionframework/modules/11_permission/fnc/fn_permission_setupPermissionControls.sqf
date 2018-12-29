#include "script_component.hpp"
/*
    KPLIB_fnc_permission_setupPermissionControls

    File: fn_permission_setupPermissionControls.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-17
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Reads the player permissions and applies them to the dialog controls.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758011;
private _ctrlPlayerList = _dialog displayCtrl 68740;

// Read the listbox
private _index = lbCurSel _ctrlPlayerList;
private _playerUID = _ctrlPlayerList lbData _index;

// Check the listbox data and execute code dependent on listbox selection
private _defaultPermission = false;
private _index = 0;
private _permission = "";
private _playerPermissions = [];

switch (_playerUID) do {
    case "default": {
        {
            _permission = toLower (_x getVariable ["Data", ["", false]]) select 0;
            _defaultPermission = KPLIB_permission_default select (KPLIB_permission_default findIf {
                (_x select 0) isEqualTo _permission
            }) select 1;

            _x setVariable ["Data", [_permission, _defaultPermission]];
            _x ctrlSetTextColor ([KPLIB_COLOR_RED, KPLIB_COLOR_GREEN] select _defaultPermission);
            _x ctrlEnable true;
        } forEach KPLIB_permission_tempControls;
    };
    case "placeholder": {
        {
            _x ctrlEnable false;
        } forEach KPLIB_permission_tempControls;
    };
    default {
        _index = KPLIB_permission_list findIf {(_x select 0) isEqualTo (_playerUID)};
        if (_index != -1) then {
            _playerPermissions = (KPLIB_permission_list select _index) select 2;
        };
        private _permissionState = false;
        {
            _permission = toLower (_x getVariable ["Data", ["", false]]) select 0;
            _index = (_playerPermissions findIf {(_x select 0) isEqualTo _permission});
            if (_index isEqualTo -1) then {
                _permissionState = KPLIB_permission_default select (KPLIB_permission_default findIf {
                    (_x select 0) isEqualTo _permission
                }) select 1;
            } else {
                _permissionState = (_playerPermissions select _index) select 1;
            };
            _x setVariable ["Data", [_permission, _permissionState]];
            _x ctrlSetTextColor ([KPLIB_COLOR_RED, KPLIB_COLOR_GREEN] select _permissionState);
            _x ctrlEnable true;
        } forEach KPLIB_permission_tempControls;
    };
};

true
