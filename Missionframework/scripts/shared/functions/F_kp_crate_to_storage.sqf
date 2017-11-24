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
_this select 2 - BOOL - Update sector resources
*/

params ["_crate", ["_storage",nil], ["_update",false]];

if (!isNil "_storage") then {
	private _storage_positions = KP_liberation_large_storage_positions;
	switch (typeOf _storage) do {
		case KP_liberation_small_storage_building: {_storage_positions = KP_liberation_small_storage_positions;};
		case KP_liberation_large_storage_building: {_storage_positions = KP_liberation_large_storage_positions;};
		default {_storage_positions = KP_liberation_large_storage_positions;};
	};

	private _height = 0.6;
	switch (typeOf _crate) do {
		case KP_liberation_supply_crate: {_height = 0.4;};
		case KP_liberation_ammo_crate: {_height = 0.6;};
		case KP_liberation_fuel_crate: {_height = 0.3;};
		default {_height = 0.6;};
	};
	
	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	clearBackpackCargoGlobal _crate;
	clearItemCargoGlobal _crate;
	
	private _crates_count = count (attachedObjects _storage);

	if (_crates_count >= (count _storage_positions)) exitWith {if (!isDedicated) then {hint localize "STR_BOX_CANTSTORE";};};

	_crate attachTo [_storage, [(_storage_positions select _crates_count) select 0, (_storage_positions select _crates_count) select 1, _height]];
	[_crate, false] remoteExec ["enableRopeAttach"];
	if(KP_liberation_ace) then {[_crate, false, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};

	if (_update) then {
		if ((_storage getVariable ["KP_liberation_storage_type",-1]) == 1) then {
			remoteExec ["check_sector_ress_remote_call",2];
		};
	};

} else {
	if (!isDedicated) then {
		hint localize "STR_BOX_CANTSTORE";
	};
};
