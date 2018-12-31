

/*
    KPLIB_fnc_build_start

    File: fn_build_start.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-12-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Starts KP Liberation building mode

    Parameter(s):
        _center - Center of building area [POSITION, defaults to position player]
        _radius - Allowed building radius [NUMBER, defaults to KPLIB_param_fobRange]

    Returns:
        Building logic object [LOCATION]
*/

params [
    ["_center", position player, [[]], 3],
    ["_radius", KPLIB_param_fobRange, [0]]
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
    ["selectedCategoryIdx", nil],
    ["buildMode", 0],
    ["buildItem", []],
    ["buildQueue", []],
    ["buildables", KPLIB_build_categoryItems],
    ["center", _center],
    ["radius", _radius],
    ["areaIndicators", [_center, _radius] call KPLIB_fnc_build_markArea],
    ["camera", [_center, _radius] call KPLIB_fnc_build_camCreate],
    ["display", displayNull],
    ["selection", []],
    ["cursorObject", objNull],
    ["dragAnchorObject", objNull],
    ["rotationAnchorObject", objNull],
    // States
    ["isDragging", false],
    ["isRotating", false],
    // Keys
    ["altKey", false],
    ["ctrlKey", false],
    ["shiftKey", false],
    ["heldKeys", [] resize 255],
    ["mouseLeft", false],
    ["mouseRight", false],
    ["mousePos", [0.5, 0.5]]
];

// Draw bounding boxes for objects in queue
[] call KPLIB_fnc_build_boundingBoxPFH;
// Draw icons for objects in queue
[] call KPLIB_fnc_build_drawIconsPFH;

(findDisplay 46) createDisplay "KPLIB_build";

["KPLIB_build_start", [_logic, _center, _radius]] call CBA_fnc_localEvent;

_logic
