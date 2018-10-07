

/*
    KPLIB_fnc_build_start

    File: fn_build_start.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-09-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Starts KP Liberation building mode

    Parameter(s):
        0: ARRAY - Center position of build area
        1: NUMBER - Allowed build radius

    Returns:
    LOCATION - Building logic object
*/
params [
    ["_center", nil, [[]]],
    ["_radius", nil, [0]]
];

// Animate player
player playactionnow "gear";

private _logic = [] call CBA_fnc_createNamespace;
KPLIB_buildLogic = _logic;

// Initialize all variables used by logic
{
    _logic setVariable _x;
} forEach [
    // General
    ["buildMode", nil],
    ["buildItem", []],
    ["buildQueue", []],
    ["center", _center],
    ["radius", _radius],
    ["cursorPos", []],
    ["areaIndicators", [_center, _radius] call KPLIB_fnc_build_markArea],
    ["camera", [_center, _radius] call KPLIB_fnc_build_camCreate],
    ["display", displayNull],
    // Keys
    ["altKey", false],
    ["ctrlKey", false],
    ["shiftKey", false],
    ["leftMouse", false],
    ["rightMouse", false],
    ["mousePos", [0.5, 0.5]]
];

// Draw bounding boxes for objects in queue
[] call KPLIB_fnc_build_boundingBoxPFH;

(findDisplay 46) createDisplay "KPLIB_build";

_logic
