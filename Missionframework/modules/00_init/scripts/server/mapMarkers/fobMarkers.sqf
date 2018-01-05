/*
	KP Liberation FOB marker managing script
	
	File: fobMarkers.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-28
	Last Update: 2017-10-28

	Description:
	Places and rearranges FOB map markers, if needed.
*/

waitUntil {!isNil "KPLIB_save_loaded"};

private _fobMarkers = [];

while {KPLIB_campaignRunning} do {
	waitUntil {uiSleep 2; (count _fobMarkers) != (count KPLIB_sectors_fobs)};

	{deleteMarker _x} forEach _fobMarkers;
	
	_fobMarkers = [];
	{
		private _marker = createMarker ["fob_" + str _forEachIndex, _x];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "b_hq";
		_marker setMarkerText format ["FOB %1", KPLIB_preset_alphabet select _forEachIndex];
		_marker setMarkerSize [1.5, 1.5];
		_marker setMarkerColor "ColorYellow";
		_fobMarkers pushBack _marker;
	} forEach KPLIB_sectors_fobs;
};
