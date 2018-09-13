/*
    KPLIB_fnc_respawn_displayUpdateList

    File: fn_respawn_displayUpdateList.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Update respawn positions listbox

    Parameter(s):
        0: CONTROL - Respawn positions listbox

    Returns:
    NOTHING
*/
params ["_spawnListCtrl"];

private _currentSelection = lbCurSel _spawnListCtrl;
if (_currentSelection == -1) then {
    _currentSelection = 0;
};

// Clear the list
lbClear _spawnListCtrl;
// Add entries to the list
{
    _spawnListCtrl lbAdd (_x select 0);
} forEach ([] call KPLIB_fnc_respawn_getRespawns);

// ["KPLIB_respawn_listFilled" [_spawnListCtrl]] call CBA_fnc_localEvent;

// Restore last selection
_spawnListCtrl lbSetCurSel _currentSelection;
