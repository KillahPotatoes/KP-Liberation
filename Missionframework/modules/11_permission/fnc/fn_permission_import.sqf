#include "script_component.hpp"
/*
    KPLIB_fnc_permission_import

    File: fn_permission_import.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-11
    Last Update: 2019-05-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Import the permission list from profileNamespace.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

private _list = +(profileNamespace getVariable ["KPLIB_permission_export", []]);

PSVAR("permissionList", _list);

[] call KPLIB_fnc_permission_setupPermissionControls;

true
