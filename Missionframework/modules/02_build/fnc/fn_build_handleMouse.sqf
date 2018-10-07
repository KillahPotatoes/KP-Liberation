#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_build_handleMouse

    File: fn_build_handleMouse.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-09
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handle build display mouse movement events

    Parameter(s):
        0: STRING - Mouse move event
        1: ARRAY - Additional event arguments

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

        _logic setVariable [["mouseLeft", "mouseRight"] select _button, true];

        systemChat format ["mouseDown: %1", _logic getVariable (["mouseLeft", "mouseRight"] select _button)];

        // Place object if lmb
        if (_button == 0) then {
            (_logic getVariable "buildItem") call KPLIB_fnc_build_displayPlaceObject;

            (_logic getVariable "cursorObject") call KPLIB_fnc_build_addToSelection;
        };
    };

    case "onmousebuttonup": {
        _args params ["_ctrl","_button"];

        _logic setVariable [["mouseLeft", "mouseRight"] select _button, false];

        systemChat format ["mouseUp: %1", _logic getVariable (["mouseLeft", "mouseRight"] select _button)];
    };
    case "onmousezchanged": {
        _args params ["_ctrl","_zChange"];
        systemChat format ["zChange: %1", _zChange];

        if (true) exitWith {true};
    };

    case "onmousemoving": {
        _args params ["_ctrl","_x","_y"];

        _logic setVariable ["mousePos", [_x, _y]];

        _logic setVariable ["cursorObject", ([] call KPLIB_fnc_build_objectUnderCursor)];
     };

}
