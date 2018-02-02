/*
F_kp_isClassUAV.sqf
Author: veteran29

Description:
Returns if given vehicle class is an UAV

Parameters:
_this select 0 - STRING - Class of object which will be checked if it is an UAV

Return:
BOOL
*/
params ["_vehicleclass"];

private _isUAV = false;

if ((typeName _vehicleclass) == "STRING") then {
	if ((getNumber(configFile >> "CfgVehicles" >> _vehicleclass >> "isUav")) == 1) then {
		_isUAV = true;
	};
};

_isUAV;
