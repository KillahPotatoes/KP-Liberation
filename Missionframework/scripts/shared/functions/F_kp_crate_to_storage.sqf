/*
F_kp_crate_to_storage.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-03-27

Description:
Stores given crate at storage area

Parameters:
_this select 0 - OBJECT - Crate
_this select 1 - OBJECT - Storage
*/

private ["_storage_positions","_placed","_current_pos"];

switch (typeOf (_this select 1)) do {
	case KP_liberation_small_storage_building: {_storage_positions = KP_liberation_small_storage_positions;};
	case KP_liberation_large_storage_building: {_storage_positions = KP_liberation_large_storage_positions;};
	default {_storage_positions = KP_liberation_large_storage_positions;};
};

_placed = false;
{
	_current_pos = [(_this select 1), (_x select 0), (_x select 1) + (getDir (_this select 1))] call BIS_fnc_relPos;
	
	if ((nearestObjects [_current_pos,KP_liberation_crates,1]) isEqualTo []) then {
		(_this select 0) setDir (getDir (_this select 1));
		(_this select 0) enableSimulationGlobal false;
		clearWeaponCargoGlobal (_this select 0);
		clearMagazineCargoGlobal (_this select 0);
		clearBackpackCargoGlobal (_this select 0);
		clearItemCargoGlobal (_this select 0);
		
		(_this select 0) setPos _current_pos;
		_placed = true;
	};
	if (_placed) exitWith {};
} forEach _storage_positions;
