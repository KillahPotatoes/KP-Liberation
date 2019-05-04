#include "script_component.hpp"
/*
    KPLIB_fnc_permission_checkPermission

    File: fn_permission_checkPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Checks the given permission and executes the registered code.

    Parameter(s):
        _permission - Permission name                                                           [STRING, defaults to ""]
        _unanimous  - Operator which will be used for the code check (false = ||, true = &&)    [BOOL, defaults to false]
        _target     - Target player                                                             [OBJECT, defaults to objNull]

    Returns:
        Result of the registered code [BOOL]
*/

params [
    ["_permission", "", [""]],
    ["_unanimous", false, [false]],
    ["_target", player, [objNull]]
];

if (!KPLIB_param_permission || serverCommandAvailable "#kick") exitWith {
    true
};

// Variables
private _data = PGVAR(_permission, []);
private _codeResults = [];
private _result = [_permission, _target] call KPLIB_fnc_permission_getPermission;
private _code = _data select 0;

// Execute the registered code
{
    if !(_x isEqualTo {}) then {
        _codeResults pushBack [] call _x;
    } else {
        _codeResults pushBack false;
    }
} forEach _code;

// Return the result
if (_unanimous) then {
    ((({_x isEqualTo true} count _codeResults) isEqualTo (count _codeResults)) && _result)
} else {
    ((true in _codeResults) || _result)
};
