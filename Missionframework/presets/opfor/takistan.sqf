/*
Needed Mods:
- RHS USAF
- RHS AFRF
- Project OPFOR

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "LOP_TKA_Infantry_Officer";								//Officer
opfor_squad_leader = "LOP_TKA_Infantry_SL";								//Squad Leader
opfor_team_leader = "LOP_TKA_Infantry_TL";								//Team Leader
opfor_sentry = "LOP_TKA_Infantry_Rifleman";								//Rifleman (Lite)
opfor_rifleman = "LOP_TKA_Infantry_Rifleman_2";							//Rifleman
opfor_rpg = "LOP_TKA_Infantry_Rifleman_3";								//Rifleman (LAT)
opfor_grenadier = "LOP_TKA_Infantry_GL";								//Grenadier
opfor_machinegunner = "LOP_TKA_Infantry_MG";							//Autorifleman
opfor_heavygunner = "LOP_TKA_Infantry_MG";								//Heavy Gunner
opfor_marksman = "LOP_TKA_Infantry_Marksman";							//Marksman
opfor_sharpshooter = "LOP_TKA_Infantry_Marksman";						//Sharpshooter
opfor_sniper = "LOP_TKA_Infantry_Marksman";								//Sniper
opfor_at = "LOP_TKA_Infantry_AT";										//AT Specialist
opfor_aa = "LOP_TKA_Infantry_AA";										//AA Specialist
opfor_medic = "LOP_TKA_Infantry_Corpsman";								//Combat Life Saver
opfor_engineer = "LOP_TKA_Infantry_Engineer";							//Engineer
opfor_paratrooper = "LOP_TKA_Infantry_Rifleman";						//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "LOP_TKA_UAZ";												//UAZ-3151
opfor_mrap_armed = "LOP_TKA_UAZ_AGS";									//UAZ-3151 (AGS-30)
opfor_transport_helo = "LOP_TKA_Mi8MT_Cargo";							//Mi-8MT (Cargo)
opfor_transport_truck = "LOP_TKA_Ural";									//Ural-4320 Transport (Covered)
opfor_ammobox_transport = "LOP_TKA_Ural_open";							//Ural-4320 Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";								//Ural-4320 Fuel
opfor_ammo_truck = "rhs_gaz66_ammo_msv";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "lop_Flag_tak_F";											//Takistani Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"LOP_TKA_Infantry_Rifleman",										//Rifleman (Lite)
	"LOP_TKA_Infantry_Rifleman",										//Rifleman (Lite)
	"LOP_TKA_Infantry_Rifleman_2",										//Rifleman
	"LOP_TKA_Infantry_Rifleman_2",										//Rifleman
	"LOP_TKA_Infantry_Rifleman_3",										//Rifleman (AT)
	"LOP_TKA_Infantry_MG",												//Autorifleman
	"LOP_TKA_Infantry_Marksman",										//Marksman
	"LOP_TKA_Infantry_Corpsman",										//Medic
	"LOP_TKA_Infantry_Engineer"											//Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"LOP_TKA_UAZ_DshKM"													//UAZ-3151 (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"LOP_TKA_UAZ_DshKM",												//UAZ-3151 (DShKM)
	"LOP_TKA_UAZ_AGS",													//UAZ-3151 (AGS-30)
	"LOP_TKA_UAZ_SPG",													//UAZ-3151 (SPG-9)
	"LOP_TKA_BMP2",														//BMP-2
	"LOP_TKA_BMP2D",													//BMP-2D
	"LOP_TKA_BTR70",													//BTR-70
	"LOP_TKA_ZSU234",													//ZSU-23-4V
	"LOP_TKA_ZSU234",													//ZSU-23-4V
	"LOP_TKA_T55",														//T-55A
	"LOP_TKA_T72BB",													//T-72B
	"LOP_TKA_T72BB"														//T-72B
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"LOP_TKA_UAZ_DshKM",												//UAZ-3151 (DShKM)
	"LOP_TKA_UAZ_AGS",													//UAZ-3151 (AGS-30)
	"LOP_TKA_BMP1",														//BMP-1
	"LOP_TKA_BMP1D",													//BMP-1D
	"LOP_TKA_BTR60"														//BTR-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"LOP_TKA_UAZ",														//UAZ-3151 (Covered)
	"LOP_TKA_UAZ_DshKM",												//UAZ-3151 (DShKM)
	"LOP_TKA_UAZ_AGS",													//UAZ-3151 (AGS-30)
	"LOP_TKA_UAZ_SPG",													//UAZ-3151 (SPG-9)
	"LOP_TKA_Ural_open",												//Ural-4320 Transport
	"LOP_TKA_Ural",														//Ural-4320 Transport (Covered)
	"LOP_TKA_BMP2",														//BMP-2
	"LOP_TKA_BMP2D",													//BMP-2D
	"LOP_TKA_BTR70",													//BTR-70
	"LOP_TKA_ZSU234",													//ZSU-23-4V
	"LOP_TKA_ZSU234",													//ZSU-23-4V
	"LOP_TKA_T55",														//T-55A
	"LOP_TKA_T72BB",													//T-72B
	"LOP_TKA_T72BB",													//T-72B
	"LOP_TKA_Mi24V_AT",													//Mi-24P (AT)
	"LOP_TKA_Mi24V_UPK23",												//Mi-24V (UPK)
	"LOP_TKA_Mi8MT_Cargo"												//Mi-8MT (Cargo)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"LOP_TKA_UAZ_Open",													//UAZ-3151
	"LOP_TKA_UAZ_DshKM",												//UAZ-3151 (DShKM)
	"LOP_TKA_UAZ_AGS",													//UAZ-3151 (AGS-30)
	"LOP_TKA_Ural_open",												//Ural-4320 Transport
	"LOP_TKA_BMP1",														//BMP-1
	"LOP_TKA_BMP1D",													//BMP-1D
	"LOP_TKA_BTR60",													//BTR-60PB
	"LOP_TKA_ZSU234",													//ZSU-23-4V
	"LOP_TKA_Mi24V_AT",													//Mi-24P (AT)
	"LOP_TKA_Mi24V_UPK23",												//Mi-24V (UPK)
	"LOP_TKA_Mi8MT_Cargo"												//Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"LOP_TKA_Ural_open",												//Ural-4320 Transport
	"LOP_TKA_Ural",														//Ural-4320 Transport (Covered)
	"LOP_TKA_BTR70",													//BTR-70
	"LOP_TKA_BMP1D",													//BMP-1D
	"LOP_TKA_BMP2D",													//BMP-2D
	"LOP_TKA_Mi8MT_Cargo",												//Mi-8MT (Cargo)
	"LOP_TKA_Mi24V_AT",													//Mi-24P (AT)
	"LOP_TKA_Mi24V_UPK23"												//Mi-24V (UPK)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"LOP_TKA_Mi8MT_Cargo",												//Mi-8MT (Cargo)
	"LOP_TKA_Mi24V_AT",													//Mi-24P (AT)
	"LOP_TKA_Mi24V_UPK23"												//Mi-24V (UPK)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"RHS_Su25SM_vvsc",													//Su-25
	"RHS_Su25SM_KH29_vvsc"												//Su-25 (KH29)
];
