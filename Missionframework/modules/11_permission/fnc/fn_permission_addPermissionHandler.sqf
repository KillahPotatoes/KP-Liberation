/*
    KPLIB_fnc_permission_addPermissionHandler

    File: fn_permission_addPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds a new permission to the permission system

    Parameter(s):
        _permission - Permission name                               [STRING, defaults to ""]
        _condition  - Code which is executed on permission check    [CODE, defaults to {false}]
        _string     - Permission stringtable path                   [STRING, defaults to ""]
        _default    - Default permission                            [BOOL, defaults to false]
        _vehCheck   - Vehcile clasnames for the check               [ARRAY, defaults to []]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_permission", "", [""]],
    ["_code", {false}, [{}]],
    ["_string", "", [""]],
    ["_default", false, [false]],
    ["_vehCheck", [], [[]]]
];

KPLIB_permissionTypes pushBackUnique _permission;

private _classNames = [];

{
    _classNames pushBack (_x select 0);
} forEach _vehCheck;

// Read the Variable
private _data = [[_code], _string, _classNames];
(_data select 0) append ((missionNamespace getVariable [toLower _permission, []]) select 0);

if !(_string isEqualTo "") then {
    _data set [1, _string];
};

// Write the Variable
missionNamespace setVariable [toLower _permission, _data];

// Emit permissions added event
["KPLIB_permission_newPH", [_permission,_default]] call CBA_fnc_globalEvent;

true
