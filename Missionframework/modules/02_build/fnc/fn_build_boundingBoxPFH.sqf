#include "script_components.hpp"
/*
    KPLIB_fnc_build_boundingBoxPFH

    File: fn_build_boundingBoxPFH.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creatae PFH used that draws bounding boxes of objects in queue

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

private _handle = [{
    params ["", "_handle"];

    if (isNull KPLIB_buildLogic) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    // Draw bounding box for every object in queue
    {
        private _underCursor = _x isEqualTo LGVAR(cursorObject);
        private _selected = _x in LGVAR(selection);

        // White by default
        private _color = [1,1,1,1];
        switch true do {
            // Cyan BB for selected under cursor
            case (_selected && _underCursor): {_color = [0,1,0.2,1]};
            // Yellow BB for unselected under cursor
            case _underCursor: {_color = [1,1,0,1]};
            // Green BB for selected
            case _selected: {_color = [0,1,0,1]};
        };

        [_x, _color] call KPLIB_fnc_build_drawBoundingBox;

    } forEach LGVAR(buildQueue);

}, 0] call CBA_fnc_addPerFrameHandler;
