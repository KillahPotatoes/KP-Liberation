/*
    KPPLM_fnc_create

    File: fn_create.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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
[{!dialog}, {call KPPLM_fnc_openDialog;}] call CBA_fnc_waitUntilAndExecute;

true
