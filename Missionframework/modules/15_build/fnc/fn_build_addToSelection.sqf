#include "script_components.hpp"
/*
    KPLIB_fnc_build_addToSelection

    File: fn_build_addToSelection.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Manages selection depending on currently pressed keys.

    Parameter(s):
        _selection - Items to add to selection [OBJECT or ARRAY, defaults to objNull]

    Returns:
       Selection was changed [BOOLEAN]
*/

params [
    ["_selection", objNull, [objNull, []]]
];

private _selectionArray = LGVAR(selection);
private _ctrlKey = LGVAR(ctrlKey);

// Unselect if no ctrl and selection is null
if (isNull _selection) exitWith {
    if (!_ctrlKey) then {
        LSVAR("selection", []);
    };
    false
};

if (_selection isEqualType []) then {
    {
        _selectionArray pushBackUnique _x;
    } forEach _selection;
} else {
    // If ctrl is held append to selection
    if (_ctrlKey) then {
        _selectionArray pushBackUnique _selection;
    }
    else {
        LSVAR("selection", [_selection]);
    };
};

true
