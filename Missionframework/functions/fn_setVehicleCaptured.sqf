/*
    File: fn_setVehicleCaptured.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-10
    Last Update: 2020-04-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sets the captured variable on given vehicle, if the side of
        given unit is equal to player side.

    Parameter(s):
        _veh    - Vehicle to capture                [OBJECT, defaults to objNull]
        _unit   - Unit which entered the vehicle    [OBJECT, defaults to objNull]

    Returns:
        Vehicles is set to captured [BOOL]
*/

params [
    ["_veh", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

if (isNull _veh || isNull _unit) exitWith {["Null object given"] call BIS_fnc_error; false};

if !((side (group _unit)) isEqualTo GRLIB_side_friendly) exitWith {false};
if !((typeOf _veh) in all_hostile_classnames) exitWith {false};

if !(_veh getVariable ["GRLIB_captured", false]) exitWith {
    _veh setVariable ["GRLIB_captured", true, true];
};

true
