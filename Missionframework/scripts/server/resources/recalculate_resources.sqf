waitUntil { !isNil "save_is_loaded" };

private ["_storage_areas", "_supplyValue", "_ammoValue", "_fuelValue"];

please_recalculate = true;

while { true } do {
	waitUntil { sleep 0.5; please_recalculate };
	please_recalculate = false;
	
	KP_liberation_fob_resources = [];
	
	{
		_storage_areas = [_x nearobjects (GRLIB_fob_range * 2), {(typeof _x) in KP_liberation_storage_buildings}] call BIS_fnc_conditionalSelect;
		
		_supplyValue = 0;
		_ammoValue = 0;
		_fuelValue = 0;
		
		{
			{
				switch ((typeOf _x)) do {
					case KP_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable "KP_liberation_crate_value");};
					case KP_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable "KP_liberation_crate_value");};
					case KP_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable "KP_liberation_crate_value");};
					default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
				};
			} forEach (attachedObjects _x);
		} forEach _storage_areas;
		
		KP_liberation_fob_resources pushBack [_x, _supplyValue, _ammoValue, _fuelValue];
	} forEach GRLIB_all_fobs;	
	
	infantry_cap = 50 * GRLIB_resources_multiplier;
	{
		if ( _x in sectors_capture ) then {
			infantry_cap = infantry_cap + (10 * GRLIB_resources_multiplier);
		};
	} foreach blufor_sectors;
};
