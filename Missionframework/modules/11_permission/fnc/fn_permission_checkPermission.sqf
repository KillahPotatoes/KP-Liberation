/*
    KPLIB_fnc_

    File: fn_permission_checkPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-23
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

private _results = [];
private _result = false;
private _data = KPLIB_permission_data getVariable [toLower _permission, []];

// Execute the registered code
{
    _results pushBack ([] call _x);
} forEach (_data select 0);

if (true in _results) then {
    _result = true;
};

_result
