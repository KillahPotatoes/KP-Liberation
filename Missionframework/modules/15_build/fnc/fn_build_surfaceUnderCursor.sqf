#include "script_components.hpp"
/*
    KPLIB_fnc_build_surfaceUnderCursor

    File: fn_build_surfaceUnderCursor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-04
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns surface that is directly under cursor.

    Parameter(s):
        _ignore1 - Item to ignore     [OBJECT, defaults to objNull]


    Returns:
        Position ASL and Surface normal underneath the cursor [ARRAY]
*/

params [
    ["_ignore", objNull, [objNull]]
];

private _camera = LGVAR(camera);
private _cursorPos = LGVAR(mousePos);

private _cursorWorldPosAGL = (screenToWorld _cursorPos);
private _cursorWorldPosASL = AGLtoASL _cursorWorldPosAGL;
private _camPos = getPosASLVisual _camera;

private _objects = lineIntersectsSurfaces [
    _camPos,
    _cursorWorldPosASL,
    LGVAR(camera),      // Ignore camera
    _ignore,            // Ignore item from params
    true,               // Closest to furthest
    1                   // Max one surface
];

if !(_objects isEqualTo []) exitWith {
    private _firstItem = (_objects select 0);
    // Position and surfaceNormal
    [_firstItem select 0, _firstItem select 1]
};

[_cursorWorldPosASL, surfaceNormal _cursorWorldPosASL]
