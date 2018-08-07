/*
    KPLIB_fnc_build_setupPlayerActions

    File: fn_build_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-08-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initialization of actions availible to players.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Actions avalible LOCALLY to player
if(hasInterface) then {
    ["player_fob", {
        params ["_player", "_fob"];

        private _buildActionId = _player getVariable ["KPLIB_actionId_build", nil];

        // Remove redeploy action if player had one avalible
        if (_fob isEqualTo "" || _fob isEqualTo "KPLIB_eden_startbase_marker") then {
            if (!isNil "_buildActionId") then {
                _player removeAction _buildActionId;
                _player setVariable ["KPLIB_actionId_build", nil];
            };
        } else {
            // If entered fob and had no action
            if (isNil "_buildActionId") then {
                // Add action to player
                _buildActionId = _player addAction [localize "STR_ACTION_FOB_BUILD", {[] spawn KPLIB_fnc_build_camOpen}, nil, -802, false, true, "", "vehicle player == player", 10];
                // Save action id so it can we removed when out of FOB
                _player setVariable ["KPLIB_actionId_build", _buildActionId];
            };
        };
    }] call KPLIB_fnc_event_addHandler
};

true
