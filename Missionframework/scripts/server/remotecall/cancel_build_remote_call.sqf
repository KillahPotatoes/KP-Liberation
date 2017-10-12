if (!isServer) exitWith {};

params ["_price_s", "_price_a", "_price_f", "_storage_areas"];

if ((_price_s > 0) || (_price_a > 0) || (_price_f > 0)) then {
	{
		private _space = 0;
		if (typeOf _x == KP_liberation_large_storage_building) then {
			_space = (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
		};
		if (typeOf _x == KP_liberation_small_storage_building) then {
			_space = (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
		};

		while {(_space > 0) && (_price_s > 0)} do {
			private _amount = 100;
			if ((_price_s / 100) < 1) then {
				_amount = _price_s;
			};
			_price_s = _price_s - _amount;
			private _crate = [KP_liberation_supply_crate, _amount, getPos _x] call F_createCrate;
			[_crate, _x] call F_crateToStorage;
			_space = _space - 1;
		};

		while {(_space > 0) && (_price_a > 0)} do {
			private _amount = 100;
			if ((_price_a / 100) < 1) then {
				_amount = _price_a;
			};
			_price_a = _price_a - _amount;
			private _crate = [KP_liberation_ammo_crate, _amount, getPos _x] call F_createCrate;
			[_crate, _x] call F_crateToStorage;
			_space = _space - 1;
		};

		while {(_space > 0) && (_price_f > 0)} do {
			private _amount = 100;
			if ((_price_f / 100) < 1) then {
				_amount = _price_f;
			};
			_price_f = _price_f - _amount;
			private _crate = [KP_liberation_fuel_crate, _amount, getPos _x] call F_createCrate;
			[_crate, _x] call F_crateToStorage;
			_space = _space - 1;
		};
		if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};
	} forEach _storage_areas;
};
