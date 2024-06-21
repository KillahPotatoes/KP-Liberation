/*
    File: sla.sqf
    Author: PSYKO-nz - https://github.com/PSYKO-nz
    Date: 2018-02-19
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Sahrani Liberation Army enemy preset.

    Needed Mods:
        - Project OPFOR
        - RHS AFRF
        - RHS GREF
        - RHS USAF

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "LOP_SLA_Infantry_Officer";
KPLIB_o_squadLeader = "LOP_SLA_Infantry_SL";
KPLIB_o_teamLeader = "LOP_SLA_Infantry_TL";
KPLIB_o_sentry = "LOP_SLA_Infantry_Rifleman";
KPLIB_o_rifleman = "LOP_SLA_Infantry_Rifleman_2";
KPLIB_o_riflemanLAT = "LOP_SLA_Infantry_AT";
KPLIB_o_grenadier = "LOP_SLA_Infantry_GL";
KPLIB_o_machinegunner = "LOP_SLA_Infantry_MG";
KPLIB_o_heavyGunner = "LOP_SLA_Infantry_MG";
KPLIB_o_marksman = "LOP_SLA_Infantry_Marksman";
KPLIB_o_sharpshooter = "LOP_SLA_Infantry_Marksman";
KPLIB_o_sniper = "LOP_SLA_Infantry_Marksman";
KPLIB_o_atSpecialist = "LOP_SLA_Infantry_AT";
KPLIB_o_aaSpecialist = "LOP_SLA_Infantry_AA";
KPLIB_o_medic = "LOP_SLA_Infantry_Corpsman";
KPLIB_o_engineer = "LOP_SLA_Infantry_Engineer";
KPLIB_o_paratrooper = "LOP_SLA_Infantry_Rifleman";

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "LOP_SLA_UAZ";
KPLIB_o_mrapArmed = "LOP_SLA_UAZ_DshKM";
KPLIB_o_transportHeli = "LOP_SLA_Mi8MT_Cargo";
KPLIB_o_transportTruck = "LOP_SLA_Ural";
KPLIB_o_transportTruckAmmo = "LOP_SLA_Ural_open";                          //-> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "rhs_gaz66_ammo_vmf";
KPLIB_o_ammoTruck = "rhs_gaz66_ammo_vmf";
KPLIB_o_fuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";
KPLIB_o_ammoContainer = "Land_Pod_Heli_Transport_04_ammo_F";
KPLIB_o_flag = "lop_Flag_sla_F";

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
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

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "LOP_SLA_UAZ_SPG",
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_UAZ",
    "LOP_SLA_UAZ_Open"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
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
KPLIB_o_armyVehiclesLight = [
    "LOP_SLA_UAZ_SPG",
    "LOP_SLA_UAZ_DshKM",
    "LOP_SLA_UAZ_AGS",
    "LOP_SLA_BTR60",
    "LOP_SLA_BMP2"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
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
KPLIB_o_battleGrpVehiclesLight = [
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
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "LOP_SLA_Ural_open",
    "LOP_SLA_Ural",
    "LOP_SLA_Mi8MTV3_FAB",
    "LOP_SLA_Mi8MT_Cargo",
    "LOP_SLA_Mi8MTV3_UPK23"
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "LOP_SLA_Mi8MTV3_FAB",
    "LOP_SLA_Mi8MT_Cargo",
    "LOP_SLA_Mi8MTV3_UPK23"
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [];
