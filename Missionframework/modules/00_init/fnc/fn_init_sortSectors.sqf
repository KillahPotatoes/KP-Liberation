/*
	KPLIB_fnc_init_sortSectors

	File: fn_init_sortSectors.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Checks all map markers and sort them inside the specific sector arrays.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

{
	private _isMissionSector = false;
	private _tempMarker = toArray _x;
	
	// Fetch the Opfor spawn points
	_tempMarker resize 9;
	if (toString _tempMarker == "opfor_air") then {KPLIB_sectors_airspawn pushBack _x;};
	if (toString _tempMarker == "opfor_poi") then {KPLIB_sectors_opfor pushBack _x;};
	
	// Fetch the main mission sectors
	_tempMarker resize 3;
	switch (toString _tempMarker) do {
		case "mil": {KPLIB_sectors_military pushBack _x;_isMissionSector = true;};
		case "cap": {KPLIB_sectors_capture pushBack _x;_isMissionSector = true;};
		case "big": {KPLIB_sectors_bigtown pushBack _x;_isMissionSector = true;};
		case "fac": {KPLIB_sectors_factory pushBack _x;_isMissionSector = true;};
		case "tow": {KPLIB_sectors_tower pushBack _x;if (isServer) then {_x setMarkerText format ["%1 %2",markerText _x, mapGridPosition (markerPos _x)];};_isMissionSector = true;};
	};

	if (_isMissionSector) then {KPLIB_sectors_all pushBack _x;};
} forEach allMapMarkers;

// Send filled arrays to clients
publicVariable "KPLIB_sectors_airspawn";
publicVariable "KPLIB_sectors_opfor";
publicVariable "KPLIB_sectors_military";
publicVariable "KPLIB_sectors_capture";
publicVariable "KPLIB_sectors_bigtown";
publicVariable "KPLIB_sectors_factory";
publicVariable "KPLIB_sectors_tower";
publicVariable "KPLIB_sectors_all";

true
