if (!isServer) exitWith {};

params ["_index", "_nearfob", "_clientID", "_supplies", "_ammo", "_fuel"];

logiError = 0;

private _storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;

if ((count _storage_areas) == 0) exitWith {(localize "STR_LOGISTIC_CANTAFFORD") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

private _price_s = 100;
private _price_a = 0;
private _price_f = 100;

if ((_price_s > _supplies) || (_price_a > _ammo) || (_price_f > _fuel)) exitWith {(localize "STR_LOGISTIC_CANTAFFORD") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

{
	

	private _storage_positions = [];
	private _storedCrates = (attachedObjects _x);
	reverse _storedCrates;

	{
		private _crateValue = _x getVariable ["KP_liberation_crate_value",0];

		switch ((typeOf _x)) do {
			case KP_liberation_supply_crate: { 
				if (_price_s > 0) then {
					if (_crateValue > _price_s) then {
						_crateValue = _crateValue - _price_s;
						_x setVariable ["KP_liberation_crate_value", _crateValue, true];
						_price_s = 0;
					} else {
						detach _x;
						deleteVehicle _x;
						_price_s = _price_s - _crateValue;
					};
				};
			};
			case KP_liberation_ammo_crate: {
				if (_price_a > 0) then {
					if (_crateValue > _price_a) then {
						_crateValue = _crateValue - _price_a;
						_x setVariable ["KP_liberation_crate_value", _crateValue, true];
						_price_a = 0;
					} else {
						detach _x;
						deleteVehicle _x;
						_price_a = _price_a - _crateValue;
					};
				};
			};
			case KP_liberation_fuel_crate: {
				if (_price_f > 0) then {
					if (_crateValue > _price_f) then {
						_crateValue = _crateValue - _price_f;
						_x setVariable ["KP_liberation_crate_value", _crateValue, true];
						_price_f = 0;
					} else {
						detach _x;
						deleteVehicle _x;
						_price_f = _price_f - _crateValue;
					};
				};
			};
			default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
		};
	} forEach _storedCrates;
	
	switch (typeOf _x) do {
		case KP_liberation_small_storage_building: {_storage_positions = KP_liberation_small_storage_positions;};
		case KP_liberation_large_storage_building: {_storage_positions = KP_liberation_large_storage_positions;};
		default {_storage_positions = KP_liberation_large_storage_positions;};
	};

	private _area = _x;
	_i = 0;
	{
		_height = 0.6;
		switch (typeOf _x) do {
			case KP_liberation_supply_crate: {_height = 0.4;};
			case KP_liberation_ammo_crate: {_height = 0.6;};
			case KP_liberation_fuel_crate: {_height = 0.3;};
			default {_height = 0.6;};
		};
		detach _x;
		_x attachTo [_area, [(_storage_positions select _i) select 0, (_storage_positions select _i) select 1, _height]];
		_i = _i + 1;
	} forEach attachedObjects (_x);

	if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};
	
} forEach _storage_areas;

please_recalculate = true;

(KP_liberation_logistics select _index) set [1, ((KP_liberation_logistics select _index) select 1) + 1];
