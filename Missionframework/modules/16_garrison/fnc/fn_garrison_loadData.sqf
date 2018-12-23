/*
    KPLIB_fnc_

    File: fn_garrison_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-12-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads data which is bound to this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Garrison module loading...";};

private _moduleData = ["garrison"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Garrison module data empty, creating new data...";};

    // Initialize every sector and add the data to the garrison array
    {
        KPLIB_garrison_array pushBack ([_x] call KPLIB_fnc_garrison_initSector);
    } forEach KPLIB_sectors_all;
} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Garrison module data found, applying data...";};
    KPLIB_garrison_array = _moduleData select 0;
};

true
