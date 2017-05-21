/*
f_kp_crate_to_storage.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-03-27

Description:
Attach given crate at storage area

Parameters:
_this select 0 - OBJECT - Crate
_this select 1 - OBJECT - Storage
*/

private ["_storage_positions","_height","_crates_count","_placed","_current_pos"];

if (!isNull (_this select 1)) then {
	switch (typeOf (_this select 1)) do {
		case KP_liberation_small_storage_building: {_storage_positions = KP_liberation_small_storage_positions;};
		case KP_liberation_large_storage_building: {_storage_positions = KP_liberation_large_storage_positions;};
		default {_storage_positions = KP_liberation_large_storage_positions;};
	};

	switch (typeOf (_this select 0)) do {
		case KP_liberation_supply_crate: {_height = 0.4;};
		case KP_liberation_ammo_crate: {_height = 0.6;};
		case KP_liberation_fuel_crate: {_height = 0.3;};
		default {_height = 0.6;};
	};
	
	clearWeaponCargoGlobal (_this select 0);
	clearMagazineCargoGlobal (_this select 0);
	clearBackpackCargoGlobal (_this select 0);
	clearItemCargoGlobal (_this select 0);
	
	_crates_count = count (attachedObjects (_this select 1));

	(_this select 0) attachTo [(_this select 1), [(_storage_positions select _crates_count) select 0, (_storage_positions select _crates_count) select 1, _height]];
	(_this select 0) enableRopeAttach false;
} else {
	if (!isDedicated) then {
		hint localize "STR_BOX_CANTSTORE";
	};
};
