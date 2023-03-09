/*
    Needed Mods:
    - IFA3A IO
	- Flying Legends
	- Secret Weapons (Reworked)
	- Northern Fronts
	- ACE
    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "O_NORTH_SOV_W_39_Officer";
opfor_squad_leader = "O_NORTH_SOV_W_39_Rifleman_SGT";
opfor_team_leader = "O_NORTH_SOV_W_39_Autorifleman";
opfor_sentry = "O_NORTH_SOV_W_39_Unequipped";
opfor_rifleman = "O_NORTH_SOV_W_39_Rifleman";
opfor_rpg = "O_NORTH_SOV_W_39_Submachinegunner";
opfor_grenadier = "O_NORTH_SOV_W_39_Submachinegunner_38";
opfor_machinegunner = "O_NORTH_SOV_W_39_Machinegunner_Assistant";
opfor_heavygunner = "O_NORTH_SOV_W_39_Machinegunner";
opfor_marksman = "O_NORTH_SOV_W_39_Rifleman";
opfor_sharpshooter = "o_NORTH_SOV_W_39_Sniper";
opfor_sniper = "O_NORTH_SOV_W_39_Rifleman";
opfor_at = "O_NORTH_SOV_W_39_Submachinegunner";
opfor_aa = "O_NORTH_SOV_W_39_Submachinegunner";
opfor_medic = "O_NORTH_SOV_W_39_Medic";
opfor_engineer = "O_NORTH_SOV_W_39_T_Crewman";
opfor_paratrooper = "O_NORTH_SOV_V_W_39_Autorifleman_Avtomat";

// Enemy vehicles used by secondary objectives.
opfor_mrap = "NORTH_SOV_W_39_T26_M31";
opfor_mrap_armed = "NORTH_SOV_W_39_T26_M33";
opfor_transport_helo = "LIB_Zis5v";
opfor_transport_truck = "LIB_Zis5v";
opfor_ammobox_transport = "LIB_Zis6_Parm";
opfor_fuel_truck = "LIB_Zis5v_fuel_w";
opfor_ammo_truck = "LIB_Zis6_Parm";
opfor_fuel_container = "LIB_Zis5v_fuel_w";
opfor_ammo_container = "LIB_Zis6_Parm";
opfor_flag = "NORTH_Flag_USSR";

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "O_NORTH_SOV_N_W_39_Autorifleman",
    "O_NORTH_SOV_N_W_39_Machinegunner",
    "O_NORTH_SOV_N_W_39_Machinegunner_Assistant",
    "O_NORTH_SOV_N_W_39_Rifleman",
    "O_NORTH_SOV_N_W_39_Rifleman_SGT",
    "O_NORTH_SOV_N_W_39_Rifleman",
    "O_NORTH_SOV_N_W_39_Rifleman",
    "O_NORTH_SOV_N_W_39_Rifleman",
    "O_NORTH_SOV_N_W_39_Unequipped",
    "O_NORTH_SOV_N_W_39_Unequipped",
    "O_NORTH_SOV_N_W_39_Rifleman"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "NORTH_SOV_W_39_T26_M31",
    "NORTH_SOV_W_39_BA10",
    "NORTH_SOV_W_39_T38",
    "LIB_61k"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "NORTH_SOV_W_39_T26_M31",
    "NORTH_SOV_W_39_T26_M38",
    "NORTH_SOV_W_39_T26_M33",
    "NORTH_SOV_W_39_BA10",
    "NORTH_SOV_W_39_BT5",
    "NORTH_SOV_W_39_BT5Com",
    "NORTH_SOV_W_39_BT7_M35",
    "NORTH_SOV_W_39_BT7Com_M35",
    "NORTH_SOV_W_39_BT7",
    "NORTH_SOV_W_39_BT7A",
    "NORTH_SOV_W_39_T20",
    "NORTH_SOV_W_39_T38"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "NORTH_SOV_W_39_T26_M31",
    "NORTH_SOV_W_39_BA10",
    "NORTH_SOV_W_39_T38"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "NORTH_SOV_W_39_T26_M31",
    "NORTH_SOV_W_39_T26_M33",
    "NORTH_SOV_W_39_T26_M33com",
    "NORTH_SOV_W_39_T26_M33_OT",
    "NORTH_SOV_W_39_T26_M38",
    "NORTH_SOV_W_39_T26_M39",
    "NORTH_SOV_W_39_T26_M39_OT",
    "NORTH_SOV_W_39_BA10",
    "NORTH_SOV_W_39_T28",
    "NORTH_SOV_W_39_T28_com",
    "NORTH_SOV_W_39_T28_M34",
    "NORTH_SOV_W_39_T28_M34_com",
    "NORTH_SOV_W_39_T28e",
    "NORTH_SOV_W_39_BT5",
    "NORTH_SOV_W_39_BT5Com",
    "NORTH_SOV_W_39_BT7_M35",
    "NORTH_SOV_W_39_BT7Com_M35",
    "NORTH_SOV_W_39_BT7",
    "NORTH_SOV_W_39_BT7A",
    "NORTH_SOV_W_39_T20",
    "NORTH_SOV_W_39_T38",
    "LIB_Zis5v"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "LIB_Zis5v",
    "LIB_Zis5v",
    "LIB_Zis5v",
    "LIB_Zis5v",
    "NORTH_SOV_W_39_BA10",
    "NORTH_SOV_W_39_T26_M33",
    "NORTH_SOV_W_39_T26_M31",
    "NORTH_SOV_W_39_T26_M38",
    "NORTH_SOV_W_39_T26_M39",
    "NORTH_SOV_W_39_BT5",
    "NORTH_SOV_W_39_BT7_M35",
    "NORTH_SOV_W_39_BT7",
    "NORTH_SOV_W_39_T38"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers thewn buggy behaviours may occur.	*/
opfor_troup_transports = [
    "NORTH_SOV_W_39_T28e",      //these can actually only hold 5. but i want it to work!
    "NORTH_SOV_W_39_T28",
    "NORTH_SOV_W_39_T28_com",
    "NORTH_SOV_W_39_T26_M33com",
    "NORTH_SOV_W_39_T26_M38",
    "NORTH_SOV_W_39_T26_M33",
    "NORTH_SOV_W_39_T26_M31",
    "NORTH_SOV_W_39_T26_M33_OT",
    "NORTH_SOV_W_39_T20",
    "LIB_Zis5v"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "sab_sw_i16"
];