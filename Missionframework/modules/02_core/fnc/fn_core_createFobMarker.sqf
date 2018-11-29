/*
    KPLIB_fnc_core_createFobMarker

    File: fn_core_createFobMarker.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-12
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates FOB marker

    Parameter(s):
        _position - Position where FOB has to be built [ARRAY, defaults to []]

    Returns:
        Marker name [STRING]
*/

params [
    ["_position", [], [[]], 3]
];

private _markerName = format ["KPLIB_fob_%1", mapGridPosition _position];

private _marker = createMarker [_markerName, _position];
        _marker setMarkerShape "ICON";
        _marker setMarkerType "b_hq";
        _marker setMarkerSize [1.5, 1.5];
        _marker setMarkerColor "ColorYellow";

_marker
