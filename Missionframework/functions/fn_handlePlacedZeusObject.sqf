/*
    File: fn_handlePlacedZeusObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-11
    Last Update: 2020-04-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Applies all KP Liberation values and functionalities for crates, units and vehicles.

    Parameter(s):
        _obj - Object to add the functionalities and values to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/
params [
    ["_obj", objNull, [objNull]]
];

// Identify kind of placed object once
private _unit = _obj in allUnits;
private _vehicle = _obj in vehicles;
private _crate = (toLower (typeOf _obj)) in KPLIB_crates;

// Exit if building and no resource crate
if !(_unit || _vehicle || _crate) exitWith {false};

// For a vehicle apply clear cargo
if (_vehicle) then {
    [_obj] call KPLIB_fnc_clearCargo;

    // Add kill manager and object init to possible crew units
    {
        _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
        [_x] call KPLIB_fnc_addObjectInit;
    } forEach (crew _obj);
};

// Apply kill manager, if it's not a crate
if !(_crate) then {
    _obj addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
} else {
    // Otherwise apply all needed values/functionalities
    _obj setMass 500;
    _obj setVariable ["KP_liberation_crate_value", 100, true];
    [_obj, true] call KPLIB_fnc_clearCargo;
    if (KP_liberation_ace) then {[_obj, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};
};

// Add object init codes
[_obj] call KPLIB_fnc_addObjectInit;

true
