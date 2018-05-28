/*
    KPLIB_fnc_common_setupPlayerActions

    File: fn_common_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-28
    Last Update: 2018-05-28
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
    // Actions on Vehicles
    ["vehicle_spawned", {
        params ["_vehicle"];

        switch(typeOf _vehicle) do {
            case KPLIB_preset_fobBox;
            case KPLIB_preset_fobTruck: {
                // Add FOB build action globaly and for JIP
                [
                    _vehicle,
                    [localize "STR_FOB_DEPLOY_ACTION", {[param [0], param [1], param[3]] call KPLIB_fnc_core_buildFob}, true /* Arguments */, -1000, false, false, "", "[_target, _this] call KPLIB_fnc_core_canBuildFob", 10]
                ] remoteExecCall ["addAction", 0, true];
            };

            case KPLIB_preset_potato: {
                // Add redeploy action globaly and for JIP
                [
                    _vehicle,
                    [localize "STR_REDEPLOY_ACTION", {[] spawn KPLIB_fnc_core_redeploy}, nil /* Arguments */, -1000, false, false, "", "vehicle player == player", 10]
                ] remoteExecCall ["addAction", 0, true];
            };
        };
    }] call KPLIB_fnc_event_addHandler;
};

// Actions avalible LOCALLY to player
if(hasInterface) then {
    ["player_fob", {
        params ["_player", "_fob"];

        private _redeployActionId = _player getVariable ["KPLIB_redeployActionId", nil];

        // Remove redeploy action if player had one avalible
        if (_fob isEqualTo "") then {
            if (!isNil "_redeployActionId") then {
                _player removeAction _redeployActionId;
                _player setVariable ["KPLIB_redeployActionId", nil];
            };
        } else {
            // If entered fob and had no action
            if (isNil "_redeployActionId") then {
                // Add action to player
                _redeployActionId = _player addAction [localize "STR_REDEPLOY_ACTION", {[] spawn KPLIB_fnc_core_redeploy}, nil /* Arguments */, -1000, false, false, "", "vehicle player == player", 10];
                // Save action id so it can we removed when out of FOB
                _player setVariable ["KPLIB_redeployActionId", _redeployActionId];
            };
        };
    }] call KPLIB_fnc_event_addHandler
};

true
