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

// Get all FOB vehicles
private _nearFOB = [] call KPLIB_fnc_common_getPlayerFob;
private _vehicles = (getMarkerPos _nearFOB) nearEntities [["LandVehicle", "Air", "Ship"], KPLIB_param_fobRange];

// Variables
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
        _ctrlVehicleList lbSetPicture [_index, "KPGUI\res\kp512_ca.paa"];
    } else {
        _ctrlVehicleList lbSetPicture [_index, _picture];
    };
} forEach _vehicles;

_ctrlVehicleList lbSetCurSel 0;

true
