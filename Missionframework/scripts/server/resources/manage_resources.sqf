waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "saved_ammo_res" };
waitUntil { !isNil "saved_intel_res" };

resources_ammo = saved_ammo_res;
resources_intel = saved_intel_res;

while { GRLIB_endgame == 0 } do {

	_base_tick_period = 4800;

	if ( count allPlayers > 0 ) then {

		_blufor_cap_sectors = [];
		_blufor_mil_sectors = [];
		_blufor_fac_sectors = [];
		{
			if ( _x in sectors_capture ) then {
				_blufor_cap_sectors pushback _x;
			};
			if ( _x in sectors_military ) then {
				_blufor_mil_sectors pushback _x;
			};
			if ( _x in sectors_factory ) then {
				_blufor_fac_sectors pushback _x;
			};
			_base_tick_period = _base_tick_period * 0.9;
		} foreach blufor_sectors;

		_base_tick_period = _base_tick_period / GRLIB_resources_multiplier;

		if ( _base_tick_period < 300 ) then { _base_tick_period = 300 };

		sleep _base_tick_period;

		if ( count _blufor_cap_sectors > 0 ) then {

			if ( ( { (typeof _x == KP_liberation_supply_crate) && (isNull attachedTo _x) } count vehicles ) <= ( ceil ( ( count _blufor_cap_sectors ) * 1.3 ) ) ) then {

				_spawnsector = ( _blufor_cap_sectors call BIS_fnc_selectRandom );
				_spawnpos = zeropos;
				while { _spawnpos distance zeropos < 1000 } do {
					_spawnpos =  ( [ ( markerpos _spawnsector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [ 10, 100, 'B_Heli_Transport_01_F' ];
					if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
				};

				_newbox = KP_liberation_supply_crate createVehicle _spawnpos;
				_newbox setpos _spawnpos;
				_newbox setdir (random 360);
				clearWeaponCargoGlobal _newbox;
				clearMagazineCargoGlobal _newbox;
				clearItemCargoGlobal _newbox;
				clearBackpackCargoGlobal _newbox;
				_newbox addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
				
				_newbox setVariable ["KP_liberation_crate_value", 100, true];

				[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;

			};
		};
		
		if ( count _blufor_mil_sectors > 0 ) then {

			if ( ( { (typeof _x == KP_liberation_ammo_crate) && (isNull attachedTo _x) } count vehicles ) <= ( ceil ( ( count _blufor_mil_sectors ) * 1.3 ) ) ) then {

				_spawnsector = ( _blufor_mil_sectors call BIS_fnc_selectRandom );
				_spawnpos = zeropos;
				while { _spawnpos distance zeropos < 1000 } do {
					_spawnpos =  ( [ ( markerpos _spawnsector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [ 10, 100, 'B_Heli_Transport_01_F' ];
					if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
				};

				_newbox = KP_liberation_ammo_crate createVehicle _spawnpos;
				_newbox setpos _spawnpos;
				_newbox setdir (random 360);
				clearWeaponCargoGlobal _newbox;
				clearMagazineCargoGlobal _newbox;
				clearItemCargoGlobal _newbox;
				clearBackpackCargoGlobal _newbox;
				_newbox addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
				
				_newbox setVariable ["KP_liberation_crate_value", 100, true];

				[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;

			};
		};
		
		if ( count _blufor_fac_sectors > 0 ) then {

			if ( ( { (typeof _x == KP_liberation_fuel_crate) && (isNull attachedTo _x) } count vehicles ) <= ( ceil ( ( count _blufor_fac_sectors ) * 1.3 ) ) ) then {

				_spawnsector = ( _blufor_fac_sectors call BIS_fnc_selectRandom );
				_spawnpos = zeropos;
				while { _spawnpos distance zeropos < 1000 } do {
					_spawnpos =  ( [ ( markerpos _spawnsector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [ 10, 100, 'B_Heli_Transport_01_F' ];
					if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
				};

				_newbox = KP_liberation_fuel_crate createVehicle _spawnpos;
				_newbox setpos _spawnpos;
				_newbox setdir (random 360);
				clearWeaponCargoGlobal _newbox;
				clearMagazineCargoGlobal _newbox;
				clearItemCargoGlobal _newbox;
				clearBackpackCargoGlobal _newbox;
				_newbox addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
				
				_newbox setVariable ["KP_liberation_crate_value", 100, true];

				[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;

			};
		};
	};

	sleep 300;
};