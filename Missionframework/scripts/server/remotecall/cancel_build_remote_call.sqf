if (!isServer) exitWith {};

params ["_price_s", "_price_a", "_price_f", "_storage_areas"];

if ((_price_s > 0) || (_price_a > 0) || (_price_f > 0)) then {
	
	private ["_space", "_crate"];

	{
		_space = 0;
		if (typeOf _x == KP_liberation_large_storage_building) then {
			_space = (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
		};
		if (typeOf _x == KP_liberation_small_storage_building) then {
			_space = (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
		};

		while {(_space > 0) && (_price_s > 0)} do {
			if ((floor (_price_s / 100)) > 0) then {
				_crate = KP_liberation_supply_crate createVehicle (getPos _x);
				_crate setVariable ["KP_liberation_crate_value", 100, true];
				[_crate, 500] remoteExec ["F_setMass",_crate];
				[_crate, _x] call F_crateToStorage;
				_price_s = _price_s - 100;
			} else {
				_crate = KP_liberation_supply_crate createVehicle (getPos _x);
				_crate setVariable ["KP_liberation_crate_value", _price_s, true];
				[_crate, 500] remoteExec ["F_setMass",_crate];
				[_crate, _x] call F_crateToStorage;
				_price_s = 0;
			};
			_space = _space - 1;
		};

		while {(_space > 0) && (_price_a > 0)} do {
			if ((floor (_price_a / 100)) > 0) then {
				_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
				_crate setVariable ["KP_liberation_crate_value", 100, true];
				[_crate, 500] remoteExec ["F_setMass",_crate];
				[_crate, _x] call F_crateToStorage;
				_price_a = _price_a - 100;
			} else {
				_crate = KP_liberation_ammo_crate createVehicle (getPos _x);
				_crate setVariable ["KP_liberation_crate_value", _price_a, true];
				[_crate, 500] remoteExec ["F_setMass",_crate];
				[_crate, _x] call F_crateToStorage;
				_price_a = 0;
			};
			_space = _space - 1;
		};

		while {(_space > 0) && (_price_f > 0)} do {
			if ((floor (_price_f / 100)) > 0) then {
				_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
				_crate setVariable ["KP_liberation_crate_value", 100, true];
				[_crate, 500] remoteExec ["F_setMass",_crate];
				[_crate, _x] call F_crateToStorage;
				_price_f = _price_f - 100;
			} else {
				_crate = KP_liberation_fuel_crate createVehicle (getPos _x);
				_crate setVariable ["KP_liberation_crate_value", _price_f, true];
				[_crate, 500] remoteExec ["F_setMass",_crate];
				[_crate, _x] call F_crateToStorage;
				_price_f = 0;
			};
			_space = _space - 1;
		};

		if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};
	} forEach _storage_areas;
};
