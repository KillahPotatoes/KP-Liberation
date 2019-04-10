/*
    KPLIB_fnc_permission_resetToDefault

    File: fn_permission_resetToDefault.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-23
    Last Update: 2019-04-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Resets all permissions to default.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

private _list = KPLIB_permission_data getVariable ["permissionList", []];
private _default = KPLIB_permission_data getVariable ["permissionDefault", []];

{
    _x set [2, _default];
} forEach _list;

closeDialog 0;

// Set data in namespace
KPLIB_permission_data setVariable ["permissionList", _list, true];

[{[] call KPLIB_fnc_permission_openDialog;}, [], 0.1] call CBA_fnc_waitAndExecute;

true
