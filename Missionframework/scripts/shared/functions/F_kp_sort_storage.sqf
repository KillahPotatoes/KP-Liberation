/*
f_kp_sort_storage.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-06-09

Description:
Stack and sort the resources inside a storage area

Parameters:
_this select 0 - OBJECT - Storage
*/

params ["_storage"];

private ["_pos","_supply","_ammo","_fuel","_crate"];

_pos = getPos _storage;

_supply = 0;
_ammo = 0;
_fuel = 0;

{
	switch ((typeOf _x)) do {
		case KP_liberation_supply_crate: {_supply = _supply + (_x getVariable ["KP_liberation_crate_value",0]);};
		case KP_liberation_ammo_crate: {_ammo = _ammo + (_x getVariable ["KP_liberation_crate_value",0]);};
		case KP_liberation_fuel_crate: {_fuel = _fuel + (_x getVariable ["KP_liberation_crate_value",0]);};
		default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
	};
	detach _x;
	deleteVehicle _x;
} forEach (attachedObjects _storage);

sleep 0.5;

while {_supply > 0} do {
	if ((floor (_supply / 100)) > 0) then {
		_crate = KP_liberation_supply_crate createVehicle _pos;
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[_crate, _storage] call F_crateToStorage;
		_supply = _supply - 100;
	} else {
		_crate = KP_liberation_supply_crate createVehicle _pos;
		_crate setVariable ["KP_liberation_crate_value", _supply, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[_crate, _storage] call F_crateToStorage;
		_supply = 0;
	};
};

while {_ammo > 0} do {
	if ((floor (_ammo / 100)) > 0) then {
		_crate = KP_liberation_ammo_crate createVehicle _pos;
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[_crate, _storage] call F_crateToStorage;
		_ammo = _ammo - 100;
	} else {
		_crate = KP_liberation_ammo_crate createVehicle _pos;
		_crate setVariable ["KP_liberation_crate_value", _ammo, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[_crate, _storage] call F_crateToStorage;
		_ammo = 0;
	};
};

while {_fuel > 0} do {
	if ((floor (_fuel / 100)) > 0) then {
		_crate = KP_liberation_fuel_crate createVehicle _pos;
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[_crate, _storage] call F_crateToStorage;
		_fuel = _fuel - 100;
	} else {
		_crate = KP_liberation_fuel_crate createVehicle _pos;
		_crate setVariable ["KP_liberation_crate_value", _fuel, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[_crate, _storage] call F_crateToStorage;
		_fuel = 0;
	};
};