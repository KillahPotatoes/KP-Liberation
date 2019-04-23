/*
    KPLIB_fnc_example_loadData

    File: fn_example_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Loads data which is bound to this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {["Example module loading...", "SAVE"] call KPLIB_fnc_common_log;};

private _moduleData = ["example"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {["Example module data empty, creating new data...", "SAVE"] call KPLIB_fnc_common_log;};
    // Nothing to do here
} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {["Example module data found, applying data...", "SAVE"] call KPLIB_fnc_common_log;};
};

true
