/*
    KPLIB_fnc_arsenal_setupPlayerActions

    File: fn_arsenal_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-14
    Last Update: 2018-12-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Initialization of actions availible to players.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Actions avalible LOCALLY to player
// Arsenal action
private _arsenalCondition = '_target isEqualTo _originalTarget && !(_originalTarget getVariable ["KPLIB_fob", ""] isEqualTo "")';
private _actionArray = [localize "STR_KPLIB_ACTION_ARSENAL", {[] call KPLIB_fnc_arsenal_openDialog}, nil, -801, false, true, "", _arsenalCondition, 10];
[_actionArray] call CBA_fnc_addPlayerAction;

true
