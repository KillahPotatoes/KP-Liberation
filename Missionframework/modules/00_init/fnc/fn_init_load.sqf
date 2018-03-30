/*
	KPLIB_fnc_init_load
	
	File: fn_init_load.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2018-03-29
	Last Update: 2018-03-29
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Loads save data or creates a new save depending on wipe settings or if there is no save data available.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

// Check for save wipe parameters
if (KPLIB_param_wipeSave1 == 1 && KPLIB_param_wipeSave2 == 1) then {
	call KPLIB_fnc_init_wipe;
};

// Load whole save data
KPLIB_save_data = profileNamespace getVariable KPLIB_save_key;

if !(isNil "KPLIB_save_data") then {
	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - Saved data loading -----", diag_tickTime];};
	
	// Load data via module specific data load functions 
	[KPLIB_save_data select 0] call KPLIB_fnc_init_loadData;

	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - Saved data loaded -----", diag_tickTime];};
} else {
	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - New campaign initializing -----", diag_tickTime];};
	
	// Call the load functions, which will generate a fresh campaign
	call KPLIB_fnc_init_loadData;

	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - New campaign initialized -----", diag_tickTime];};
};

KPLIB_save_loaded = true;
publicVariable "KPLIB_save_loaded";

true
