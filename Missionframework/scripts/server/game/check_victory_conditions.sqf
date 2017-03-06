sleep 5;

_blufor_bigtowns = [ blufor_sectors, { _x in sectors_bigtown } ] call BIS_fnc_conditionalSelect;

if ( count _blufor_bigtowns == count sectors_bigtown ) then {
	GRLIB_endgame = 1;
	publicVariable "GRLIB_endgame";
	{ _x allowDamage false; (vehicle _x) allowDamage false; } foreach allPlayers;

	publicstats = [];
	publicstats pushback stats_opfor_soldiers_killed;
	publicstats pushback stats_opfor_killed_by_players;
	publicstats pushback stats_blufor_soldiers_killed;
	publicstats pushback stats_player_deaths;
	publicstats pushback stats_opfor_vehicles_killed;
	publicstats pushback stats_opfor_vehicles_killed_by_players;
	publicstats pushback stats_blufor_vehicles_killed;
	publicstats pushback stats_blufor_soldiers_recruited;
	publicstats pushback stats_blufor_vehicles_built;
	publicstats pushback stats_civilians_killed;
	publicstats pushback stats_civilians_killed_by_players;
	publicstats pushback stats_sectors_liberated;
	publicstats pushback stats_playtime;
	publicstats pushback stats_spartan_respawns;
	publicstats pushback stats_secondary_objectives;
	publicstats pushback stats_hostile_battlegroups;
	publicstats pushback stats_ieds_detonated;
	publicstats pushback stats_saves_performed;
	publicstats pushback stats_saves_loaded;
	publicstats pushback stats_reinforcements_called;
	publicstats pushback stats_prisonners_captured;
	publicstats pushback stats_blufor_teamkills;
	publicstats pushback stats_vehicles_recycled;
	publicstats pushback stats_ammo_spent;
	publicstats pushback stats_sectors_lost;
	publicstats pushback stats_fobs_built;
	publicstats pushback stats_fobs_lost;
	publicstats pushback (round stats_readiness_earned);

	[ [ publicstats ] , "remote_call_endgame" ] call BIS_fnc_MP;

	sleep 20;

	{ if ( !(isPlayer _x)) then { deleteVehicle _x } } foreach allUnits;

};