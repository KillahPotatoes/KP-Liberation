#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_logistic_refreshTargets

    File: fn_logistic_refreshTargets.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-25
    Last Update: 2019-05-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Refreshes the vehicle list for the given dialog.

    Parameter(s):
        _dialogId   - The dialog id     [Number, defaults to 0]
        _ctrlId     - The control id    [Number, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_dialogId", 0, [0]],
    ["_ctrlId", 0, [0]]
];

// Dialog controls
private _dialog = findDisplay _dialogId;
private _ctrlVehicleList = _dialog displayCtrl _ctrlId;

lbClear _ctrlVehicleList;

// Variables
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _cfgVeh = configFile >> "CfgVehicles";
private _type = "";
private _name = "";
private _index = 0;
private _objects = [];
private _blacklist = [
    KPLIB_preset_crateSupplyE,
    KPLIB_preset_crateSupplyF,
    KPLIB_preset_crateAmmoE,
    KPLIB_preset_crateAmmoF,
    KPLIB_preset_crateFuelE,
    KPLIB_preset_crateFuelF,
    KPLIB_logistic_building,
    "GroundWeaponHolder",
    "WeaponHolderSimulated",
    "Camera",
    ""
];

// Add a blank entry
_index = _ctrlVehicleList lbAdd "----------";
_ctrlVehicleList lbSetData [_index, "placeholder"];

// Detect the dialog type and select all objects dependent on the settings
if (_dialogId isEqualTo KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG) then {
    // If recycle dialog is open
    _objects = ((getMarkerPos _nearFOB) nearObjects KPLIB_param_fobRange) select {
        !(typeOf _x in _blacklist) &&
        !((typeOf _x select [0,1]) isEqualTo "#") &&
        !(_x isKindOf "Building") &&
        !(_x isKindOf "Man")
    };
} else {
    // If resupply dialog is open
    if (KPLIB_param_aceResupply) then {
        {
            _type = typeOf _x;
            _ammoMax = getNumber (_cfgVeh >> _type >> "ace_rearm_defaultSupply");
            _fuelMax = getNumber (_cfgVeh >> _type >> "ace_refuel_fuelCargo");
            if (_ammoMax != 0 || _fuelMax != 0) then {
                _objects pushBack _x;
            };
        } forEach ((getMarkerPos _nearFOB) nearEntities [["LandVehicle", "Air", "Ship"], KPLIB_param_fobRange]);
    } else {
        _objects = (getMarkerPos _nearFOB) nearEntities [["LandVehicle", "Air", "Ship"], KPLIB_param_fobRange];
    };
};

// Fill the controls
{
    _type = typeOf _x;
    _index = _ctrlVehicleList lbAdd (getText (_cfgVeh >> _type >> "displayName"));
    _ctrlVehicleList lbSetData [_index, netId _x];
    _picture = getText (_cfgVeh >> _type >> "picture");
    if (_picture isEqualTo "pictureThing") then {
        _ctrlVehicleList lbSetPicture [_index, "KPGUI\res\kp512_ca.paa"];
    } else {
        _ctrlVehicleList lbSetPicture [_index, _picture];
    };
} forEach _objects;

_ctrlVehicleList lbSetCurSel 0;

true
