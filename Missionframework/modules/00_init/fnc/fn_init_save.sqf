/*
    KPLIB_fnc_init_save

    File: fn_init_save.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-03-29
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Saves the current progress by firing the doSave event. After all registered handlers for this event are processed, it'll write the save data to the profile namespace.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Skip the saving process, if the campaign isn't running anymore
if (!KPLIB_campaignRunning) exitWith {false};

if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [%1] [SAVE] ----- Save function started -----", diag_tickTime];};

// Reset the current save data array
KPLIB_save_data = [];

// Fire the saving event
if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Firing save event...";};
["KPLIB_doSave"] call CBA_fnc_localEvent;

// Write save data array to profile namespace
if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Writing data to profile...";};
profileNamespace setVariable [KPLIB_save_key, KPLIB_save_data];
saveProfileNamespace;

if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [%1] [SAVE] ----- Save function finished -----", diag_tickTime];};

true
