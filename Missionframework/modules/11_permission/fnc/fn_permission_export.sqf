#include "script_component.hpp"
/*
    KPLIB_fnc_permission_export

    File: fn_permission_export.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-11
    Last Update: 2019-05-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Export the permission list to profileNamespace.

    Parameter(s):
        NONE

    Returns:
        Permission list [ARRAY]
*/

private _list = +PGVAR("permissionList", []);

profileNamespace setVariable ["KPLIB_permission_export", _list];
saveProfileNamespace;

true
