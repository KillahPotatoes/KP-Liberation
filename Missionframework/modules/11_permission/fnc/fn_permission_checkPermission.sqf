/*
    KPLIB_fnc_

    File: fn_permission_checkPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks the given permission and returns the result.

    Parameter(s):
        _permission - Permission name [STRING, defaults to ""]

    Returns:
        State of the given permission [BOOL]
*/

params [
    ["_permission", "", [""]]
];

private _result = false;

_result
