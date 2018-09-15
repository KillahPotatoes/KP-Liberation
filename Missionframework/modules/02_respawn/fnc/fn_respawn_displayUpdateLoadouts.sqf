#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_displayUpdateLoadouts

    File: fn_respawn_displayUpdateLoadouts.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-15
    Last Update: 2018-09-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
        0: DISPLAY - Respawn display

    Returns:
    NOTHING
*/
params [["_display", nil, [displayNull]]];

private _loadoutsCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_LOADOUTS;
// Fetch player loadouts and fill dropdown menu
private _loadoutsNames = [];
{
    if (_forEachIndex % 2 == 0) then {
        _loadoutsNames pushback _x;
    };
} forEach (profileNamespace getVariable "BIS_fnc_saveInventory_data");

_loadoutsCtrl lbAdd "--";
_loadoutsCtrl lbSetData [0, ""];
{
    _loadoutsCtrl lbAdd _x;
    _loadoutsCtrl lbSetData [(_forEachIndex+1), _x];
} forEach _loadoutsNames;

_loadoutsCtrl lbSetCurSel 0;
