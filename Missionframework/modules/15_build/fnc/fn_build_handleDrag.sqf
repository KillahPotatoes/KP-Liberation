#include "script_components.hpp"
/*
    KPLIB_fnc_build_handleDrag

    File: fn_build_handleDrag.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handles object mouse dragging

    Parameter(s):
        _anchorObject   - Drag dragging anchor object                       [OBJECT, defaults to objNull]
        _updatePos      - Dragging should be finished and positions updated [BOOL, defaults to false]

    Returns:
        Is dragging [BOOL]
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
        private _targetPos = _x getVariable ["KPLIB_dragPos", KPLIB_zeroPos];
        private _targetVectorUp = _x getVariable ["KPLIB_dragVectorUp", surfaceNormal _targetPos];
        // Zero target values
        _x setVariable ["KPLIB_dragPos", nil];
        _x setVariable ["KPLIB_dragVectorUp", nil];

        if !(_targetPos isEqualTo KPLIB_zeroPos) then {

            switch true do {
                case (surfaceIsWater _targetPos): {
                    _targetPos set [2, 0];
                    _x setPosASL _targetPos;
                    _x setVectorUp _targetVectorUp;
                };
                default {
                    _x setPosASL _targetPos;
                    _x setVectorUp _targetVectorUp;
                };
            };

        };

        // Notify that item needs position validity check
        ["KPLIB_build_item_moved", _x] call CBA_fnc_localEvent;

    } forEach LGVAR(selection);

    // Reset state variables
    LSVAR("dragAnchorObject", objNull);

    // Return value
    false
};

// Can't drag while rotating
if (LGVAR(isRotating)) exitWith {false};

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
    private _selection = LGVAR(selection);

    // Handle dragging when single selected (surface aligment)
    if((count _selection) isEqualTo 1) then {
        private _selectedItem = _selection select 0;

        // Get position and surface normal under the cursor
        ([_selectedItem] call KPLIB_fnc_build_surfaceUnderCursor) params ["_targetPos", "_targetVectorUp"];

        _selectedItem setVariable ["KPLIB_dragPos", _targetPos];
        _selectedItem setVariable ["KPLIB_dragVectorUp", _targetVectorUp];

    // Handle dragging when multiple selected
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
            _x setVariable ["KPLIB_dragVectorUp", surfaceNormal _targetPos];

        } forEach _selection;
    };
};

true
