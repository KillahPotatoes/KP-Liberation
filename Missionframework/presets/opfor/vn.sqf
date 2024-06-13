/*
    Needed Mods:
    - S.O.G. Prairie Fire CDLC

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "vn_o_men_nva_01";
opfor_squad_leader = "vn_o_men_nva_06";
opfor_team_leader = "vn_o_men_nva_03";
opfor_sentry = "vn_o_men_nva_02";
opfor_rifleman = "vn_o_men_nva_05";
opfor_rpg = "vn_o_men_nva_14";
opfor_grenadier = "vn_o_men_nva_07";
opfor_machinegunner = "vn_o_men_nva_11";
opfor_heavygunner = "vn_o_men_nva_11";
opfor_marksman = "vn_o_men_nva_10";
opfor_sharpshooter = "vn_o_men_nva_10";
opfor_sniper = "vn_o_men_nva_10";
opfor_at = "vn_o_men_nva_14";
opfor_aa = "vn_o_men_nva_43";
opfor_medic = "vn_o_men_nva_08";
opfor_engineer = "vn_o_men_nva_09";
opfor_paratrooper = "vn_o_men_nva_12";

// Enemy vehicles used by secondary objectives.
opfor_mrap = "vn_o_wheeled_btr40_01";
opfor_mrap_armed = "vn_o_wheeled_btr40_mg_01";
opfor_transport_helo = "vn_o_air_mi2_01_01";
opfor_transport_truck = "vn_o_wheeled_z157_01";
opfor_ammobox_transport = "vn_o_wheeled_z157_02";
opfor_fuel_truck = "vn_o_wheeled_z157_fuel";
opfor_ammo_truck = "vn_o_wheeled_z157_ammo";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "vn_flag_pavn";

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "vn_o_men_nva_06",
    "vn_o_men_nva_05",
    "vn_o_men_nva_06",
    "vn_o_men_nva_04",
    "vn_o_men_nva_07",
    "vn_o_men_nva_09",
    "vn_o_men_nva_11",
    "vn_o_men_nva_12",
    "vn_o_men_nva_14",
    "vn_o_men_nva_01",
    "vn_o_men_nva_02",
    "vn_o_men_nva_02",
    "vn_o_men_nva_04",
    "vn_o_men_nva_07",
    "vn_o_men_nva_08",
    "vn_o_men_nva_13",
    "vn_o_men_nva_05"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "vn_o_wheeled_btr40_mg_01"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "vn_o_wheeled_z157_mg_01",
    "vn_o_wheeled_z157_mg_02",
    "vn_o_wheeled_btr40_mg_02",
    "vn_o_wheeled_btr40_mg_01",
    "vn_o_wheeled_btr40_mg_03",
    "vn_o_armor_type63_01_nva65"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "vn_o_wheeled_z157_mg_01",
    "vn_o_wheeled_btr40_mg_01",
    "vn_o_wheeled_btr40_mg_02"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "vn_o_wheeled_z157_mg_01",
    "vn_o_wheeled_z157_mg_02",
    "vn_o_wheeled_z157_01",
    "vn_o_wheeled_btr40_mg_02",
    "vn_o_wheeled_btr40_mg_01",
    "vn_o_wheeled_btr40_mg_03",
    "vn_o_armor_type63_01_nva65"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "vn_o_wheeled_z157_mg_01",
    "vn_o_wheeled_btr40_mg_02",
    "vn_o_wheeled_btr40_mg_01"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "vn_o_wheeled_z157_01",
    "vn_o_wheeled_btr40_01"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "vn_o_air_mi2_04_05",
    "vn_o_air_mi2_04_02",
    "vn_o_air_mi2_04_03",
    "vn_o_air_mi2_05_06",
    "vn_o_air_mi2_05_01",
    "vn_o_air_mi2_05_03",
    "vn_o_air_mi2_03_06",
    "vn_o_air_mi2_03_03"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
];
