#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_garrison_dialogAdd

    File: fn_garrison_dialogAdd.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-28
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Despawns unit/group and adds it to the sector garrison.

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
private _ctrlLbGroups = _dialog displayCtrl KPLIB_IDC_GARRISON_GROUPLIST;
private _ctrlGroupButton = _dialog displayCtrl KPLIB_IDC_GARRISON_GROUPBUTTON;
private _ctrlLbUnits = _dialog displayCtrl KPLIB_IDC_GARRISON_UNITLIST;
private _ctrlUnitButton = _dialog displayCtrl KPLIB_IDC_GARRISON_UNITBUTTON;

// Disable add buttons
{_x ctrlEnable false;} forEach [_ctrlGroupButton, _ctrlUnitButton];

// Get selected sector
private _sector = _ctrlLbSectors lbData (lbCurSel _ctrlLbSectors);

// Get the classname arrays
private _infantry = +KPLIB_preset_unitsPlF;
_infantry append KPLIB_preset_specOpsPlF;

private _lVehicles = +KPLIB_preset_vehLightUnarmedPlF;
_lVehicles append KPLIB_preset_vehLightArmedPlF;
_lVehicles append KPLIB_preset_vehTransPlF;

private _hVehicles = +KPLIB_preset_vehHeavyApcPlF;
_hVehicles append KPLIB_preset_vehHeavyPlF;
_hVehicles append KPLIB_preset_vehAntiAirPlF;
_hVehicles append KPLIB_preset_vehArtyPlF;

private _all = _infantry + _lVehicles + _hVehicles;

// Add unit vehicle to sector garrison
if (_button isEqualTo _ctrlGroupButton) then {
    KPLIB_garrison_dialogSelGroup params ["_group", "_units"];
    private _classnames = _units apply {typeOf _x};
    private _validClassnames = _classnames select {_x in _all};

    // Only proceed with a valid (buildable) units
    if ((count _classnames) isEqualTo (count _validClassnames)) then {
        if (KPLIB_param_debug) then {[format ["Adding group to garrison of %1: %2 (%3)", markerText _sector, _group, _classnames], "GARRISON"] call KPLIB_fnc_common_log;};

        // Despawn group
        {
            private _veh = _x;
            {_veh deleteVehicleCrew _x;} forEach (crew _veh);
            deleteVehicle _veh;
        } forEach _units;
        deleteGroup _group;

        // Add classnames to garrison
        private _infamount = 0;
        {
            switch (true) do {
                case (_x in _hVehicles): {
                    [_sector, _x, true] remoteExecCall ["KPLIB_fnc_garrison_addVeh", 2];
                };
                case (_x in _lVehicles): {
                    [_sector, _x] remoteExecCall ["KPLIB_fnc_garrison_addVeh", 2];
                };
                case (_x in _infantry): {
                    _infamount = _infamount + 1;
                };
            };
        } forEach _classnames;

        // Add counted infantry to garrison
        if (_infamount > 0) then {
            [_sector, _infamount] remoteExecCall ["KPLIB_fnc_garrison_addInfantry", 2];
        };
    } else {
        // Hint about invalid unit
        hint localize "STR_KPLIB_DIALOG_GARRISON_INVALID_NOTE";
        [{hintSilent "";}, [], 2] call CBA_fnc_waitAndExecute;
    };
} else {
    private _classname = typeOf KPLIB_garrison_dialogSelUnit;

    // Only proceed with a valid (buildable) unit
    if (_classname in _all) then {
        if (KPLIB_param_debug) then {[format ["Adding unit to garrison of %1: %2 (%3)", markerText _sector, KPLIB_garrison_dialogSelUnit, _classname], "GARRISON"] call KPLIB_fnc_common_log;};

        // Remove selected unit
        {KPLIB_garrison_dialogSelUnit deleteVehicleCrew _x;} forEach (crew KPLIB_garrison_dialogSelUnit);
        deleteVehicle KPLIB_garrison_dialogSelUnit;

        // Add unit to garrison
        switch (true) do {
            case (_classname in _hVehicles): {
                [_sector, _classname, true] remoteExecCall ["KPLIB_fnc_garrison_addVeh", 2];
            };
            case (_classname in _lVehicles): {
                [_sector, _classname] remoteExecCall ["KPLIB_fnc_garrison_addVeh", 2];
            };
            case (_classname in _infantry): {
                [_sector, 1] remoteExecCall ["KPLIB_fnc_garrison_addInfantry", 2];
            };
        };
    } else {
        // Hint about invalid unit
        hint localize "STR_KPLIB_DIALOG_GARRISON_INVALID_NOTE";
        [{hintSilent "";}, [], 2] call CBA_fnc_waitAndExecute;
    };
};

// Refresh dialog after a small sync delay
[{_this call KPLIB_fnc_garrison_dialogSelectSector;}, [lbCurSel _ctrlLbSectors], 2] call CBA_fnc_waitAndExecute;

true
