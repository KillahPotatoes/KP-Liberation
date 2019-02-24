/*
    KPLIB_fnc_logistic_calcCosts

    File: fn_logistic_calcCosts.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-23
    Last Update: 2019-02-24
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
private _count = sliderPosition _ctrlSlider;

// Fill the controls
_index = lbCurSel _ctrlCargo;
if !(KPLIB_param_aceResupply) then {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ctrlTotalCosts ctrlSetText str (_costs * _count);
            _ctrlSliderValue ctrlSetText str _count;
        };
        case "FUEL": {
            _ctrlTotalCosts ctrlSetText str (_costs * _count);
            _ctrlSliderValue ctrlSetText str _count;
        };
    };
} else {
    switch (_ctrlCargo lbData _index) do {
        case "AMMO": {
            _ctrlTotalCosts ctrlSetText str (_costs * (_count / 100));
            _ctrlSliderValue ctrlSetText str _count;
        };
        case "FUEL": {
            _ctrlTotalCosts ctrlSetText str (_costs * (_count / 1000));
            _ctrlSliderValue ctrlSetText str _count;
        };
    };
};

if !(_count isEqualTo 0) then {
    _resupplyButton ctrlEnable true;
} else {
    _resupplyButton ctrlEnable false;
};

true
