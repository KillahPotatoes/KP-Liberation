#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayLbSelChanged

    File: fn_respawn_displayLbSelChanged.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-14
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


private _display = ctrlParent _spawnListCtrl;
// Get currently selected item
private _currentItem =  (_display getVariable "KPLIB_respawns") select _selectedIndex;

// Set currently selected item
_display setVariable ["KPLIB_currentItem", _currentItem];

