/*
f_kp_crate_from_storage.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-03-27

Description:
Unloads given crate type from storage area

Parameters:
_this select 0 - STRING - Crate type
_this select 1 - OBJECT - Storage
*/

private ["_storage_positions","_unload_distance","_unload_pos","_i","_unloaded","_current_pos"];

switch (typeOf (_this select 1)) do {
	case KP_liberation_small_storage_building: {_storage_positions = KP_liberation_small_storage_positions; _unload_distance = 4;};
	case KP_liberation_large_storage_building: {_storage_positions = KP_liberation_large_storage_positions; _unload_distance = 6.5;};
	default {_storage_positions = KP_liberation_large_storage_positions; _unload_distance = 6.5;};
};

reverse _storage_positions;
_unload_pos = [(_this select 1), _unload_distance, (getDir (_this select 1)) - 180] call BIS_fnc_relPos;
_i = 0;
while {!((nearestObjects [_unload_pos,KP_liberation_crates,1]) isEqualTo [])} do {
	_i = _i + 1;
	_unload_pos = [(_this select 1), _unload_distance + _i * 1.8, (getDir (_this select 1)) - 180] call BIS_fnc_relPos;
};

sleep 0.5;

_unloaded = false;
{
	_current_pos = [(_this select 1), (_x select 0), (_x select 1) + (getDir (_this select 1))] call BIS_fnc_relPos;
	
	_crate = (nearestObjects [_current_pos,[_this select 0],1]) select 0;
	
	if (!(isNil "_crate")) then {

		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		
		_crate setPos _unload_pos;
		sleep 0.5;
		_crate enableSimulationGlobal true;
		_unloaded = true;
	};
	if (_unloaded) exitWith {reverse _storage_positions;};
} forEach _storage_positions;
