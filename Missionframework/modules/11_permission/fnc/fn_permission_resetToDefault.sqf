#include "script_component.hpp"
/*
    KPLIB_fnc_permission_resetToDefault

    File: fn_permission_resetToDefault.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-23
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Resets all permissions to default.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Variables
private _list = PGVAR("permissionList", []);
private _default = PGVAR("permissionDefault", []);

{
    _x set [2, _default];
} forEach _list;

// Set data in namespace
PSVAR("permissionList", _list);

[] call KPLIB_fnc_permission_setupPermissionControls;

true
