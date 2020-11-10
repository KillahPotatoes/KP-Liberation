/*
    File: fn_getUnitPositionId.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-07
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the position ID of given unit with vehicleVarName bypassing.

    Parameter(s):
        _unit - Unit to get the position ID from [OBJECT, defaults to objNull]

    Returns:
        Position ID [NUMBER]
*/

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {["Null object given"] call BIS_fnc_error; -1};

private _vvn = vehicleVarName _unit;
_unit setVehicleVarName "";
private _str = str _unit;
_unit setVehicleVarName _vvn;

parseNumber (_str select [(_str find ":") + 1])
