/*
    KPLIB_fnc_permission_initDefault

    File: fn_permission_initDefault.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-17
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Initializes the default permissions.

    Parameter(s):
        _permission - Permission name       [STRING, defaults to ""]
        _default    - Default permission    [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_permission", "", [""]],
    ["_default", false, [false]]
];

// Check for empty string
if (_permission isEqualTo "") exitWith {};

_permission = toLower _permission;

// Check if the default permission is already set
if (KPLIB_permission_default isEqualTo []) then {
    KPLIB_permission_default pushBack [_permission, _default];
};

if ((KPLIB_permission_default findIf {(_x select 0) isEqualTo (_permission)}) isEqualTo -1) then {
    KPLIB_permission_default pushBack [_permission, _default];
};

[[], KPLIB_permission_default, [], []] call KPLIB_fnc_permission_syncClients;

true
