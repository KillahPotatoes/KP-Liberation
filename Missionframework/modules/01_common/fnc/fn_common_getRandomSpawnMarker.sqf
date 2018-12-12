/*
    KPLIB_fnc_common_getRandomSpawnMarker

    File: fn_common_getRandomSpawnMarker.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-11
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Gets a random marker from KPLIB_sectors_airspawn or KPLIB_sectors_spawn with given distances to other sectors.

    Parameter(s):
        _markersArray   - Array of markers. KPLIB_sectors_airspawn or KPLIB_sectors_spawn   [BOOL, defaults to false]
        _minDistE       - Minimum distance to any enemy sector                              [NUMBER, defaults to 300]
        _minDistF       - Minimum distance to any friendly sector                           [NUMBER, defaults to 300]

    Returns:
        Selected map marker [STRING]
*/

params [
    ["_markersArray", [], [[]]],
    ["_minDistE", 300, [0]],
    ["_minDistF", 300, [0]]
];

// Return empty string, when the provided markers array is empty
if (_markersArray isEqualTo []) exitWith {""};

// Make a copy of the markers array
_markersArray = +_markersArray;

// Select one random available marker
private _marker = _markersArray deleteAt (floor random count _markersArray);

// First check if all blufor sectors are far enough away from selected marker
if (KPLIB_sectors_blufor findIf {((markerPos _x) distance2D (markerPos _marker)) < _minDistF} != -1) exitWith {
    [_markersArray, _minDistE, _minDistF] call KPLIB_fnc_common_getRandomSpawnMarker;
};

// Now check the same for all enemy sectors
if ((KPLIB_sectors_all - KPLIB_sectors_blufor) findIf {((markerPos _x) distance2D (markerPos _marker)) < _minDistE} != -1) exitWith {
    [_markersArray, _minDistE, _minDistF] call KPLIB_fnc_common_getRandomSpawnMarker;
};

// Return a random marker or an empty string, if conditions aren't met
_marker
