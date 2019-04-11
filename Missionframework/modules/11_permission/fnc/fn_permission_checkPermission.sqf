#include "script_component.hpp"
/*
    KPLIB_fnc_permission_checkPermission

    File: fn_permission_checkPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2019-04-11
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

if (!KPLIB_param_permission || serverCommandAvailable "#kick") exitWith {
    true
};

// Variables
private _data = PGVAR(toLower _permission, []);
private _results = [];

// Execute the registered code
{
    _results pushBack ([] call _x);
} forEach (_data select 0);

(true in _results)
