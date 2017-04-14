if (!isServer) exitWith {};

params ["_price_s", "_price_a", "_price_f", "_typename", "_localtype", "_nearfob"];

if ((_price_s > 0) || (_price_a > 0) || (_price_f > 0)) then {
	
	_storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(typeof _x) in KP_liberation_storage_buildings}] call BIS_fnc_conditionalSelect;
	
	{
		_supplyValue = 0;
		_ammoValue = 0;
		_fuelValue = 0;
		
		{
			switch ((typeOf _x)) do {
				case KP_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable "KP_liberation_crate_value"); detach _x; deleteVehicle _x;};
				case KP_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable "KP_liberation_crate_value"); detach _x; deleteVehicle _x;};
				case KP_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable "KP_liberation_crate_value"); detach _x; deleteVehicle _x;};
				default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
			};
		} forEach (attachedObjects _x);
		
		if (_supplyValue > _price_s) then {
			_supplyValue = _supplyValue - _price_s;
			_price_s = 0;
		} else {
			_price_s = _price_s - _supplyValue;
			_supplyValue = 0;
		};
		
		if (_ammoValue > _price_a) then {
			_ammoValue = _ammoValue - _price_a;
			_price_a = 0;
		} else {
			_price_a = _price_a - _ammoValue;
			_ammoValue = 0;
		};
		
		if (_fuelValue > _price_f) then {
			_fuelValue = _fuelValue - _price_f;
			_price_f = 0;
		} else {
			_price_f = _price_f - _fuelValue;
			_fuelValue = 0;
		};
		
		_supplyCrates = floor (_supplyValue / 100);
		_ammoCrates = floor (_ammoValue / 100);
		_fuelCrates = floor (_fuelValue / 100);
		
		_supplyRemain = floor (_supplyValue % 100);
		_ammoRemain = floor (_ammoValue % 100);
		_fuelRemain = floor (_fuelValue % 100);
		
		for [{_i=0}, {_i < _supplyCrates}, {_i = _i + 1}] do {
			_crate = KP_liberation_supply_crate createVehicle (getPos _x);
			_crate setVariable ["KP_liberation_crate_value", 100, true];
			[_crate, _x] call F_crateToStorage;
		};
		
		if (_supplyRemain > 0) then {
			_crate = KP_liberation_supply_crate createVehicle (getPos _x);
			_crate setVariable ["KP_liberation_crate_value", _supplyRemain, true];
			[_crate, _x] call F_crateToStorage;
		};
		
		for [{_i=0}, {_i < _ammoCrates}, {_i = _i + 1}] do {
			_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
			_crate setVariable ["KP_liberation_crate_value", 100, true];
			[_crate, _x] call F_crateToStorage;
		};
		
		if (_ammoRemain > 0) then {
			_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
			_crate setVariable ["KP_liberation_crate_value", _ammoRemain, true];
			[_crate, _x] call F_crateToStorage;
		};
		
		for [{_i=0}, {_i < _fuelCrates}, {_i = _i + 1}] do {
			_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
			_crate setVariable ["KP_liberation_crate_value", 100, true];
			[_crate, _x] call F_crateToStorage;
		};
		
		if (_fuelRemain > 0) then {
			_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
			_crate setVariable ["KP_liberation_crate_value", _fuelRemain, true];
			[_crate, _x] call F_crateToStorage;
		};
		
		if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};
		
	} forEach _storage_areas;
	
	

	if ( _localtype == 8 ) then {
		stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 10;
	} else {
		if ( _typename isKindOf "Man" ) then {
			stats_blufor_soldiers_recruited = stats_blufor_soldiers_recruited + 1;
		} else {
			if ( ! ( _typename isKindOf "Building" ) ) then {
				stats_blufor_vehicles_built = stats_blufor_vehicles_built + 1;
			};
		};
	};

	stats_ammo_spent = stats_ammo_spent + _price_a;

	please_recalculate = true;
};
