params [ "_unit", "_killer" ];
private [ "_nearby_bigtown" ];

if ( isServer ) then {

	please_recalculate = true;

	if ( isNil "infantry_weight" ) then { infantry_weight = 33 };
	if ( isNil "armor_weight" ) then { armor_weight = 33 };
	if ( isNil "air_weight" ) then { air_weight = 33 };

	if ( side _killer == GRLIB_side_friendly ) then {

		_nearby_bigtown = [ sectors_bigtown, {  (!(_x in blufor_sectors)) && ( _unit distance (markerpos _x) < 250 ) } ] call BIS_fnc_conditionalSelect;
		if ( count _nearby_bigtown > 0 ) then {
			combat_readiness = combat_readiness + (0.5 * GRLIB_difficulty_modifier);
			stats_readiness_earned = stats_readiness_earned + (0.5 * GRLIB_difficulty_modifier);
			if ( combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2 ) then { combat_readiness = 100.0 };
		};

		if ( _killer isKindOf "Man" ) then {
			infantry_weight = infantry_weight + 1;
			armor_weight = armor_weight - 0.66;
			air_weight = air_weight - 0.66;
		} else {
			if ( (typeof (vehicle _killer) ) in land_vehicles_classnames ) then  {
				infantry_weight = infantry_weight - 0.66;
				armor_weight = armor_weight + 1;
				air_weight = air_weight - 0.66;
			};
			if ( (typeof (vehicle _killer) ) in air_vehicles_classnames ) then  {
				infantry_weight = infantry_weight - 0.66;
				armor_weight = armor_weight - 0.66;
				air_weight = air_weight + 1;
			};
		};

		if ( infantry_weight > 100 ) then { infantry_weight = 100 };
		if ( armor_weight > 100 ) then { armor_weight = 100 };
		if ( air_weight > 100 ) then { air_weight = 100 };
		if ( infantry_weight < 0 ) then { infantry_weight = 0 };
		if ( armor_weight < 0 ) then { armor_weight = 0 };
		if ( air_weight < 0 ) then { air_weight = 0 };
	};

	if ( isPlayer _unit ) then { stats_player_deaths = stats_player_deaths + 1 };

	if ( _unit isKindOf "Man" ) then {
		if ( side (group _unit) == GRLIB_side_civilian ) then {
			stats_civilians_killed = stats_civilians_killed + 1;
			if ( isPlayer _killer ) then {
				stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;

				if ( GRLIB_civ_penalties ) then {
					resources_ammo = resources_ammo - GRLIB_civ_killing_penalty;
					[ [ name _unit, GRLIB_civ_killing_penalty, _killer ] , "remote_call_civ_penalty" ] call BIS_fnc_MP;
				};
			};
		};

		if ( side _killer == GRLIB_side_friendly ) then {
			if ( side (group _unit) == GRLIB_side_enemy ) then {
				stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
				if ( isplayer _killer ) then {
					stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;
				};
			};

			if ( side (group _unit) == GRLIB_side_friendly ) then {
				stats_blufor_teamkills = stats_blufor_teamkills + 1;
			};
		} else {
			if ( side (group _unit) == GRLIB_side_friendly ) then {
				stats_blufor_soldiers_killed = stats_blufor_soldiers_killed + 1;
			};
		};
	} else {
		if ( typeof _unit in all_hostile_classnames ) then {
			stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;
			if ( isplayer _killer ) then {
				stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;

				if ( GRLIB_ammo_bounties ) then {
					private [ "_bounty" ];

					_bounty = 10;
					if ( _unit isKindOf "Air" ) then {
						_bounty = 40;
					};

					if ( _unit isKindOf "Tank" ) then {
						_bounty = 20;
					};

					resources_ammo = resources_ammo + _bounty;
					[ [ typeOf _unit, _bounty, _killer ] , "remote_call_ammo_bounty" ] call BIS_fnc_MP;
				};

			};
		} else {
			stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;
		};
	};
};

if( isServer && !isplayer _unit) then {
	if ( ((typeof _unit) in [ammobox_o_typename, ammobox_b_typename]) && ((getPosATL _unit) select 2 < 10) ) then {
		( "R_80mm_HE" createVehicle (getPosATL _unit) ) setVelocity [0, 0, -200];
		deleteVehicle _unit;
	} else {
		sleep GRLIB_cleanup_delay;
		hidebody _unit;
		sleep 10;
		deleteVehicle _unit;
	};
};