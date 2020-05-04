/*
    File: fn_setFobMass.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-02
    Last Update: 2020-04-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sets mass of FOB box to Max slingload weight of "huron_typename" lowered by 100.
        If max slingload mass is lower than 1000 its set to 1000.
        If it is higher than 3000 it's set to 3000.

    Parameter(s):
        _box - FOB Box on which mass will be set [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_box", objNull, [objNull]]
];

if (isNull _box) exitWith {["Null object given"] call BIS_fnc_error; false};

private _boxMass = getNumber(configFile >> "CfgVehicles" >> huron_typename >> "slingLoadMaxCargoMass") - 100;
_boxMass = 1000 max (_boxMass min 3000);

if (local _box) then {
    _box setMass _boxMass;
} else {
    [_box, _boxMass] remoteExec ["setMass", _box];
};

true
