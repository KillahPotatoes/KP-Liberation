params ["_unit", "_killer"];

if (isServer) then {

	if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] Kill Manager executed - _unit: %1 (%2) - _killer: %3 (%4)", typeOf _unit, _unit, typeOf _killer, _killer];};

	if (KP_liberation_ace) then {
		if (local _unit) then {
			_killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];
			if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] _unit is local to %1", debug_source];};
		} else {
			if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] _unit is not local to %1", debug_source];};
			if (isNil "KP_liberation_ace_killer") then {KP_liberation_ace_killer = objNull;};
			waitUntil {sleep 0.5; !(isNull KP_liberation_ace_killer)};
			if (KP_liberation_kill_debug > 0) then {diag_log format ["[KP LIBERATION] [KILL] KP_liberation_ace_killer received on %1", debug_source];};
			_killer = KP_liberation_ace_killer;
			KP_liberation_ace_killer = objNull;
			publicVariable "KP_liberation_ace_killer";
		};
	};

	please_recalculate = true;

	if (isNil "infantry_weight") then {infantry_weight = 33};
	if (isNil "armor_weight") then {armor_weight = 33};
	if (isNil "air_weight") then {air_weight = 33};

	if ((side _killer) == GRLIB_side_friendly) then {

		private _nearby_bigtown = [sectors_bigtown, {!(_x in blufor_sectors) && (_unit distance (markerpos _x) < 250) } ] call BIS_fnc_conditionalSelect;
		if (count _nearby_bigtown > 0) then {
			combat_readiness = combat_readiness + (0.5 * GRLIB_difficulty_modifier);
			stats_readiness_earned = stats_readiness_earned + (0.5 * GRLIB_difficulty_modifier);
			if (combat_readiness > 100.0 && GRLIB_difficulty_modifier < 2) then {combat_readiness = 100.0};
		};

		if (_killer isKindOf "Man") then {
			infantry_weight = infantry_weight + 1;
			armor_weight = armor_weight - 0.66;
			air_weight = air_weight - 0.66;
		} else {
			if ((typeof (vehicle _killer)) in land_vehicles_classnames) then  {
				infantry_weight = infantry_weight - 0.66;
				armor_weight = armor_weight + 1;
				air_weight = air_weight - 0.66;
			};
			if ((typeof (vehicle _killer)) in air_vehicles_classnames) then  {
				infantry_weight = infantry_weight - 0.66;
				armor_weight = armor_weight - 0.66;
				air_weight = air_weight + 1;
			};
		};

		if (infantry_weight > 100) then {infantry_weight = 100};
		if (armor_weight > 100) then {armor_weight = 100};
		if (air_weight > 100) then {air_weight = 100};
		if (infantry_weight < 0) then {infantry_weight = 0};
		if (armor_weight < 0) then {armor_weight = 0};
		if (air_weight < 0) then {air_weight = 0};
	};

	if (isPlayer _unit) then { 
		stats_player_deaths = stats_player_deaths + 1;	
		// Disconnect UAV from player on death
		_unit connectTerminalToUAV objNull;
		// Eject Player from vehicle
		if (vehicle _unit != _unit) then {moveOut _unit;};
	};

	if (_unit isKindOf "Man") then {
		if (side (group _unit) == GRLIB_side_civilian) then {
			stats_civilians_killed = stats_civilians_killed + 1;
			if (side _killer == GRLIB_side_friendly) then {
				if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] Civilian killed by: %1", name _killer];};
				[2, [(name _unit)]] remoteExec ["F_cr_globalMsg"];
				[KP_liberation_cr_kill_penalty, true] spawn F_cr_changeCR;
			};
			if (isPlayer _killer) then {
				stats_civilians_killed_by_players = stats_civilians_killed_by_players + 1;
			};
		};

		if (side _killer == GRLIB_side_friendly) then {
			if (side (group _unit) == GRLIB_side_enemy) then {
				stats_opfor_soldiers_killed = stats_opfor_soldiers_killed + 1;
				if (isplayer _killer) then {
					stats_opfor_killed_by_players = stats_opfor_killed_by_players + 1;
				};
			};

			if (side (group _unit) == GRLIB_side_friendly) then {
				stats_blufor_teamkills = stats_blufor_teamkills + 1;
			};

			if (side (group _unit) == GRLIB_side_friendly) then {
				stats_blufor_teamkills = stats_blufor_teamkills + 1;
			};
		};

		if (side (group _unit) == GRLIB_side_resistance) then {
			KP_liberation_guerilla_strength = KP_liberation_guerilla_strength - 1;
			if (((GRLIB_side_friendly getFriend GRLIB_side_resistance) >= 0.6) && (side _killer == GRLIB_side_friendly)) then {
				if (KP_liberation_asymmetric_debug > 0) then {diag_log format ["[KP LIBERATION] [ASYMMETRIC] Guerilla unit killed by: %1", name _killer];};
				[3, [(name _unit)]] remoteExec ["F_cr_globalMsg"];
				[KP_liberation_cr_resistance_penalty, true] spawn F_cr_changeCR;
			};
		};
	} else {
		if (typeof _unit in all_hostile_classnames) then {
			stats_opfor_vehicles_killed = stats_opfor_vehicles_killed + 1;
			if (isplayer _killer) then {
				stats_opfor_vehicles_killed_by_players = stats_opfor_vehicles_killed_by_players + 1;
			};
		} else {
			stats_blufor_vehicles_killed = stats_blufor_vehicles_killed + 1;
		};
	};
} else {
	if (KP_liberation_ace && local _unit) then {
		if (KP_liberation_kill_debug > 0) then {private _text = format ["[KP LIBERATION] [KILL] _unit is local to: %1", debug_source];_text remoteExec ["diag_log",2];};
		KP_liberation_ace_killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];
		publicVariable "KP_liberation_ace_killer";
	};
};

if (isServer && !isplayer _unit) then {
	if (((typeof _unit) == KP_liberation_ammo_crate) && ((getPosATL _unit) select 2 < 10)) then {
		("R_80mm_HE" createVehicle (getPosATL _unit)) setVelocity [0, 0, -200];
		deleteVehicle _unit;
	} else {
		sleep GRLIB_cleanup_delay;
		hidebody _unit;
		sleep 10;
		deleteVehicle _unit;
	};
};
