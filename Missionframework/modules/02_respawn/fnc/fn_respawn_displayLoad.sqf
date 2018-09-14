#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayLoad

    File: fn_respawn_displayLoad.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-11
    Last Update: 2018-09-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handle respawn dialog load

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/
params [["_display", nil, [displayNull]]];

systemChat "Respawn onLoad";

// Make display unclosable if player is dead
if (!alive player) then {
    _display displayAddEventHandler ["KeyDown", {
        params ["_display","_dik","_shift","_ctrl","_alt"];
        if (_dik == 1) exitWith {
            [] spawn {
                private _interruptDisplay = (findDisplay 46) createDisplay "RscDisplayInterrupt";
                waitUntil {_interruptDisplay isEqualTo displayNull};
                [] call KPLIB_fnc_respawn_open;
            };
        };
    }];
};


// Get controls
private _loadoutsCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_LOADOUTS;
private _spawnListCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_SPAWNS;
private _mapCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_MAP;

// Fetch player loadouts and fill dropdown menu
private _loadoutsData = [];
{
    if (_forEachIndex % 2 == 0) then {
        _loadoutsData pushback _x;
    };
} forEach (profileNamespace getVariable "BIS_fnc_saveInventory_data");

_loadoutsCtrl lbAdd "--";
{
    _loadoutsCtrl lbAdd _x;
} forEach _loadoutsData;
_loadoutsCtrl lbSetCurSel 0;

// Fill respawns list with data
_display call KPLIB_fnc_respawn_displayUpdateList;
