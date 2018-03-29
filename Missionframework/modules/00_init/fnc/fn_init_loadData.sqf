/*
	KPLIB_fnc_init_loadData
	
	File: fn_init_loadData.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-03-29
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Loads data which is bound to the init module from the given save data or initializes needed data for a new campaign.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

params [["_moduleData",[]]];

if (KPLIB_param_debugSave > 0) then {diag_log "[KP LIBERATION] [SAVE] Init module loading...";};

// Check if there is a new campaign
if (_moduleData isEqualTo []) then {
	// Set random start date
	setDate [2018, ceil (random 12), ceil (random 28), 8, 0];

	// Connect locked vehicles to military bases
	private _assignedVehicles = [];
	private _assignedBases = [];
	while {((count _assignedVehicles) < (count KPLIB_preset_lockedVeh)) && ((count _assignedBases) < (count KPLIB_sectors_military))} do {
		private _nextVehicle =  selectRandom (KPLIB_preset_lockedVeh select {!(_x in _assignedVehicles)});
		private _nextBase =  selectRandom (KPLIB_sectors_military select {!(_x in _assignedBases)});
		_assignedVehicles pushBack _nextVehicle;
		_assignedBases pushBack _nextBase;
		KPLIB_sectors_lockedVeh pushBack [_nextVehicle, _nextBase];
	};
	publicVariable "KPLIB_sectors_lockedVeh";
} else {
	// Otherwise start applying the saved data

	// Set saved date and time
	setDate [
		(_moduleData select 0) select 0,
		(_moduleData select 0) select 1,
		(_moduleData select 0) select 2,
		(_moduleData select 0) select 3,
		(_moduleData select 0) select 4
	];

	// Check for deleted military sectors or deleted classnames in the locked vehicles array
	KPLIB_sectors_lockedVeh = _moduleData select 1;
	KPLIB_sectors_lockedVeh = KPLIB_sectors_lockedVeh select {(_x select 0) in KPLIB_preset_lockedVeh};
	KPLIB_sectors_lockedVeh = KPLIB_sectors_lockedVeh select {(_x select 1) in KPLIB_sectors_military};

	// Check for additions in the locked vehicles array
	private _lockedVehCount = count KPLIB_sectors_lockedVeh;
	if ((_lockedVehCount < (count KPLIB_sectors_military)) && (_lockedVehCount < (count KPLIB_preset_lockedVeh))) then {
		diag_log "[KP LIBERATION] [IMPORTANT] Additional military sectors or unlock vehicles detected and assigned.";
		private _assignedVehicles = [];
		private _assignedBases = [];

		{
			_assignedVehicles pushBack (_x select 0);
			_assignedBases pushBack (_x select 1);
		} forEach KPLIB_sectors_lockedVeh;

		while {((count _assignedVehicles) < (count KPLIB_preset_lockedVeh)) && ((count _assignedBases) < (count KPLIB_sectors_military))} do {
			private _nextVehicle =  selectRandom (KPLIB_preset_lockedVeh select {!(_x in _assignedVehicles)});
			private _nextBase =  selectRandom (KPLIB_sectors_military select {!(_x in _assignedBases)});
			_assignedVehicles pushBack _nextVehicle;
			_assignedBases pushBack _nextBase;
			KPLIB_sectors_lockedVeh pushBack [_nextVehicle, _nextBase];
		};
	};
	publicVariable "KPLIB_sectors_lockedVeh";

	// Publish blufor sectors
	KPLIB_sectors_blufor = _moduleData select 2;
	publicVariable "KPLIB_sectors_blufor";

	// Publish FOB positions
	KPLIB_sectors_fobs = _moduleData select 3;
	publicVariable "KPLIB_sectors_fobs";
};

true
