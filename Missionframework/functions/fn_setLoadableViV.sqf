/*
    File: fn_setLoadableViV.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-08
    Last Update: 2020-04-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds ViV load/unload actions to object.

    Parameter(s):
        _object - Object to add actions to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_object", objNull, [objNull]]
];

if (isNull _object) exitWith {["Null object given"] call BIS_fnc_error; false};

private _loadFnc = {
    params ["_target"];

    (_target call KPLIB_fnc_getNearestViVTransport) setVehicleCargo _target;
};

// Add "Load" action
_object addAction [
    "<t color='#FFFF00'>" + localize "STR_ACTION_LOAD_VIV" + "</t>",
    _loadFnc,
    nil,
    -991,
    false,
    true,
    "",
    "(isNull objectParent player) && {!isNull (_target call KPLIB_fnc_getNearestViVTransport)}",
    10
];

// Add "No transports nearby action"
_object addAction [
    "<t color='#FF0000'>" + localize "STR_ACTION_NOTRANSPORT_VIV" + "</t>",
    {},
    nil,
    -991,
    false,
    true,
    "",
    "(isNull objectParent player) && {isNull (_target call KPLIB_fnc_getNearestViVTransport)} && {isNull isVehicleCargo _target}",
    10
];

private _unloadFnc = {
    params ["_target"];

    objNull setVehicleCargo _target;
};

// Add "Unload" action
_object addAction [
    "<t color='#FFFF00'>" + localize "STR_ACTION_UNLOAD_VIV" + "</t>",
    _unloadFnc,
    nil,
    -991,
    false,
    true,
    "",
    "(isNull objectParent player) && {!isNull isVehicleCargo _target}",
    10
];

true
