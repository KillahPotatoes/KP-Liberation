params ["_liberated_sector"];

private _combat_readiness_increase = 0;

if (_liberated_sector in sectors_bigtown) then {
	_combat_readiness_increase = (floor (random 10)) * GRLIB_difficulty_modifier;
};

if (_liberated_sector in sectors_capture) then {
	_combat_readiness_increase = (floor (random 6)) * GRLIB_difficulty_modifier;
};

if (_liberated_sector in sectors_military) then {
	_combat_readiness_increase = (5 + (floor (random 11))) * GRLIB_difficulty_modifier;
};

if (_liberated_sector in sectors_factory) then {
	_combat_readiness_increase = (3 + (floor (random 7))) * GRLIB_difficulty_modifier;
};

if (_liberated_sector in sectors_tower) then {
	_combat_readiness_increase = (floor (random 4));
};

combat_readiness = combat_readiness + _combat_readiness_increase;
if (combat_readiness > 100.0 && GRLIB_difficulty_modifier <= 2.0) then {combat_readiness = 100.0};
stats_readiness_earned = stats_readiness_earned + _combat_readiness_increase;
[_liberated_sector, 0] remoteExec ["remote_call_sector"];

reset_battlegroups_ai = true; publicVariable "reset_battlegroups_ai";

blufor_sectors pushback _liberated_sector; publicVariable "blufor_sectors";
stats_sectors_liberated = stats_sectors_liberated + 1;

if (_liberated_sector in sectors_factory) then {

	private _sectorType = 1;
	private _sectorFacilities = ([KP_liberation_production_markers, {_liberated_sector == (_x select 0)}] call BIS_fnc_conditionalSelect) select 0;
	private _producing = 3;

	{
		if (_liberated_sector in _x) exitWith {KP_liberation_production = KP_liberation_production - [_x];};
	} forEach KP_liberation_production;

	KP_liberation_production pushBack [
		(markerText _liberated_sector),
		_liberated_sector,
		_sectorType,
		[],
		_sectorFacilities select 1,
		_sectorFacilities select 2,
		_sectorFacilities select 3,
		_producing,
		KP_liberation_production_interval,
		0,
		0,
		0
	];
};

[_liberated_sector] spawn F_cr_liberatedSector;

if ((random 100) <= KP_liberation_cr_wounded_chance) then {
	[_liberated_sector] spawn civrep_wounded_civs;
};

asymm_blocked_sectors pushBack [_liberated_sector, time];
publicVariable "asymm_blocked_sectors";

[] spawn check_victory_conditions;

sleep 1;

trigger_server_save = true;

sleep 45;

if (GRLIB_endgame == 0) then {
	if ((!(_liberated_sector in sectors_tower)) && (((random (200.0 / (GRLIB_difficulty_modifier * GRLIB_csat_aggressivity))) < (combat_readiness - 20)) || (_liberated_sector in sectors_bigtown)) && ([] call F_opforCap < GRLIB_battlegroup_cap)) then {
		[_liberated_sector] spawn spawn_battlegroup;
	};
};
