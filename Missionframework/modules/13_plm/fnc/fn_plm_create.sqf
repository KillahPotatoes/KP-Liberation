/*
    KPLIB_fnc_plm_create

    File: fn_plm_create.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Creates a new group for the player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

private _grp = createGroup [(side player), true];
[player] join _grp;

// Refresh Dialog
closeDialog 0;
[{!dialog}, {call KPLIB_fnc_plm_openDialog;}] call CBA_fnc_waitUntilAndExecute;

true
