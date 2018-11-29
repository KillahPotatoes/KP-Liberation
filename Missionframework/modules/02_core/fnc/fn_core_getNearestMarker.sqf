/*
    KPLIB_fnc_core_getNearestMarker

    File: fn_core_getNearestMarker.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-26
    Last Update: 2018-11-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Get the nearest marker from given array within range of position.

    Parameter(s):
        _range      - Range to search for sectors                               [NUMBER, defaults to 0]
        _centerPos  - Center position from where to start searching for markers [POSITION, defaults to getPos player]
        _markers    - Array of markers to check                                 [ARRAY, defaults to KPLIB_sectors_all]

    Returns:
        Nearest marker [STRING]
*/

params [
    ["_range", 0, [0]],
    ["_centerPos", getPos player, [[]], 3],
    ["_markers", KPLIB_sectors_all, [[]]]
];


private _markersWithinRange =  _markers select {((markerPos _x) distance _centerPos) < _range};
private _markersAscByRange = [_markersWithinRange, [_centerPos], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy;
// Return nearest marker
if !(_markersAscByRange isEqualTo []) then {
    _markersAscByRange select 0
} else {
    ""
};
