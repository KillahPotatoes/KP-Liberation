scriptName "synchronise_vars";

one_synchro_done = false;
synchro_done = false;

waitUntil {!isNil "sync_vars"};

while {true} do {
    waitUntil {sleep 0.2; (count sync_vars) > 0};

    KPLIB_fob_resources = sync_vars select 0;
    KPLIB_supplies_global = sync_vars select 1;
    KPLIB_ammo_global = sync_vars select 2;
    KPLIB_fuel_global = sync_vars select 3;
    unitcap = sync_vars select 4;
    KPLIB_heli_count = sync_vars select 5;
    KPLIB_plane_count = sync_vars select 6;
    KPLIB_heli_slots = sync_vars select 7;
    KPLIB_plane_slots = sync_vars select 8;
    KPLIB_enemyReadiness = sync_vars select 9;
    resources_intel = sync_vars select 10;
    infantry_cap = sync_vars select 11;
    KPLIB_civ_rep = sync_vars select 12;
    KPLIB_guerilla_strength = sync_vars select 13;
    infantry_weight = sync_vars select 14;
    armor_weight = sync_vars select 15;
    air_weight = sync_vars select 16;

    sync_vars = [];
    one_synchro_done = true;
    synchro_done = true;
};
