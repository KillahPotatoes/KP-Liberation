#include "script_components.hpp"
/*
    KPLIB_fnc_build_addToSelection

    File: fn_build_addToSelection.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds objects to selection

    Parameter(s):
        0: OBJECT/ARRAY - Object or array of objects to be added

    Returns:
    NOTHING
*/
params [
    ["_selection", objNull, [objNull, []]]
];

private _selectionArray = LGVAR(selection);
private _ctrlKey = LGVAR(ctrlKey);

if (_selection isEqualType objNull) then {
    // If ctrl is held append to selection
    if (_ctrlKey) then {
        _selectionArray pushBackUnique _selection;
    }
    else {
        // If no ctrl held and clicked on ground unselect all
        if(isNull _selection) then {
            LSVAR("selection", []);
        }
        // If no ctrl held select single object
        else {
            LSVAR("selection", [_selection]);
        }
    }
} else {
    {
        _selectionArray pushBackUnique _x;
    } forEach _selection;
};
