#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayGetSpawnPos

    File: fn_respawn_displayGetSpawnPos.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Extracts currently selected respawn position

    Parameter(s):
        0: CONTROL - Respawn positions listbox

    Returns:
    ARRAY - Position
*/
params [
    ["_spawnListCtrl", nil, [controlNull, displayNull]],
    ["_selectedIndex", 0, [0]]
];

if (_spawnListCtrl isEqualType displayNull) then {
    _spawnListCtrl = _spawnListCtrl displayCtrl KPLIB_IDC_RESPAWN_SPAWNS;
    _selectedIndex = lbCurSel _spawnListCtrl;
};

private _selectedItemArray = ([] call KPLIB_fnc_respawn_getRespawns) select _selectedIndex;

private _selectedItem = _selectedItemArray param[1, nil, ["", objNull,[]], 3];

private _pos = nil;
// Get position depending of type of respawn item
switch true do {
    case (_selectedItem isEqualType ""): {
        _pos = getMarkerPos _selectedItem;
    };

    case (_selectedItem isEqualType objNull): {
        _pos = getPosATL _selectedItem;
    };

    case (_selectedItem isEqualType []): {
        _pos = _selectedItem;
    };
};

_pos
