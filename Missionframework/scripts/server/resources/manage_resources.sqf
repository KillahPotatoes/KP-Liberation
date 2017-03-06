waitUntil { !isNil "save_is_loaded" };
waitUntil { !isNil "blufor_sectors" };
waitUntil { !isNil "saved_ammo_res" };
waitUntil { !isNil "saved_intel_res" };

resources_ammo = saved_ammo_res;
resources_intel = saved_intel_res;

while { GRLIB_endgame == 0 } do {

	_base_tick_period = 4800;

	if ( count allPlayers > 0 ) then {

		_blufor_mil_sectors = [];
		{
			if ( _x in sectors_military ) then {
				_blufor_mil_sectors pushback _x;
				_base_tick_period = _base_tick_period * 0.82;
			};
		} foreach blufor_sectors;

		_base_tick_period = _base_tick_period / GRLIB_resources_multiplier;

		if ( _base_tick_period < 300 ) then { _base_tick_period = 300 };

		sleep _base_tick_period;

		if ( count _blufor_mil_sectors > 0 ) then {

			if ( GRLIB_passive_income ) then {

				_ammo_increase = round ( 50 + (random 25));
				resources_ammo = resources_ammo + _ammo_increase;

			} else {

				if ( ( { typeof _x == ammobox_b_typename } count vehicles ) <= ( ceil ( ( count _blufor_mil_sectors ) * 1.3 ) ) ) then {

					_spawnsector = ( _blufor_mil_sectors call BIS_fnc_selectRandom );
					_spawnpos = zeropos;
					while { _spawnpos distance zeropos < 1000 } do {
						_spawnpos =  ( [ ( markerpos _spawnsector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [ 10, 100, 'B_Heli_Transport_01_F' ];
						if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
					};

					_newbox = ammobox_b_typename createVehicle _spawnpos;
					_newbox setpos _spawnpos;
					_newbox setdir (random 360);
					clearWeaponCargoGlobal _newbox;
					clearMagazineCargoGlobal _newbox;
					clearItemCargoGlobal _newbox;
					clearBackpackCargoGlobal _newbox;
					_newbox addMPEventHandler ['MPKilled', {_this spawn kill_manager}];

					[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;

				};
			};
		};
	};

	sleep 300;
};