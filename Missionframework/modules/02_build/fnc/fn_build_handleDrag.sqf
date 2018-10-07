#include "script_components.hpp"
/*
    KPLIB_fnc_

    File: fn_build_handleDrag.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
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

if (_updatePos) then {
    LSVAR(isDragging, false);

    // Move all selected objects to target positions
    {
        private _targetPos = _x getVariable ["KPLIB_dragPos", []];

        if !(_targetPos isEqualTo []) then {
            _x setPosASL _targetPos;
        };

    } forEach LGVAR(selection);
};

// Drag start
if (isNull _anchorObject) then {

    // If selection is empty or currently dragged object not in selection
    if (LGVAR(selection) isEqualTo [] || !(LGVAR(cursorDragStartObject) in LGVAR(selection))) then {
        [LGVAR(cursorDragStartObject)] call KPLIB_fnc_build_addToSelection;
    };

    LSVAR(cursorAnchorObject, LGVAR(cursorDragStartObject));

} else {
    systemChat str _anchorObject;

    private _mouseWorldPos = AGLToASL screenToWorld LGVAR(mousePos);
    private _anchorPos = getPosASL LGVAR(cursorAnchorObject);

    {
        private _object = _x;
        private _posASL = getPosASL _object;

        private _targetPos = _mouseWorldPos;
        private _offset = [0, 0, 0];

        // Calculate offset for objects in selection
        if (_x != LGVAR(cursorAnchorObject)) then {
            _offset = _posASL vectorDiff _anchorPos;
            _targetPos = _targetPos vectorAdd _offset;
        };

        _object setVariable ["KPLIB_dragPos", _targetPos];

    } forEach LGVAR(selection);
};
