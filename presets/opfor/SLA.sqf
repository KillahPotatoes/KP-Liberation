/*
Needed Mods:
- Project OPFOR

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "LOP_SLA_Infantry_Officer";
opfor_squad_leader = "LOP_SLA_Infantry_SL";
opfor_team_leader = "LOP_SLA_Infantry_TL";
opfor_sentry = "LOP_SLA_Infantry_Rifleman";
opfor_rifleman = "LOP_SLA_Infantry_Rifleman_2";
opfor_rpg = "LOP_SLA_Infantry_AT";
opfor_grenadier = "LOP_SLA_Infantry_GL";
opfor_machinegunner = "LOP_SLA_Infantry_MG";
opfor_heavygunner = "LOP_SLA_Infantry_MG";
opfor_marksman = "LOP_SLA_Infantry_Marksman";
opfor_sharpshooter = "LOP_SLA_Infantry_Marksman";
opfor_sniper = "LOP_SLA_Infantry_Marksman";
opfor_at = "LOP_SLA_Infantry_AT";
opfor_aa = "LOP_SLA_Infantry_AA";
opfor_medic = "LOP_SLA_Infantry_Corpsman";
opfor_engineer = "LOP_SLA_Infantry_Engineer";
opfor_paratrooper = "LOP_SLA_Infantry_Rifleman";

// Enemy vehicles used by secondary objectives.
opfor_mrap = "LOP_SLA_UAZ";
opfor_mrap_armed = "LOP_SLA_UAZ_DshKM";
opfor_transport_helo = "LOP_SLA_Mi8MT_Cargo";
opfor_transport_truck = "LOP_SLA_Ural";
opfor_ammobox_transport = "LOP_SLA_Ural_open";	//-> Has to be able to transport resource crates! =>["LOP_SLA_Ural_open", -6.5, [0,-0.2,0.55], [0,-1.4,0.55], [0,-2.55,0.55]],
opfor_fuel_truck = "rhs_gaz66_ammo_vmf";
opfor_ammo_truck = "rhs_gaz66_ammo_vmf";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "lop_Flag_sla_F";

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"LOP_SLA_Infantry_Rifleman",
	"LOP_SLA_Infantry_Rifleman_2",
	"LOP_SLA_Infantry_GL",
	"LOP_SLA_Infantry_Officer",
	"LOP_SLA_Infantry_TL",
	"LOP_SLA_Infantry_SL",
	"LOP_SLA_Infantry_AA",
	"LOP_SLA_Infantry_AT",
	"LOP_SLA_Infantry_Marksman",
	"LOP_SLA_Infantry_Corpsman",
	"LOP_SLA_Infantry_Engineer"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"LOP_SLA_UAZ_SPG",
	"LOP_SLA_UAZ_DshKM",
	"LOP_SLA_UAZ_AGS",
	"LOP_SLA_UAZ",
	"LOP_SLA_UAZ_Open"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"LOP_SLA_UAZ_SPG",
	"LOP_SLA_UAZ_DshKM",
	"LOP_SLA_UAZ_AGS",
	"LOP_SLA_BMP2D",
	"LOP_SLA_BMP2",
	"LOP_SLA_BMP1D",
	"LOP_SLA_BMP1",
	"LOP_SLA_BTR60",
	"LOP_SLA_BTR70",
	"LOP_SLA_ZSU234",
	"LOP_SLA_T72BB",
	"LOP_SLA_T72BA"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"LOP_SLA_UAZ_SPG",
	"LOP_SLA_UAZ_DshKM",
	"LOP_SLA_UAZ_AGS",
	"LOP_SLA_BTR60",
	"LOP_SLA_BMP2"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"LOP_SLA_UAZ_SPG",
	"LOP_SLA_UAZ_DshKM",
	"LOP_SLA_UAZ_AGS",
	"LOP_SLA_Ural_open",
	"LOP_SLA_Ural",
	"LOP_SLA_BTR60",
	"LOP_SLA_BMP1",
	"LOP_SLA_ZSU234",
	"LOP_SLA_T72BA",
	"LOP_SLA_T72BB",
	"LOP_SLA_Mi8MTV3_FAB",
	"LOP_SLA_Mi8MT_Cargo",
	"LOP_SLA_Mi8MTV3_UPK23"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"LOP_SLA_UAZ_DshKM",
	"LOP_SLA_UAZ_AGS",
	"LOP_SLA_Ural",
	"LOP_SLA_BTR70",
	"LOP_SLA_BMP1D",
	"LOP_SLA_BMP2D",
	"LOP_SLA_ZSU234",
	"LOP_SLA_Mi8MTV3_UPK23",
	"LOP_SLA_Mi8MT_Cargo"
];


/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"LOP_SLA_Ural_open",
	"LOP_SLA_Ural",
	"LOP_SLA_Mi8MTV3_FAB",
	"LOP_SLA_Mi8MT_Cargo",
	"LOP_SLA_Mi8MTV3_UPK23"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"LOP_SLA_Mi8MTV3_FAB",
	"LOP_SLA_Mi8MT_Cargo",
	"LOP_SLA_Mi8MTV3_UPK23"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [];
