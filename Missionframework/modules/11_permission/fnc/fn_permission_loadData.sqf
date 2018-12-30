/*
    KPLIB_fnc_permission_loadData

    File: fn_permission_loadData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-09
    Last Update: 2018-12-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads data which is bound to the this module from the given save data or initializes needed data for a new campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Permission module loading...";};

private _moduleData = ["permission"] call KPLIB_fnc_init_getSaveData;

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
    if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Permission module data empty, creating new data...";};

} else {
    // Otherwise start applying the saved data
    if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Permission module data found, applying data...";};
    KPLIB_permission_list = _moduleData select 0;
    KPLIB_permission_default = _moduleData select 1;
};

[KPLIB_permission_list, KPLIB_permission_default, [], []] call KPLIB_fnc_permission_syncClients;

true
