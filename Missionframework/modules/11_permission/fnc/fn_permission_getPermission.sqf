/*
    KPLIB_fnc_getPermission

    File: fn_permission_getPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-10
    Last Update: 2018-12-10
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

private _result = false;
private _playerPermissions = [];
_permission = toLower _permission;

// Search for the player permissions
private _playerPermissions = KPLIB_permissionList select (KPLIB_permissionList findIf {
    (_x select 0) isEqualTo (getPlayerUID player)
}) select 2;

// Check if the permission dosn't exist and use the default permission
if !((_playerPermissions findIf {(_permission in _x)}) isEqualTo -1) then {
    {
        if (_permission in _x) then {
            _result = _x select 1;
        };
    } forEach _playerPermissions;
} else {
    {
        if (_permission in _x) then {
            _result = _x select 1;
        }
    } forEach KPLIB_defaultPermissions;
};

_result
