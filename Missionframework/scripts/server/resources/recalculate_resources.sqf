waitUntil { !isNil "save_is_loaded" };

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Resource calculation initializing on: %1", debug_source];_text remoteExec ["diag_log",2];};

private ["_local_fob_resources", "_local_supplies_global", "_local_ammo_global", "_local_fuel_global", "_local_heli_slots", "_local_plane_slots", "_local_infantry_cap", "_fob_buildings", "_heliSlots", "_planeSlots", "_hasAirBuilding", "_hasRecBuilding", "_storage_areas", "_supplyValue", "_ammoValue", "_fuelValue"];

KP_liberation_fob_resources = [];
KP_liberation_supplies_global = 0;
KP_liberation_ammo_global = 0;
KP_liberation_fuel_global = 0;
KP_liberation_heli_slots = 0;
KP_liberation_plane_slots = 0;
infantry_cap = 50 * GRLIB_resources_multiplier;

please_recalculate = true;

waitUntil {time > 1};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Resource calculation started on: %1", debug_source];_text remoteExec ["diag_log",2];};

while { true } do {
	waitUntil { sleep 0.5; please_recalculate };
	please_recalculate = false;

	_local_fob_resources = [];
	_local_supplies_global = 0;
	_local_ammo_global = 0;
	_local_fuel_global = 0;
	_local_heli_slots = 0;
	_local_plane_slots = 0;
	_local_infantry_cap = 50 * GRLIB_resources_multiplier;
	
	{
		_fob_buildings = _x nearobjects (GRLIB_fob_range * 2);
		_storage_areas = [_fob_buildings, {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;
		_heliSlots = {(typeOf _x) == KP_liberation_heli_slot_building;} count _fob_buildings;
		_planeSlots = {(typeOf _x) == KP_liberation_plane_slot_building;} count _fob_buildings;
		_hasAirBuilding = {(typeOf _x) == KP_liberation_air_vehicle_building;} count _fob_buildings;
		if (_hasAirBuilding > 0) then {_hasAirBuilding = true;} else {_hasAirBuilding = false;};
		_hasRecBuilding = {(typeOf _x) == KP_liberation_recycle_building;} count _fob_buildings;
		if (_hasRecBuilding > 0) then {_hasRecBuilding = true;} else {_hasRecBuilding = false;};
		
		_supplyValue = 0;
		_ammoValue = 0;
		_fuelValue = 0;
		
		{
			{
				switch ((typeOf _x)) do {
					case KP_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable ["KP_liberation_crate_value",0]);};
					case KP_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable ["KP_liberation_crate_value",0]);};
					case KP_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable ["KP_liberation_crate_value",0]);};
					default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
				};
			} forEach (attachedObjects _x);
		} forEach _storage_areas;
		
		_local_fob_resources pushBack [_x, _supplyValue, _ammoValue, _fuelValue, _hasAirBuilding, _hasRecBuilding];
		_local_supplies_global = _local_supplies_global + _supplyValue;
		_local_ammo_global = _local_ammo_global + _ammoValue;
		_local_fuel_global = _local_fuel_global + _fuelValue;
		_local_heli_slots = _local_heli_slots + _heliSlots;
		_local_plane_slots = _local_plane_slots + _planeSlots;
	} forEach GRLIB_all_fobs;	
	
	{
		if ( _x in sectors_capture ) then {
			_local_infantry_cap = _local_infantry_cap + (10 * GRLIB_resources_multiplier);
		};
	} foreach blufor_sectors;

	KP_liberation_fob_resources = _local_fob_resources;
	KP_liberation_supplies_global = _local_supplies_global;
	KP_liberation_ammo_global = _local_ammo_global;
	KP_liberation_fuel_global = _local_fuel_global;
	KP_liberation_heli_slots = _local_heli_slots;
	KP_liberation_plane_slots = _local_plane_slots;
	infantry_cap = _local_infantry_cap;

};
