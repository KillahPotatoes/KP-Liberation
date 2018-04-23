/*
    KPLIB_fnc_init_clientMarkers

    File: fn_init_clientMarkers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-30
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates all markers which need to be local on each client.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

private _marker = createMarkerLocal ["zone_capture", KPLIB_resetPos];
_marker setMarkerColorLocal "ColorUNKNOWN";
_marker setMarkerShapeLocal "Ellipse";
_marker setMarkerBrushLocal "SolidBorder";
_marker setMarkerSizeLocal [KPLIB_range_capture, KPLIB_range_capture];

_marker = createMarkerLocal ["spawn_marker", KPLIB_resetPos];
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerTypeLocal "Select";

true
