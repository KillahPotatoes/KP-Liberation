



hs_MPhint = { hint _this };
/* USE:
_hs_hint = format['_crate: %1', typeOf _crate];
[_hs_hint, 'hs_MPhint'] call BIS_fnc_mp;
*/



lose_resources = compileFinal "
	
	_price_s = 25;
	_price_a = 25;
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
				_crate setVariable ['KP_liberation_crate_value', 100, true];
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




hs_spawn_init = '';
hs_spawn_aa = 'this addBackpack "B_Carryall_cbr"; this addWeapon "rhs_weap_fim92"; this addSecondaryWeaponItem "rhs_fim92_mag"; for "_i" from 1 to 2 do {this addItemToBackpack "rhs_fim92_mag";};';

hs_spawn = compileFinal "

	_headlessClients = entities 'HeadlessClient_F';
	_humanPlayers = allPlayers - _headlessClients;
	_count_players = count _humanPlayers;
	
	if(_count_players > 0) then {
		
		_hs_randomizer = floor(random 10);
		
		if( (_hs_randomizer < 2) && ((opfor countSide allGroups) < 140) ) then {
			_player = selectRandom _humanPlayers;
			_too_close = false;
			
			_spawn_position = [ [ [getPos _player, 750] ], ['water'] ] call BIS_fnc_randomPos;

			{
				if (_spawn_position distance _x < 500) then {
					_too_close = true;
				};
			} forEach allPlayers;
			
			if (_too_close == false) then {
				_group_spawn = createGroup opfor;
				
				'LOP_ISTS_OPF_Infantry_AT' createUnit [_spawn_position, _group_spawn, hs_spawn_init, 0.2, 'private']; sleep 1;
				'LOP_ISTS_OPF_Infantry_Rifleman_9' createUnit [_spawn_position, _group_spawn, hs_spawn_init+hs_spawn_aa, 0.2, 'private']; sleep 1;
				'LOP_ISTS_OPF_Infantry_Marksman' createUnit [_spawn_position, _group_spawn, hs_spawn_init, 0.2, 'private']; sleep 1;
				'LOP_ISTS_OPF_Infantry_AR_2' createUnit [_spawn_position, _group_spawn, hs_spawn_init, 0.2, 'private']; sleep 1;

				_wp1_spawn = _group_spawn addWaypoint [getPosWorld _player, 100];
				_wp1_spawn setwaypointtype 'MOVE';
				_wp1_spawn setWaypointBehaviour 'AWARE';
				_wp1_spawn setWaypointSpeed 'FULL';

				_wp2_spawn = _group_spawn addWaypoint [getPosWorld _player, 400];

				_wp3_spawn = _group_spawn addWaypoint [getPosWorld _player, 400];

				_wp4_spawn = _group_spawn addWaypoint [getPosWorld _player, 400];

				_wp5_spawn = _group_spawn addWaypoint [getPosWorld _player, 400];

				_wp6_spawn = _group_spawn addWaypoint [getPosWorld _player, 400];
				_wp6_spawn setWaypointStatements ['true', '{deleteVehicle _x} forEach thisList;'];
			};
		};
		
	};
";




if (isServer) then {
	while {true} do {
		
		[]execVM "MilSimUnited\ieds.sqf";
		sleep 60;
		
		[] spawn hs_spawn;
		sleep 60;
		
	};
};







