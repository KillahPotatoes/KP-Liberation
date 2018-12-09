/*
    KPLIB_fnc_

    File: fn_permission_checkPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks the given permission and executes the registered code.

    Parameter(s):
        _permission - Permission name [STRING, defaults to ""]

    Returns:
        Result of the registered code [BOOL]
*/

params [
    ["_permission", "", [""]]
];

private _result = false;
private _code = missionNamespace getVariable [toLower _permission, []];

// Execute the registered code
_result = [] call _code;

_result
