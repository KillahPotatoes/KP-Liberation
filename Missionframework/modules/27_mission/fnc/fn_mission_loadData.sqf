#include "script_component.hpp"
/*
    KPLIB_fnc_mission_loadData

    File: fn_mission_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-21
    Last Update: 2019-06-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to the this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Mission module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["mission"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Mission module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};

} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Mission module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};
    MSVAR("timeCheck", _moduleData select 0);

};

true
