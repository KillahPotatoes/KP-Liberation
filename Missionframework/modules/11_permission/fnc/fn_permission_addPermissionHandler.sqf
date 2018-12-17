/*
    KPLIB_fnc_permission_addPermissionHandler

    File: fn_permission_addPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Adds a new permission to the permission system

    Parameter(s):
        _permission - Permission name                               [STRING, defaults to ""]
        _condition  - Code which is executed on permission check    [CODE, defaults to {false}]
        _string     - Permission stringtable path                   [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_permission", "", [""]],
    ["_code", {false}, [{}]],
    ["_string", "", [""]]
];

KPLIB_permissionTypes pushBackUnique _permission;

// Read the Variable
private _data = [_code, _string];
_data append (missionNamespace getVariable [toLower _permission, []]);

// Write the Variable
missionNamespace setVariable [toLower _permission, _data];

    // Emit permissions added event
    ["KPLIB_permission_newPH", [_permission]] call CBA_fnc_globalEvent;

true
