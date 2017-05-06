if (isServer) then {

	params [ "_liberated_sector" ];

	_combat_readiness_increase = 0;


	if ( _liberated_sector in sectors_bigtown ) then {
		_combat_readiness_increase = (floor (random 10)) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_capture ) then {
		_combat_readiness_increase = (floor (random 6)) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_military ) then {
		_combat_readiness_increase = (5 + (floor (random 11))) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_factory ) then {
		_combat_readiness_increase = (3 + (floor (random 7))) * GRLIB_difficulty_modifier;
	};

	if ( _liberated_sector in sectors_tower ) then {
		_combat_readiness_increase = (floor (random 4));
	};

	combat_readiness = combat_readiness + _combat_readiness_increase;
	if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier <= 2.0 ) then { combat_readiness = 100.0 };
	stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
	[_liberated_sector, 0] remoteExec ["remote_call_sector"];

	reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

	blufor_sectors pushback _liberated_sector; publicVariable "blufor_sectors";
	stats_sectors_liberated = stats_sectors_liberated + 1;
	
	if ((_liberated_sector in sectors_factory) || (_liberated_sector in sectors_capture)) then {

		private ["_sectorType", "_sectorFacilities"];

		if (_liberated_sector in sectors_factory) then {_sectorType = 1;_sectorFacilities = true;} else {_sectorType = 0;_sectorFacilities = false;};

		{
			if (_liberated_sector in _x) exitWith {KP_liberation_production = KP_liberation_production - [_x];};
		} forEach KP_liberation_production;

		KP_liberation_production pushBack [
			(markerText _liberated_sector),
			_liberated_sector,
			_sectorType,
			[],
			_sectorFacilities,
			_sectorFacilities,
			_sectorFacilities,
			3,
			KP_liberation_production_interval,
			0,
			0,
			0
		];
	};

	[] spawn check_victory_conditions;

	sleep 1;

	trigger_server_save = true;

	sleep 45;

	if ( GRLIB_endgame == 0 ) then {
		if ( (!( _liberated_sector in sectors_tower )) && (((random (200.0 / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity) )) < (combat_readiness - 20)) || ( _liberated_sector in sectors_bigtown )) && ([] call F_opforCap < GRLIB_battlegroup_cap) ) then {
			[ _liberated_sector ] spawn spawn_battlegroup;
		};
	};
};