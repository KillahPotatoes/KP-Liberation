#include "script_components.hpp"
/*
    KPLIB_fnc_build_handleRotation

    File: fn_build_handleRotation.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/
params [
    ["_anchorObject", objNull, [objNull]],
    ["_updateRot", false, [false]]
];

// Exit rotation drag and set direction of objects
if (_updateRot) exitWith {

    LSVAR("isRotating", false);

    // Move all selected objects to target positions
    {
        private _targetDir = _x getVariable ["KPLIB_rotationDir", []];

        if !(_targetDir isEqualTo []) then {
            _x setDir _targetDir;
        };

    } forEach LGVAR(selection);

    // Reset state variables
    LSVAR("rotationAnchorObject", objNull);
};

// Can't rotate while dragging
if (LGVAR(isDragging)) exitWith {};

// Rotation start
if (isNull _anchorObject) then {
    LSVAR("isRotating", true);

    // If selection is empty or currently dragged object not in selection
    if (LGVAR(selection) isEqualTo [] || !(LGVAR(cursorObject) in LGVAR(selection))) then {
        [LGVAR(cursorObject)] call KPLIB_fnc_build_addToSelection;
    };

    LSVAR("rotationAnchorObject", LGVAR(cursorObject));

} else {

    private _mouseWorldPos = AGLToASL screenToWorld LGVAR(mousePos);
    private _anchorPos = getPosASL LGVAR(rotationAnchorObject);

    {
        private _object = _x;
        private _posASL = getPosASL _object;
        private _dir = _posASL getDir _mouseWorldPos;

        _object setVariable ["KPLIB_rotationDir", _dir];

        private _startPos = _object modelToWorldVisual (_object selectionPosition "pelvis");
        private _endPos = (ASLtoAGL _mouseWorldPos);
        _endPos set [2, (_startPos select 2)];

        drawLine3D [
            _startPos,
            _endPos,
            [1,1,0,1] // Yellow
        ];

    } forEach LGVAR(selection);
};
