#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayGetSpawnPos

    File: fn_respawn_displayGetSpawnPos.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:


    Parameter(s):
        0: STRING/OBJECT/ARRAY - Respawn positions listbox

    Returns:
    ARRAY - Position
*/
params [["_positionItem", nil, ["", objNull,[]], 3]];

private _pos = nil;

// Get position depending of type of respawn item
switch typeName _positionItem do {
    case "STRING": {
        _pos = getMarkerPos _positionItem;
    };

    case "OBJECT": {
        _pos = getPosATL _positionItem;
    };

    case "ARRAY": {
        _pos = _positionItem;
    };
};

_pos
