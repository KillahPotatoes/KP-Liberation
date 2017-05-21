if (!isServer) exitWith {};

params ["_index", "_nearfob", "_clientID"];

private ["_storage_areas", "_price_s", "_price_a", "_price_f", "_crateSum", "_spaceSum", "_space", "_crate"];

logiError = 0;

if (((KP_liberation_logistics select _index) select 1) <= 0) exitWith {logiError = 1; _clientID publicVariableClient "logiError";};

_storage_areas = [_nearfob nearobjects (GRLIB_fob_range * 2), {(_x getVariable ["KP_liberation_storage_type",-1]) == 0}] call BIS_fnc_conditionalSelect;

if ((count _storage_areas) == 0) exitWith {(localize "STR_LOGISTIC_NOSPACE") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

_price_s = 50;
_price_a = 0;
_price_f = 50;

_crateSum = (ceil(_price_s / 100)) + (ceil(_price_a / 100)) + (ceil(_price_f / 100));

_spaceSum = 0;

{
	if (typeOf _x == KP_liberation_large_storage_building) then {
		_spaceSum = _spaceSum + (count KP_liberation_large_storage_positions) - (count (attachedObjects _x));
	};
	if (typeOf _x == KP_liberation_small_storage_building) then {
		_spaceSum = _spaceSum + (count KP_liberation_small_storage_positions) - (count (attachedObjects _x));
	};
} forEach _storage_areas;

if (_spaceSum < _crateSum) exitWith {(localize "STR_LOGISTIC_NOSPACE") remoteExec ["hint",_clientID]; logiError = 1; _clientID publicVariableClient "logiError";};

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

please_recalculate = true;

(KP_liberation_logistics select _index) set [1, ((KP_liberation_logistics select _index) select 1) - 1];
