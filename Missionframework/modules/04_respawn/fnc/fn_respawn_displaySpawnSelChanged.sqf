#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displaySpawnSelChanged

    File: fn_respawn_displaySpawnSelChanged.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handle respawn list selection change

    Parameter(s):
        _spawnListCtrl      - Spawn list control    [CONTROL, defaults to nil]
        _selectedIndex      - Selected index        [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_spawnListCtrl", nil, [controlNull]],
    ["_selectedIndex", 0, [0]]
];

private _display = ctrlParent _spawnListCtrl;

// Get currently selected item
private _currentItem =  (_display getVariable "KPLIB_respawns") select _selectedIndex;

// Do nothing if selected item is the same or camera is not finished yet
if (_currentItem isEqualTo (_display getVariable "KPLIB_selRespawn") && !camCommitted KPLIB_respawn_camera) exitWith {};

// Set currently selected item
_display setVariable ["KPLIB_selRespawn", _currentItem];

// Update map
[_display] call KPLIB_fnc_respawn_displayFocusMap;


// Update camera position
private _camFocus = (_currentItem select 1);
private _camFocusPos = [_camFocus] call KPLIB_fnc_common_getPos;
// If focus position is not an object focus camera on static position
if !(_camFocus isEqualType objNull) then {
    _camFocus = _camFocusPos;
};

private _camHeading = random 360;
private _camStart = _camFocusPos getPos [200, _camHeading];
private _camEnd = _camFocusPos getPos [200, _camHeading + 180];
// Add 40 meters to initial Z
_camStart = _camStart vectorAdd [0,0, (_camFocusPos select 2) + 40];
_camEnd = _camEnd vectorAdd [0,0, (_camFocusPos select 2) + 40];

// Update build camera location
[_camStart, _camEnd, _camFocus, KPLIB_respawn_camera] call KPLIB_fnc_respawn_camFlyBy;

// Fade out effect
cutText ["", "BLACK IN", 2];

true
