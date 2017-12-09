/*
Needed Mods:
- RHS USAF
- RHS AFRF
- Project OPFOR

Optional Mods:
- None
*/

// Enemy infantry classes
opfor_officer = "LOP_ISTS_OPF_Infantry_SL";								//Officer (Warlord)
opfor_squad_leader = "LOP_ISTS_OPF_Infantry_SL";						//Squad Leader (Warlord)
opfor_team_leader = "LOP_ISTS_OPF_Infantry_TL";							//Team Leader (Chief)
opfor_sentry = "LOP_ISTS_OPF_Infantry_Rifleman";						//Rifleman (AKM)
opfor_rifleman = "LOP_ISTS_OPF_Infantry_Rifleman_5";					//Rifleman (AK-74)
opfor_rpg = "LOP_ISTS_OPF_Infantry_AT";									//Rifleman (RPG-7)
opfor_grenadier = "LOP_ISTS_OPF_Infantry_GL";							//Grenadier (AKM GP-25)
opfor_machinegunner = "LOP_ISTS_OPF_Infantry_AR_Asst";					//Autorifleman (AR_Asst)
opfor_heavygunner = "LOP_ISTS_OPF_Infantry_AR";							//Heavy Gunner (PKM)
opfor_marksman = "LOP_ISTS_OPF_Infantry_Rifleman_2";					//Marksman (Lee Enfield)
opfor_sharpshooter = "LOP_ISTS_OPF_Infantry_Marksman";					//Sharpshooter (SVD)
opfor_sniper = "LOP_ISTS_OPF_Infantry_Marksman";						//Sniper (SVD)
opfor_at = "LOP_ISTS_OPF_Infantry_AT";									//AT Specialist (RPG-7)
opfor_aa = "LOP_ISTS_OPF_Infantry_AT";									//AA Specialist (RPG-7)
opfor_medic = "LOP_ISTS_OPF_Infantry_Corpsman";							//Combat Life Saver (Bonesetter)
opfor_engineer = "LOP_ISTS_OPF_Infantry_Engineer";						//Engineer (Bomber)
opfor_paratrooper = "LOP_ISTS_OPF_Infantry_Rifleman_6";					//Paratrooper (AKM PM-63)

// Enemy vehicles used by secondary objectives.
opfor_mrap = "LOP_ISTS_OPF_Offroad";									//Offroad
opfor_mrap_armed = "LOP_ISTS_OPF_Offroad_M2";							//Offroad (M2)
opfor_transport_helo = "LOP_TKA_Mi8MT_Cargo";							//Mi-8MT (Cargo)
opfor_transport_truck = "LOP_TKA_Ural";									//Ural-4320 (Covered)
opfor_ammobox_transport = "LOP_TKA_Ural_open";							//Ural-4320 (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "RHS_Ural_Fuel_MSV_01";								//Ural-4320 (Fuel)
opfor_ammo_truck = "rhs_gaz66_ammo_msv";								//GAZ-66 (Ammo)
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "lop_Flag_tak_F";											//Takistan Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
	"LOP_AM_OPF_Infantry_Rifleman",										//Rifleman (AKM)
	"LOP_AM_OPF_Infantry_Rifleman",										//Rifleman (AKM)
	"LOP_AM_OPF_Infantry_Rifleman_5",									//Rifleman (AKM-74)
	"LOP_AM_OPF_Infantry_Rifleman_5",									//Rifleman (AKM-74)
	"LOP_AM_OPF_Infantry_AT",											//Rifleman (RPG-7)
	"LOP_AM_OPF_Infantry_AR",											//Autorifleman (PKM)
	"LOP_AM_OPF_Infantry_Rifleman_3",									//Marksman (Lee Enfield)
	"LOP_AM_OPF_Infantry_Corpsman",										//Medic (Bonesetter)
	"LOP_AM_OPF_Infantry_Engineer"										//Engineer (Bomber)
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"LOP_AM_OPF_UAZ_DshKM"												//UAZ-3151 (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"LOP_ISTS_OPF_Landrover_M2",										//Land Rover (M2)
	"LOP_ISTS_OPF_Landrover_SPG9",										//Land Rover (SPG)
	"LOP_ISTS_OPF_M1025_W_M2",											//M10252 (M2)
	"LOP_ISTS_OPF_M1025_W_Mk19",										//M1025A2 (Mk19)
	"LOP_ISTS_OPF_Offroad_M2",											//Offroad (M2)
	"LOP_ISTS_OPF_BMP2",												//BMP-2
	"LOP_ISTS_OPF_BTR60",												//BTR-60PB
	"LOP_ISTS_OPF_T34",													//T-34-85M
	"LOP_ISTS_OPF_T55",													//T55A
	"LOP_ISTS_OPF_T55",													//T55A
	"LOP_ISTS_OPF_T72BA",												//T72B
	"LOP_ISTS_OPF_T72BA",												//T72B
	"LOP_ISTS_OPF_ZSU234",												//ZSU-23-4V
	"LOP_ISTS_OPF_ZSU234"												//ZSU-23-4V
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"LOP_ISTS_OPF_Landrover_M2",										//Land Rover (M2)
	"LOP_ISTS_OPF_Nissan_PKM",											//Nissan (PKM)
	"LOP_ISTS_OPF_Nissan_PKM",											//Nissan (PKM)
	"LOP_ISTS_OPF_Nissan_PKM",											//Nissan (PKM)
	"LOP_ISTS_OPF_BMP1",												//BMP-1
	"LOP_ISTS_OPF_BMP1",												//BMP-1
	"LOP_ISTS_OPF_BMP2",												//BMP-2
	"LOP_ISTS_OPF_BTR60"												//BTR-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"LOP_ISTS_OPF_Landrover_M2",										//Land Rover (M2)
	"LOP_ISTS_OPF_Landrover_SPG9",										//Land Rover (SPG)
	"LOP_ISTS_OPF_M1025_W_M2",											//M10252 (M2)
	"LOP_ISTS_OPF_M1025_W_Mk19",										//M1025A2 (Mk19)
	"LOP_ISTS_OPF_Offroad_M2",											//Offroad (M2)
	"LOP_ISTS_OPF_Truck",												//Truck (Cargo)
	"LOP_ISTS_OPF_Truck",												//Truck (Cargo)
	"LOP_ISTS_OPF_BMP2",												//BMP-2
	"LOP_ISTS_OPF_BTR60",												//BTR-60PB
	"LOP_ISTS_OPF_T34",													//T-34-85M
	"LOP_ISTS_OPF_T55",													//T55A
	"LOP_ISTS_OPF_T55",													//T55A
	"LOP_ISTS_OPF_T72BA",												//T72B
	"LOP_ISTS_OPF_T72BA",												//T72B
	"LOP_ISTS_OPF_ZSU234",												//ZSU-23-4V
	"LOP_ISTS_OPF_ZSU234",												//ZSU-23-4V
	"LOP_TKA_Mi8MT_Cargo",												//Mi-8MT (Cargo)
	"LOP_TKA_Mi24V_AT",													//Mi-24V (AT)
	"LOP_TKA_Mi24V_FAB",												//Mi-24V (FAB)
	"LOP_TKA_Mi24V_UPK23"												//Mi-24V (UPK)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"LOP_ISTS_OPF_Landrover_M2",										//Land Rover (M2)
	"LOP_ISTS_OPF_Nissan_PKM",											//Nissan (PKM)
	"LOP_ISTS_OPF_Nissan_PKM",											//Nissan (PKM)
	"LOP_ISTS_OPF_Nissan_PKM",											//Nissan (PKM)
	"LOP_ISTS_OPF_Truck",												//Truck (Cargo)
	"LOP_ISTS_OPF_Truck",												//Truck (Cargo)
	"LOP_ISTS_OPF_BMP1",												//BMP-1
	"LOP_ISTS_OPF_BMP1",												//BMP-1
	"LOP_ISTS_OPF_BMP2",												//BMP-2
	"LOP_ISTS_OPF_BTR60",												//BTR-60PB
	"LOP_ISTS_OPF_T34",													//T-34-85M
	"LOP_ISTS_OPF_ZSU234",												//ZSU-23-4V
	"LOP_TKA_Mi8MT_Cargo",												//Mi-8MT (Cargo)
	"LOP_TKA_Mi24V_AT",													//Mi-24V (AT)
	"LOP_TKA_Mi24V_FAB",												//Mi-24V (FAB)
	"LOP_TKA_Mi24V_UPK23"												//Mi-24V (UPK)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"LOP_ISTS_OPF_Truck",												//Truck (Cargo)
	"LOP_ISTS_OPF_BMP1",												//BMP-1
	"LOP_ISTS_OPF_BMP2",												//BMP-2
	"LOP_ISTS_OPF_BTR60",												//BTR-60PB
	"LOP_TKA_Mi8MT_Cargo"												//Mi-8MT (Cargo)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"LOP_TKA_Mi8MT_Cargo",												//Mi-8MT (Cargo)
	"LOP_TKA_Mi24V_AT",													//Mi-24V (AT)
	"LOP_TKA_Mi24V_FAB",												//Mi-24V (FAB)
	"LOP_TKA_Mi24V_UPK23"												//Mi-24V (UPK)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"RHS_Su25SM_vvsc",													//Su-25
	"RHS_Su25SM_KH29_vvsc"												//Su-25 (KH29)
];
