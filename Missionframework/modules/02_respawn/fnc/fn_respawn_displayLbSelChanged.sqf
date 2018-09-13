#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayLbSelChanged

    File: fn_respawn_displayLbSelChanged.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/
params [
    ["_spawnListCtrl", nil, [controlNull]],
    ["_selectedIndex", 0, [0]]
];

if (_selectedIndex == -1) then {
    _selectedIndex = 0;
};

private _display = ctrlParent _spawnListCtrl;
private _mapCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_MAP;
private _spawnPos = [_spawnListCtrl, _selectedIndex] call KPLIB_fnc_respawn_displayGetSpawnPos;

_mapCtrl ctrlMapAnimAdd [0, 0.3, _spawnPos];
ctrlMapAnimCommit _mapCtrl;

