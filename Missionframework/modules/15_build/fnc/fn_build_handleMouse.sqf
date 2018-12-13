#include "..\ui\defines.hpp"
#include "script_components.hpp"
/*
    KPLIB_fnc_build_handleMouse

    File: fn_build_handleMouse.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle build display mouse movement events

    Parameter(s):
        _mode   - Mouse event name              [STRING, defaults to nil]
        _args   - Additonal event parameters    [ARRAY, defaults to nil]

    Returns:
        NOTHING
*/

params [
    ["_mode", nil, [""]],
    ["_args", nil, [[]]]
];

private _logic = KPLIB_buildLogic;

switch toLower _mode do {
    case "onmousebuttondown": {
        _args params ["_ctrl","_button"];

        private _buttonName = ["mouseLeft", "mouseRight"] select _button;
        LSVAR(_buttonName, true);

        if (_button isEqualTo 0) then {
            // If item is selected try to place it, handle selection/dragging otherwise
            if !(LGVAR(buildItem) call KPLIB_fnc_build_displayPlaceObject) then {
                // Delay selection a bit to allow for mouse dragging
                [{
                    if (!LGVAR(isDragging) && !LGVAR(isRotating)) then {
                        [LGVAR(cursorObject)] call KPLIB_fnc_build_addToSelection;
                    };
                }, [], 0.1] call CBA_fnc_waitAndExecute;
            };
        };
    };

    case "onmousebuttonup": {
        _args params ["_ctrl","_button"];

        private _buttonName = ["mouseLeft", "mouseRight"] select _button;
        LSVAR(_buttonName, false);

        if (LGVAR(isDragging)) then {
            // Move dragged objects to destination position
            [LGVAR(dragAnchorObject), true] call KPLIB_fnc_build_handleDrag;
        };

        if (LGVAR(isRotating)) then {
            // Rotate dragged objects
            [LGVAR(rotationAnchorObject), true] call KPLIB_fnc_build_handleRotation;
        };

    };
    case "onmousezchanged": {
        _args params ["_ctrl","_zChange"];
        if (true) exitWith {true};
    };

    case "onmousemoving": {
        _args params ["_ctrl","_x","_y"];

        // Enable camera movement when cursor not over dialog
        LGVAR(camera) camCommand "manual on";

        private _xy = [_x, _y];
        LSVAR("mousePos", _xy);

        LSVAR("cursorObject", [] call KPLIB_fnc_build_objectUnderCursor);

        if (LGVAR(isDragging) ||
            (!isNull LGVAR(cursorObject) && {(LGVAR(mouseLeft)) && {!LGVAR(shiftKey)} && !LGVAR(ctrlKey)})
        ) then {
            [LGVAR(dragAnchorObject)] call KPLIB_fnc_build_handleDrag;
        };

        // Handle rotation
        if (LGVAR(isRotating) ||
            (!isNull LGVAR(cursorObject) && {(LGVAR(mouseLeft)) && {LGVAR(shiftKey)} && !LGVAR(ctrlKey)})
        ) then {
            [LGVAR(rotationAnchorObject)] call KPLIB_fnc_build_handleRotation;
        };
     };

    case "onmouseholding": {
        _args params ["_ctrl","_x","_y"];

        private _xy = [_x, _y];
        LSVAR("mousePos", _xy);

        LSVAR("cursorObject", [] call KPLIB_fnc_build_objectUnderCursor);

        if !(isNull LGVAR(dragAnchorObject)) then {
            [LGVAR(dragAnchorObject)] call KPLIB_fnc_build_handleDrag;
        };

        // Handle rotation
        if !(isNull LGVAR(rotationAnchorObject)) then {
            [LGVAR(rotationAnchorObject)] call KPLIB_fnc_build_handleRotation;
        };
    };

    case "onmousezchanged_buildcategorylist";
    case "onmousezchanged_buildlist": {
        // Disable camera movement when scrolling over build dialog
        // TODO is there any better solution?
        LGVAR(camera) camCommand "manual off";

        [{
            LGVAR(camera) camCommand "manual on";
        }] call CBA_fnc_execNextFrame;
    };

    default {
        diag_log format ["[KP LIBERATION] [BUILD] Incorrect mode passed to handleMouse: %1", _mode]
    };

};
