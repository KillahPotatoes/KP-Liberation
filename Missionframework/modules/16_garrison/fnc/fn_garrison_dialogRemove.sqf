#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_garrison_dialogRemove

    File: fn_garrison_dialogRemove.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-31
    Last Update: 2019-03-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Spawns infantry/vehicle and removes it from garrison array.

    Parameter(s):
        _button - Pressed button control [CONTROL, defaults to controlNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_button", controlNull, [controlNull]]
];

if (isNull _button) exitWith {false};

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_GARRISON_DIALOG;
private _ctrlLbSectors = _dialog displayCtrl KPLIB_IDC_GARRISON_GARRISONLIST;
private _ctrlInfButton = _dialog displayCtrl KPLIB_IDC_GARRISON_INFANTRYBUTTON;
private _ctrlLightButton = _dialog displayCtrl KPLIB_IDC_GARRISON_LIGHTBUTTON;
private _ctrlHeavyButton = _dialog displayCtrl KPLIB_IDC_GARRISON_HEAVYBUTTON;

// Initialize needed local variables
private _sector = _ctrlLbSectors lbData (lbCurSel _ctrlLbSectors);
private _sectorPos = [_sector] call KPLIB_fnc_common_getPos;
private _garrison = [_sector] call KPLIB_fnc_garrison_getGarrison;
private _side = KPLIB_preset_sideF;

// Handle Infantry
if (_button == _ctrlInfButton) exitWith {
    // Prevent button spam
    _ctrlInfButton ctrlEnable false;

    // Get amount of soldiers
    private _amount = parseNumber (ctrlText (_dialog displayCtrl KPLIB_IDC_GARRISON_INFANTRYBOX));

    // Only continue, if the amount of infantry is available
    if ((_garrison select 2) >= _amount) then {
        // Adjust garrison soldier count
        _garrison set [2, (_garrison select 2) - _amount];
        publicVariable "KPLIB_garrison_array";

        // Get array of soldier classnames
        private _soldierArray = [KPLIB_preset_sideF] call KPLIB_fnc_common_getSoldierArray;
        private _squads = [];

        // Prepare infantry squads for spawning
        while {_amount > 0} do {
            private _currentSoldiers = _amount min 6;
            private _classnames = [];
            for "_i" from 1 to _currentSoldiers do {
                _classnames pushBack (selectRandom _soldierArray);
            };
            _squads pushBack _classnames;
            _amount = _amount - _currentSoldiers;
        };

        // Schedule spawning
        {
            private _spawnPos = [_sectorPos] call KPLIB_fnc_garrison_getVehSpawnPos;
            [{_this call KPLIB_fnc_common_createGroup;}, [_x, _spawnPos, _side], _forEachIndex] call CBA_fnc_waitAndExecute;
        } forEach _squads;

        // Reload sector details
        [lbCurSel _ctrlLbSectors] call KPLIB_fnc_garrison_dialogSelectSector;
        true
    } else {
        // Notify player that there are not enough infantry units at the sector
        hint localize "STR_KPLIB_HINT_NOTATGARRISON";
        [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
        _ctrlInfButton ctrlEnable true;
        false
    };
};

// Handle Light Vehicles
if (_button == _ctrlLightButton) exitWith {
    hint format ["Light from %1", markerText _sector];
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    true
};

// Handle Heavy Vehicles
if (_button == _ctrlHeavyButton) exitWith {
    hint format ["Heavy from %1", markerText _sector];
    [{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;
    true
};

false
