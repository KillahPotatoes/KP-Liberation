



hs_MPhint = { hint _this };




lose_resources = compileFinal "
	
	_price_s = 25;
	_price_a = 13;
	_price_f = 25;
	
	_nearfob = [] call KPLIB_fnc_getNearestFob;
	
	if ((_nearfob select 0) > 0) then {
		_storage_areas = (_nearfob nearobjects 100000) select {(_x getVariable ['KP_liberation_storage_type',-1]) == 0};
		
		{
			private _storage_positions = [];
			private _storedCrates = (attachedObjects _x);
			reverse _storedCrates;

			{
				_crateValue = _x getVariable ['KP_liberation_crate_value',0];

				switch ((typeOf _x)) do {
					case KP_liberation_supply_crate: {
						if (_price_s > 0) then {
							if (_crateValue > _price_s) then {
								_crateValue = _crateValue - _price_s;
								_x setVariable ['KP_liberation_crate_value', _crateValue, true];
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
								_x setVariable ['KP_liberation_crate_value', _crateValue, true];
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
								_x setVariable ['KP_liberation_crate_value', _crateValue, true];
								_price_f = 0;
							} else {
								detach _x;
								deleteVehicle _x;
								_price_f = _price_f - _crateValue;
							};
						};
					};
					default {[format ['Invalid object (%1) at storage area', (typeOf _x)], 'ERROR'] call KPLIB_fnc_log;};
				};
			} forEach _storedCrates;

			([_x] call KPLIB_fnc_getStoragePositions) params ['_storage_positions'];

			private _area = _x;
			_i = 0;
			{
				_height = [typeOf _x] call KPLIB_fnc_getCrateHeight;
				detach _x;
				_x attachTo [_area, [(_storage_positions select _i) select 0, (_storage_positions select _i) select 1, _height]];
				_i = _i + 1;
			} forEach attachedObjects (_x);

			if ((_price_s == 0) && (_price_a == 0) && (_price_f == 0)) exitWith {};

		} forEach _storage_areas;


		please_recalculate = true;
	};
";




gain_resources = compileFinal "

	_box_s = 1;
	_box_a = 1;
	_box_f = 1;
	
	_nearfob = [] call KPLIB_fnc_getNearestFob;
	
	if ((_nearfob select 0) > 0) then {
		_storage_areas = (_nearfob nearobjects 100000) select {(_x getVariable ['KP_liberation_storage_type',-1]) == 0};
		
		{
			private _storage_positions = [];
			([_x] call KPLIB_fnc_getStoragePositions) params ['_storage_positions'];
			_max_storage = count _storage_positions;
			
			private _storedCrates = (attachedObjects _x);
			reverse _storedCrates;
			_count_crates = count _storedCrates;
			
			private _pos = getPos _x;
			
			
			if ( (_box_s > 0) && (_count_crates < _max_storage) ) then {
				private _crate = KP_liberation_supply_crate createVehicle _pos;
				_crate setMass 500;
				_crate setVariable ['KP_liberation_crate_value', 100, true];
				if (KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ['ace_dragging_fnc_setCarryable'];};
				[_crate] call KPLIB_fnc_addObjectInit;
				 _crate attachTo [_x, [0, 1.5, 0]];
				_box_s = 0;
			};

			if ( (_box_a > 0) && (_count_crates < _max_storage) ) then {
				_crate = KP_liberation_ammo_crate createVehicle _pos;
				_crate setMass 500;
				_crate setVariable ['KP_liberation_crate_value', 50, true];
				if (KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ['ace_dragging_fnc_setCarryable'];};
				[_crate] call KPLIB_fnc_addObjectInit;
				 _crate attachTo [_x, [0, 1.5, 0]];
				_box_a = 0;
			};

			if ( (_box_f > 0) && (_count_crates < _max_storage) ) then {
				_crate = KP_liberation_fuel_crate createVehicle _pos;
				_crate setMass 500;
				_crate setVariable ['KP_liberation_crate_value', 100, true];
				if (KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ['ace_dragging_fnc_setCarryable'];};
				[_crate] call KPLIB_fnc_addObjectInit;
				 _crate attachTo [_x, [0, 1.5, 0]];
				_box_f = 0;
			};

			
			private _area = _x;
			_i = 0;
			{
				_height = [typeOf _x] call KPLIB_fnc_getCrateHeight;
				detach _x;
				_x attachTo [_area, [(_storage_positions select _i) select 0, (_storage_positions select _i) select 1, _height]];
				_i = _i + 1;
			} forEach attachedObjects (_x);

			if ((_box_s == 0) && (_box_a == 0) && (_box_f == 0)) exitWith {};

		} forEach _storage_areas;

		please_recalculate = true;
	};
";


KP_liberation_supplies_global = 1;
KP_liberation_ammo_global = 1;
KP_liberation_fuel_global = 1;

[]execVM "MilSimUnited/iedScript.sqf.sqf";


addMissionEventHandler ['EntityKilled',{
	_unit = _this select 0;
	if (isPlayer _unit) then {
		_hs_unconscious = _unit getVariable ['ACE_isUnconscious', false];
		if (_hs_unconscious == true) then { _unit spawn lose_resources; };
	}; 
}];


addMissionEventHandler ['HandleDisconnect',{
	_unit = _this select 0;
	_hs_unconscious = _unit getVariable ['ACE_isUnconscious', false];
	if (_hs_unconscious == true) then { _unit spawn lose_resources; };
}];


if (isServer) then {
	while {true} do {
		sleep 300;
	};
};




/* Battelgroup Spawn zur Strafe
if( !(GRLIB_all_fobs isEqualTo []) && (KP_liberation_supplies_global <= 0) && ([] call KPLIB_fnc_getOpforCap < GRLIB_battlegroup_cap) && (KP_liberation_ammo_global <= 0) && (KP_liberation_fuel_global <= 0) ) then {
	['', false] spawn spawn_battlegroup;
};
*/




