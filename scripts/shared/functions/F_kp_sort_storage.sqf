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

private _pos = getPos _storage;

private _supply = 0;
private _ammo = 0;
private _fuel = 0;

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
	private _amount = 100;
	if ((_supply / 100) < 1) then {
		_amount = _supply;
	};
	_supply = _supply - _amount;
	private _crate = [KP_liberation_supply_crate, _amount, _pos] call F_createCrate;
	sleep 0.1;
	[_crate, _storage] call F_crateToStorage;
};

while {_ammo > 0} do {
	private _amount = 100;
	if ((_ammo / 100) < 1) then {
		_amount = _ammo;
	};
	_ammo = _ammo - _amount;
	private _crate = [KP_liberation_ammo_crate, _amount, _pos] call F_createCrate;
	sleep 0.1;
	[_crate, _storage] call F_crateToStorage;
};

while {_fuel > 0} do {
	private _amount = 100;
	if ((_fuel / 100) < 1) then {
		_amount = _fuel;
	};
	_fuel = _fuel - _amount;
	private _crate = [KP_liberation_fuel_crate, _amount, _pos] call F_createCrate;
	sleep 0.1;
	[_crate, _storage] call F_crateToStorage;
};
