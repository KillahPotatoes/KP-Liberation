/*
    KPLIB_fnc_logistic_calcCosts

    File: fn_logistic_calcCosts.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-23
    Last Update: 2019-04-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Calculates the costs of the resupply action.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 7580233;
private _ctrlCargo = _dialog displayCtrl 68741;
private _ctrlCosts = _dialog displayCtrl 68743;
private _ctrlSlider = _dialog displayCtrl 68744;
private _ctrlSliderValue = _dialog displayCtrl 68745;
private _ctrlTotalCosts = _dialog displayCtrl 68746;
private _resupplyButton = _dialog displayCtrl 68747;

// Read the controls
private _costs = parseNumber (ctrlText _ctrlCosts);
private _count = round (sliderPosition _ctrlSlider);

// Prepare resource check
private _nearFOB = [player] call KPLIB_fnc_common_getPlayerFob;
private _res = [_nearFOB] call KPLIB_fnc_res_getResTotal;
private _check = false;

// Fill the controls
_index = lbCurSel _ctrlCargo;
if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ctrlTotalCosts ctrlSetText str (_costs * _count);
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 1) > (_costs * _count));
        };
        case "FUEL": {
            _ctrlTotalCosts ctrlSetText str (_costs * _count);
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 2) > (_costs * _count));
        };
    };
} else {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _count = (ceil (_count / 10)) * 10;
            _ctrlTotalCosts ctrlSetText str (_costs * (_count / 100));
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 1) > (_costs * (_count / 100)));
        };
        case "FUEL": {
            _count = (ceil (_count / 100)) * 100;
            _ctrlTotalCosts ctrlSetText str (_costs * (_count / 1000));
            _ctrlSliderValue ctrlSetText str _count;
            _check = ((_res select 2) > (_costs * (_count / 1000)));
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
