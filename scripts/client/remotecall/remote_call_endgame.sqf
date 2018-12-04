publicstats = _this select 0;

stats_opfor_soldiers_killed = publicstats select 0;
stats_opfor_killed_by_players = publicstats select 1;
stats_blufor_soldiers_killed = publicstats select 2;
stats_player_deaths = publicstats select 3;
stats_opfor_vehicles_killed = publicstats select 4;
stats_opfor_vehicles_killed_by_players = publicstats select 5;
stats_blufor_vehicles_killed = publicstats select 6;
stats_blufor_soldiers_recruited = publicstats select 7;
stats_blufor_vehicles_built = publicstats select 8;
stats_civilians_killed = publicstats select 9;
stats_civilians_killed_by_players = publicstats select 10;
stats_sectors_liberated = publicstats select 11;
stats_playtime = publicstats select 12;
stats_spartan_respawns = publicstats select 13;
stats_secondary_objectives = publicstats select 14;
stats_hostile_battlegroups = publicstats select 15;
stats_ieds_detonated = publicstats select 16;
stats_saves_performed = publicstats select 17;
stats_saves_loaded = publicstats select 18;
stats_reinforcements_called = publicstats select 19;
stats_prisonners_captured = publicstats select 20;
stats_blufor_teamkills = publicstats select 21;
stats_vehicles_recycled = publicstats select 22;
stats_ammo_spent = publicstats select 23;
stats_sectors_lost = publicstats select 24;
stats_fobs_built = publicstats select 25;
stats_fobs_lost = publicstats select 26;
stats_readiness_earned = publicstats select 27;

{ _x allowDamage false; (vehicle _x) allowDamage false; } foreach allPlayers;
GRLIB_endgame = 1;
sleep 20;

[] call compileFinal preprocessFileLineNumbers "scripts\client\ui\end_screen.sqf";