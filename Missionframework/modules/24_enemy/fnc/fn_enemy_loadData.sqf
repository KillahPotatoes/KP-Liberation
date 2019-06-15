/*
    KPLIB_fnc_enemy_loadData

    File: fn_enemy_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Enemy module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["enemy"] call KPLIB_fnc_init_getSaveData;
private _state = "unaware";

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Enemy module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};
} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Enemy module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};

    KPLIB_enemy_strength = _moduleData select 0;
    KPLIB_enemy_awareness = _moduleData select 1;
    _state = _moduleData select 2;
};

// Start commander FSM
[_state] call KPLIB_fnc_enemy_commanderLogic;

true
