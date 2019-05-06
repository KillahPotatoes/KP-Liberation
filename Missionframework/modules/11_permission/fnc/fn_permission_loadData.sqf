#include "script_component.hpp"
/*
    KPLIB_fnc_permission_loadData

    File: fn_permission_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to the this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Permission module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["permission"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Permission module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};

} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Permission module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};
    PSVAR("permissionList", _moduleData select 0);
    PSVAR("permissionDefault", _moduleData select 1);

};

true
