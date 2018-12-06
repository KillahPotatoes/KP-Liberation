/*
    KPLIB_fnc_build_setupPlayerActions

    File: fn_build_setupPlayerActions.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Initialization of actions availible to players.

    Parameter(s):
        NONE

    Returns:
        Actions were set up [BOOL]
*/

// Actions avalible LOCALLY to player
if(hasInterface) then {
    // Build action
    private _buildCondition = '_target == _originalTarget && !(_originalTarget getVariable ["KPLIB_fob", ""] in ["", "KPLIB_eden_startbase_marker"])';
    private _buildAction = {
        private _pos = getMarkerPos (player getVariable "KPLIB_fob");
        [_pos, KPLIB_param_fobRange] call KPLIB_fnc_build_start;
    };

    private _actionArray = [localize "STR_KPLIB_ACTION_BUILD", _buildAction, nil, -802, false, true, "", _buildCondition, 10];
    [_actionArray] call CBA_fnc_addPlayerAction;
};

true
