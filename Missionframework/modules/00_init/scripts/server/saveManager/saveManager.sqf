/*
	KP Liberation save manager script
	
	File: saveManager.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Loads save data or create a new save depending on wipe settings or if there is no save data available.
	Saves the current progress after periodic save is triggered or after specific events in the mission.
*/

// Check for save wipe parameters
if (KPLIB_param_wipeSave1 == 1 && KPLIB_param_wipeSave2 == 1) then {
	// Wipe saved data
	profileNamespace setVariable [KPLIB_save_key, nil];
	saveProfileNamespace;
	if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Save wiped";};
};

if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Save manager started"};

// Time controlled save trigger
KPLIB_save_trigger = false;
// Loaded save data
KPLIB_save_data = profileNamespace getVariable KPLIB_save_key;

if !(isNil "KPLIB_save_data") then {
	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Time: %1 - Saved data loading...", diag_tickTime];};
	
	// Load data via module specific data load functions 
	[KPLIB_save_data select 0] call KPLIB_fnc_init_loadData;

	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Time: %1 - Saved data loaded", diag_tickTime];};
} else {
	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Time: %1 - New campaign initializing...", diag_tickTime];};
	
	// Call the load functions, which will generate a fresh campaign
	call KPLIB_fnc_init_loadData;

	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Time: %1 - New campaign initialized", diag_tickTime];};
};

KPLIB_save_loaded = true;
publicVariable "KPLIB_save_loaded";

// Save loop
while {KPLIB_campaignRunning} do {
	waitUntil {uiSleep 1; KPLIB_save_trigger};
	KPLIB_save_trigger = false;

	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Time: %1 - Save interval started", diag_tickTime];};

	// Call the save data fetch functions from each module and store them in a multidimensional array for saving
	KPLIB_save_data = [
		call KPLIB_fnc_init_saveData
	];

	profileNamespace setVariable [KPLIB_save_key, KPLIB_save_data];
	saveProfileNamespace;

	if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Time: %1 - Save interval finished", diag_tickTime];};
};

diag_log format ["[KP LIBERATION] [IMPORTANT] Leaved save loop - KPLIB_campaignRunning: %1", KPLIB_campaignRunning];

// Wipe save if campaign is finished
if (!KPLIB_campaignRunning) then {
	diag_log "[KP LIBERATION] [IMPORTANT] Campaign finished. Save data wiped.";
	profileNamespace setVariable [KPLIB_save_key, nil];
	saveProfileNamespace;
};
