/*
    KPLIB_fnc_permission_resetToDefault

    File: fn_permission_resetToDefault.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-23
    Last Update: 2018-12-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Resets all permissions to default.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

{
    _x set [2, KPLIB_permission_default];
} forEach KPLIB_permission_list;

closeDialog 0;

[{[] call KPLIB_fnc_permission_openDialog;}, [], 0.1] call CBA_fnc_waitAndExecute;

true
