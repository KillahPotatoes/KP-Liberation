/*
F_kp_setFobMass.sqf
Author: veteran29

Description:
Sets mass of FOB box to Max slingload weight of "huron_typename" lowered by 100, 
if max slingload mass is lower than 1000 its set to 1000
if it is higher than 3000 it's set to 3000

Parameters:
_this select 0 - Object - FOB Box on which mass will be set
*/
params ["_box"];

private _boxMass = getNumber(configFile >> "CfgVehicles" >> huron_typename >> "slingLoadMaxCargoMass") - 100;
if(_boxMass < 1000) then {
	_boxMass = 1000;
} else {
	if(_boxMass > 3000) then {_boxMass = 3000;};
};

[_box, _boxMass] remoteExec ["F_setMass",_box];
