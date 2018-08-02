/*
    KPLIB_fnc_init_save

    File: fn_init_save.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-03-29
    Last Update: 2018-08-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Saves the current progress by calling the module specific save functions. After receiving the data from the modules, it'll be saved in the profile namespace.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Catch the rare situation that the win condition is met, but the save process is fired and therefore the save isn't wiped.
if (!KPLIB_campaignRunning) exitWith {false};

// Skip the saving, if a save is imported by the admin
if (KPLIB_save_imported) exitWith {false};

if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - Save function started -----", diag_tickTime];};

// Call the save data fetch functions from each module and store them in a multidimensional array for saving
KPLIB_save_data = [
    call KPLIB_fnc_init_saveData
];

profileNamespace setVariable [KPLIB_save_key, KPLIB_save_data];
saveProfileNamespace;

if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - Save function finished -----", diag_tickTime];};

true
