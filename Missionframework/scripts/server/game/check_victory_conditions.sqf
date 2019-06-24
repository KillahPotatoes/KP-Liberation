sleep 5;

_blufor_bigtowns = blufor_sectors select {_x in sectors_bigtown};

if (count _blufor_bigtowns == count sectors_bigtown) then {
    GRLIB_endgame = 1;
    publicVariable "GRLIB_endgame";
    {_x allowDamage false; (vehicle _x) allowDamage false;} forEach allPlayers;

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
    publicstats pushback stats_reinforcements_called;
    publicstats pushback stats_prisonners_captured;
    publicstats pushback stats_blufor_teamkills;
    publicstats pushback stats_vehicles_recycled;
    publicstats pushback stats_ammo_spent;
    publicstats pushback stats_sectors_lost;
    publicstats pushback stats_fobs_built;
    publicstats pushback stats_fobs_lost;
    publicstats pushback (round stats_readiness_earned);

    [publicstats] remoteExec ["remote_call_endgame"];

    private _playtime_days = floor (stats_playtime / 86400);
    private _playtime_hours = floor ((stats_playtime % 86400) / 3600);
    private _playtime_minutes = floor ((stats_playtime % 3600) / 60);
    private _playtime_seconds = stats_playtime % 60;

    diag_log text "[KP LIBERATION] [MISSION END] ------------------------------------";
    diag_log text format ["[KP LIBERATION] [MISSION END] Playtime: %1 days, %2 hours, %3 minutes, %4 seconds", _playtime_days, _playtime_hours, _playtime_minutes, _playtime_seconds];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR infantry killed: %1", stats_opfor_soldiers_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR infantry killed by players: %1", stats_opfor_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR vehicles destroyed: %1", stats_opfor_vehicles_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] OPFOR vehicles destroyed by players: %1", stats_opfor_vehicles_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR infantry killed: %1", stats_blufor_soldiers_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Player deaths: %1", stats_player_deaths];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR friendly fire incidents: %1", stats_blufor_teamkills];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR soldiers recruited: %1", stats_blufor_soldiers_recruited];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilians killed: %1", stats_civilians_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] Civilians killed by players: %1", stats_civilians_killed_by_players];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR vehicles destroyed: %1", stats_blufor_vehicles_killed];
    diag_log text format ["[KP LIBERATION] [MISSION END] BLUFOR vehicles built: %1", stats_blufor_vehicles_built];
    diag_log text format ["[KP LIBERATION] [MISSION END] Vehicles recycled: %1", stats_vehicles_recycled];
    diag_log text format ["[KP LIBERATION] [MISSION END] Ammunition units spent: %1", stats_ammo_spent];
    diag_log text format ["[KP LIBERATION] [MISSION END] Sectors liberated: %1", stats_sectors_liberated];
    diag_log text format ["[KP LIBERATION] [MISSION END] Sectors lost: %1", stats_sectors_lost];
    diag_log text format ["[KP LIBERATION] [MISSION END] FOBs built: %1", stats_fobs_built];
    diag_log text format ["[KP LIBERATION] [MISSION END] FOBs lost: %1", stats_fobs_lost];
    diag_log text format ["[KP LIBERATION] [MISSION END] Secondary objectives accomplished: %1", stats_secondary_objectives];
    diag_log text format ["[KP LIBERATION] [MISSION END] Prisonners captured: %1", stats_prisonners_captured];
    diag_log text format ["[KP LIBERATION] [MISSION END] Hostile battlegroups called: %1", stats_hostile_battlegroups];
    diag_log text format ["[KP LIBERATION] [MISSION END] Hostile reinforcements called: %1", stats_reinforcements_called];
    diag_log text format ["[KP LIBERATION] [MISSION END] Total combat readiness raised: %1", round stats_readiness_earned];
    diag_log text format ["[KP LIBERATION] [MISSION END] IEDs detonated: %1", stats_ieds_detonated];
    diag_log text format ["[KP LIBERATION] [MISSION END] Number of Potato 01 losses: %1", stats_spartan_respawns];
    diag_log text format ["[KP LIBERATION] [MISSION END] Rabbits killed: %1", round (random 69) + round (random 69)];
    diag_log text format ["[KP LIBERATION] [MISSION END] Secondary objectives accomplished: %1", stats_secondary_objectives];
    diag_log text format ["[KP LIBERATION] [MISSION END] Prisonners captured: %1", stats_prisonners_captured];
    diag_log text "[KP LIBERATION] [MISSION END] ------------------------------------";

    sleep 20;

    {if !(isPlayer _x) then {deleteVehicle _x;}} forEach allUnits;

};
