#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayUpdateRespawns

    File: fn_respawn_displayUpdateRespawns.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Update respawn positions listbox with available respawns

    Parameter(s):
        _display - Respawn display [DISPLAY, defaults to nil]

    Returns:
        Function reached the end [BOOL]
*/
params [
    ["_display", nil, [displayNull]]
];

private _spawnListCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_SPAWNS;
// Get available respawns
private _respawns = [] call KPLIB_fnc_respawn_getRespawns;
_display setVariable ["KPLIB_respawns", _respawns];

private _lastSelectedItem = _display getVariable "KPLIB_selRespawn";
_lastSelectedItem params ["_oldLabel", "_oldPos"];

// Select first item by default
private _selection = 0;

// Clear the list
lbClear _spawnListCtrl;
// Add entries to the list
{
    _x params ["_label", "_pos"];

    // Add label to list
    _spawnListCtrl lbAdd (_label);

    // Update current selection if old selected item found
    if (_pos isEqualTo _oldPos) then {
        _selection = _forEachIndex;
    };
} forEach _respawns;

// ["KPLIB_respawn_listFilled" [_spawnListCtrl]] call CBA_fnc_localEvent;

// Set selection
_spawnListCtrl lbSetCurSel _selection;

true
