/*
    KPLIB_fnc_core_createFobMarker

    File: fn_core_createFobMarker.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-12
    Last Update: 2018-05-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates FOB marker

    Parameter(s):
        0: ARRAY - Position where FOB has to be built.

    Returns:
    STRING - Marker name
*/
params ["_position"];

private _index = count KPLIB_sectors_fobs;

private _marker = createMarker ["KPLIB_fob_" + str _index, _position];
        _marker setMarkerShape "ICON";
        _marker setMarkerType "b_hq";
        _marker setMarkerText format ["FOB %1", KPLIB_preset_alphabet select (_index)];
        _marker setMarkerSize [1.5, 1.5];
        _marker setMarkerColor "ColorYellow";

_marker
