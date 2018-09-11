/*
    KPLIB_fnc_common_setupPlayerActions

    File: fn_common_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-28
    Last Update: 2018-09-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initialization of actions availible to players.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Actions avalible GLOBALLY on objects
if (isServer) then {
    // Add actions to supported vehicles
    ["KPLIB_vehicle_spawned", KPLIB_fnc_core_handleVehicleSpawn] call CBA_fnc_addEventHandler;
};

// Actions avalible LOCALLY to player
if(hasInterface) then {
    // FOB redeploy action
    private _fobRedeployCondition = '_target isEqualTo _originalTarget && !(_originalTarget getVariable ["KPLIB_fob", ""] isEqualTo "")';
    private _actionArray = [localize "STR_ACTION_REDEPLOY", {[] spawn KPLIB_fnc_core_redeploy}, nil, -801, false, true, "", _fobRedeployCondition, 10];
    [_actionArray] call CBA_fnc_addPlayerAction;
};

true
