/*
    KPLIB_fnc_logistic_refreshVehicles

    File: fn_logistic_refreshVehicles.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-25
    Last Update: 2019-01-31
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Refreshes the vehicle list.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 7580232;
private _ctrlVehicleList = _dialog displayCtrl 68740;

lbClear _ctrlVehicleList;

// Get all FOB vehicles
private _nearFOB = KPLIB_sectors_fobs select {(player distance2D (getMarkerPos _x)) < KPLIB_param_fobRange};
private _vehicles = (getMarkerPos (_nearFOB select 0) nearObjects KPLIB_param_fobRange) select {_x isKindOf "LandVehicle" || _x isKindOf "Air" || _x isKindOf "Ship"};

private _cfg = configFile >> "CfgVehicles";
private _type = "";
private _name = "";
private _index = 0;

// Add a blank entry
_index = _ctrlVehicleList lbAdd "----------";
_ctrlVehicleList lbSetData [_index, "placeholder"];

// Fill the list
{
    _type = typeOf _x;
    _name = getText (_cfg >> _type >> "displayName");
    _index = _ctrlVehicleList lbAdd format ["%1", _name];
    _ctrlVehicleList lbSetData [_index, netId _x];
    _picture = getText (_cfg >> _type >> "picture");
    if (_picture isEqualTo "pictureThing") then {
        _ctrlVehicleList lbSetPicture [_index, "KPGUI\res\kp512_CA.paa"];
    } else {
        _ctrlVehicleList lbSetPicture [_index, _picture];
    };
} forEach _vehicles;

_ctrlVehicleList lbSetCurSel 0;

true
