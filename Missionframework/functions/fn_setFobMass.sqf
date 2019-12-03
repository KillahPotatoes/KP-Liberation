/*
    File: fn_setFobMass.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-02
    Last Update: 2019-12-03
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
// TODO
params ["_box"];

private _boxMass = getNumber(configFile >> "CfgVehicles" >> huron_typename >> "slingLoadMaxCargoMass") - 100;
if(_boxMass < 1000) then {
    _boxMass = 1000;
} else {
    if(_boxMass > 3000) then {_boxMass = 3000;};
};

[_box, _boxMass] remoteExec ["KPLIB_fnc_setMass",_box];
