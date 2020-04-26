/*
    KPPLM_fnc_rename

    File: fn_rename.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-08-05
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Set the new name for the group which is selected in the group list.

    Parameter(s):
    NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 75803;
private _ctrlGroupList = _dialog displayCtrl 758038;
private _ctrlEditName = _dialog displayCtrl 758039;
private _grp = KPPLM_groups select (lbCurSel _ctrlGroupList);

// Only allow change, when player is leader
if (leader _grp == player) then {
    _grp setGroupIdGlobal [ctrlText _ctrlEditName];

    // Refresh Dialog
    closeDialog 0;
    [{!dialog}, {call KPPLM_fnc_openDialog;}] call CBA_fnc_waitUntilAndExecute;
} else {
    hint localize "STR_KPPLM_NOTLEADER";
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
};

true
