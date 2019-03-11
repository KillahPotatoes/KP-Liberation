/*
    KPLIB_fnc_persistence_loadData

    File: fn_example_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-03-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads data which is bound to persistence module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Persistence module loading...";};

private _moduleData = ["persistence"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {diag_log text "[KP LIBERATION] [SAVE] Persistence module data empty, creating new data...";};

    KPLIB_persistenceHash = [[], []] call CBA_fnc_hashCreate;

} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {diag_log text "[KP LIBERATION] [SAVE] Persistence module data found, applying data...";};

    KPLIB_persistenceHash = +_moduleData;
};

true
