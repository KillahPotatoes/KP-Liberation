/*
	KP Liberation sector marker managing script
	
	File: sectorMarkers.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-27
	Last Update: 2017-10-28

	Description:
	This script will take care to apply general sector marker colors and create locked vehicle markers.
*/

waitUntil {!isNil "KPLIB_save_loaded"};

// Create locked vehicle markers
private _lockedVehMarkers = [];
private _cfg = configFile >> "CfgVehicles";

{
	private _vehicle = _x select 0;
	private _base = _x select 1;
	private _marker = createMarker ["lockedVehicle_" + _base, [markerPos _base select 0, (markerPos _base select 1) + 125]];

	_marker setMarkerText (getText (_cfg >> _vehicle >> "displayName"));
	_marker setMarkerShape "ICON";
	_marker setMarkerType "mil_pickup";
	_marker setMarkerColor KPLIB_preset_colorEnemy;

	_lockedVehMarkers pushBack [_marker, _base];
} forEach KPLIB_sectors_lockedVeh;

// Start loop to adjust marker colors
private _sectorCount = -1;

while {KPLIB_campaignRunning} do {
	waitUntil {uiSleep 2; (count KPLIB_sectors_blufor) != _sectorCount};

	{_x setMarkerColor KPLIB_preset_colorEnemy;} forEach (KPLIB_sectors_all - KPLIB_sectors_blufor);
	{_x setMarkerColor KPLIB_preset_colorPlayers;} forEach KPLIB_sectors_blufor;

	{
		private _nextMarker = _x;
		(_nextMarker select 0) setMarkerColor KPLIB_preset_colorEnemy;
		{
			if (_x == (_nextMarker select 1)) exitWith {(_nextMarker select 0) setMarkerColor KPLIB_preset_colorPlayers};
		} forEach (KPLIB_sectors_blufor select {_x in KPLIB_sectors_military});
	} forEach _lockedVehMarkers;

	_sectorCount = count KPLIB_sectors_blufor;
};
