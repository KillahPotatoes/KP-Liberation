/*
	KPLIB_fnc_init_save
	
	File: fn_init_save.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2018-03-29
	Last Update: 2018-03-29
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Saves the current progress after periodic save is triggered or after specific events in the mission.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - Save interval started -----", diag_tickTime];};

// Call the save data fetch functions from each module and store them in a multidimensional array for saving
KPLIB_save_data = [
	call KPLIB_fnc_init_saveData
];

profileNamespace setVariable [KPLIB_save_key, KPLIB_save_data];
saveProfileNamespace;

if (KPLIB_param_debugSave > 0) then {diag_log format ["[KP LIBERATION] [SAVE] ----- Time: %1 - Save interval finished -----", diag_tickTime];};

true
