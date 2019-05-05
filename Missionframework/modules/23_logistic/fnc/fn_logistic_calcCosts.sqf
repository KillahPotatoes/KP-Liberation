#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_logistic_calcCosts

    File: fn_logistic_calcCosts.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-23
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Calculates the costs of the resupply action.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_LOGISTIC_RESUPPLY_DIALOG;
private _ctrlCargo = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_COMBOCARGO;
private _ctrlCosts = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_CARGOCOSTSVALUE;
private _ctrlSlider = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_RESUPPLYCOUNT;
private _ctrlSliderValue = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_SLIDERVALUE;
private _ctrlTotalCosts = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_TOTALCOSTSVALUE;
private _resupplyButton = _dialog displayCtrl KPLIB_IDC_LOGISTIC_RESUPPLY_BUTTONRESUPPLY;

// Read the controls
private _costs = parseNumber (ctrlText _ctrlCosts);
private _count = round (sliderPosition _ctrlSlider);

// Variables
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _res = [_nearFOB] call KPLIB_fnc_resources_getResTotal;
private _check = false;

// Fill the controls
_index = lbCurSel _ctrlCargo;
if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ctrlTotalCosts ctrlSetText str (_costs * _count);
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 1) >= (_costs * _count));
        };
        case "FUEL": {
            _ctrlTotalCosts ctrlSetText str (_costs * _count);
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 2) >= (_costs * _count));
        };
    };
} else {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _count = (ceil (_count / 100)) * 100;
            _ctrlTotalCosts ctrlSetText str (_costs * (_count / 100));
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 1) >= (_costs * (_count / 100)));
        };
        case "FUEL": {
            _count = (ceil (_count / 1000)) * 1000;
            _ctrlTotalCosts ctrlSetText str (_costs * (_count / 1000));
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 2) >= (_costs * (_count / 1000)));
        };
    };
};

//Check if the resupply selection is 0
if !(_count isEqualTo 0) then {
    _resupplyButton ctrlEnable true;
} else {
    _resupplyButton ctrlEnable false;
};

// Final check if enough resources available
if !(_check) then {
    _resupplyButton ctrlEnable false;
    [
        ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
        [localize "STR_KPLIB_HINT_NOTENOUGHRESOURCES"]
    ] call CBA_fnc_notify;
} else {
    _resupplyButton ctrlEnable true;
};

true
