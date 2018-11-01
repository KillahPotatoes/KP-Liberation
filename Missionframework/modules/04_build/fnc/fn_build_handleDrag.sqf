#include "script_components.hpp"
/*
    KPLIB_fnc_build_handleDrag

    File: fn_build_handleDrag.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-11-01
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
    ["_updatePos", false, [false]]
];

// Exit position drag and set positions of objects
if (_updatePos) exitWith {

    LSVAR("isDragging", false);

    // Move all selected objects to target positions
    {
        private _targetPos = _x getVariable ["KPLIB_dragPos", []];
        _x setVariable ["KPLIB_dragPos", nil];

        if !(_targetPos isEqualTo []) then {
            _x setPosASL _targetPos;
        };

    } forEach LGVAR(selection);

    // Reset state variables
    LSVAR("dragAnchorObject", objNull);
};

// Can't drag while rotating
if (LGVAR(isRotating)) exitWith {};

// Drag start
if (isNull _anchorObject) then {
    LSVAR("isDragging", true);
    systemChat "Drag start";

    // If selection is empty or currently dragged object not in selection
    if (LGVAR(selection) isEqualTo [] || !(LGVAR(cursorObject) in LGVAR(selection))) then {
        [LGVAR(cursorObject)] call KPLIB_fnc_build_addToSelection;
    };

    LSVAR("dragAnchorObject", LGVAR(cursorObject));

} else {

    private _mouseWorldPos = AGLToASL screenToWorld LGVAR(mousePos);
    private _anchorPos = getPosASL LGVAR(dragAnchorObject);

    {
        private _posASL = getPosASL _x;

        private _targetPos = _mouseWorldPos;
        private _offset = [0, 0, 0];

        // Calculate offset for objects in selection
        if (_x != LGVAR(dragAnchorObject)) then {
            _offset = _posASL vectorDiff _anchorPos;
            _targetPos = _targetPos vectorAdd _offset;
        };

        _x setVariable ["KPLIB_dragPos", _targetPos];

    } forEach LGVAR(selection);
};
