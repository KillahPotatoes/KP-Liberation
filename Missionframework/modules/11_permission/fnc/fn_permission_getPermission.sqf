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

_result
