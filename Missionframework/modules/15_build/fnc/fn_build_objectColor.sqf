#include "script_components.hpp"
/*
    KPLIB_fnc_build_objectColor

    File: fn_build_objectColor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-28
    Last Update: 2018-11-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Get user interface item color depending on object state.

    Parameter(s):
        _object - Description [OBJECT, defaults to objNull]

    Returns:
        Color RGBA [ARRAY]
*/
params [
    ["_object", objNull, [objNull]]
];

private _underCursor = _object isEqualTo LGVAR(cursorObject);
private _selected = _object in LGVAR(selection);
private _invalidPos = !(_object getVariable ["KPLIB_validPos", true]);

private _color = switch true do {
    case _invalidPos: {[1, 0, 0, 1]};
    // Cyan color for selected and under cursor
    case (_selected && _underCursor): {[0, 1, 0.2, 1]};
    // Yellow color for unselected and under cursor
    case _underCursor: {[1, 1, 0, 1]};
    // Green color for selected
    case _selected: {[0, 1, 0, 1]};
    // White by default
    default {[1, 1, 1, 1]};
};

_color
