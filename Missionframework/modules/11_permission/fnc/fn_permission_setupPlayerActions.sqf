/*
    KPLIB_fnc_permission_setupPlayerActions

    File: fn_permission_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-14
    Last Update: 2019-03-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Initialization of actions availible to players.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Actions avalible LOCALLY to player
// Permission action
private _permissionCondition = '(_target isEqualTo _originalTarget && serverCommandAvailable "#kick")';

if (KPLIB_param_permissionCommander) then {
    _permissionCondition = _permissionCondition + '|| (_target isEqualTo _originalTarget && (str player) isEqualTo "KPLIB_eden_commander")';
};

if (KPLIB_param_permissionSubCommander) then {
    _permissionCondition = _permissionCondition + '|| (_target isEqualTo _originalTarget && (str player) isEqualTo "KPLIB_eden_subCommander")';
};

private _actionArray = [localize "STR_KPLIB_ACTION_PERMISSION", {[] call KPLIB_fnc_permission_openDialog}, nil, -801, false, true, "", _permissionCondition, 10];
[_actionArray] call CBA_fnc_addPlayerAction;

true
