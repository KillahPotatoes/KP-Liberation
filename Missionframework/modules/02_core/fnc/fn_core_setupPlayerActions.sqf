/*
    KPLIB_fnc_common_setupPlayerActions

    File: fn_common_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-28
    Last Update: 2019-09-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Initialization of actions availible to players.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Actions avalible LOCALLY to player
if (hasInterface) then {
    // FOB redeploy action
    private _fobRedeployCondition = '_target isEqualTo _originalTarget && !(_originalTarget getVariable ["KPLIB_fob", ""] isEqualTo "")';
    private _actionArray = [localize "STR_KPLIB_ACTION_REDEPLOY", {["KPLIB_respawn_requested", _this] call CBA_fnc_localEvent}, nil, -801, false, true, "", _fobRedeployCondition, 10];
    [_actionArray] call CBA_fnc_addPlayerAction;
};

true
