/*
    KPLIB_fnc_core_buildFob

    File: fn_core_buildFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-11
    Last Update: 2018-11-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates FOB on given position.

    Parameter(s):
        _buildPos   - Object or position where FOB has to be built  [ARRAY, defaults to []]

    Returns:
        Fob marker [STRING]
*/

params [
    ["_buildPos", [], [[]]]
];

private _marker = [_buildPos] call KPLIB_fnc_core_createFobMarker;
KPLIB_sectors_fobs pushBack _marker;
["KPLIB_fob_built", [_marker]] call CBA_fnc_globalEvent;

publicVariable "KPLIB_sectors_fobs";
[] call KPLIB_fnc_core_updateFobMarkers;

_marker
