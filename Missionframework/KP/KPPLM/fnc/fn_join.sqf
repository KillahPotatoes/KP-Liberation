/*
    KPPLM_fnc_join

    File: fn_join.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Joins the group which is currently selected in the group list.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 75803;
private _ctrlGroupList = _dialog displayCtrl 758038;

private _grp = KPPLM_groups select (lbCurSel _ctrlGroupList);
[player] join _grp;

// Refresh Dialog with a small delay
[{player in units (_this select 0)}, {closeDialog 0;}, [_grp]] call CBA_fnc_waitUntilAndExecute;
[{!dialog}, {call KPPLM_fnc_openDialog;}] call CBA_fnc_waitUntilAndExecute;

true
