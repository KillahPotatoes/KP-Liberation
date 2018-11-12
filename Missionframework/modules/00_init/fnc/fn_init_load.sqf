/*
    KPLIB_fnc_init_load

    File: fn_init_load.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-03-29
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads save data from the profile namespace and fires the doLoad event.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [%1] [SAVE] ----- Load function started -----", diag_tickTime];};

// Check for save wipe parameters
if (KPLIB_param_wipeSave1 > 0 && KPLIB_param_wipeSave2 > 0) then {
    if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Wipe parameters enabled, wiping save data...";};
    [] call KPLIB_fnc_init_wipe;
};

// Load whole save data
KPLIB_save_data = profileNamespace getVariable [KPLIB_save_key, nil];

// Fire load event
if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Firing load event...";};
["KPLIB_doLoad"] call CBA_fnc_localEvent;

// Publish save loaded state
KPLIB_save_loaded = true;
publicVariable "KPLIB_save_loaded";

if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [%1] [SAVE] ----- Load function finished -----", diag_tickTime];};

true
