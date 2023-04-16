/*
    File: takistan.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-07
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Takistani Armed Forces enemy preset.

    Needed Mods:
        - Project OPFOR
        - RHS AFRF
        - RHS GREF
        - RHS USAF

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "LOP_TKA_Infantry_Officer";                           // Officer
KPLIB_o_squadLeader = "LOP_TKA_Infantry_SL";                            // Squad Leader
KPLIB_o_teamLeader = "LOP_TKA_Infantry_TL";                             // Team Leader
KPLIB_o_sentry = "LOP_TKA_Infantry_Rifleman";                           // Rifleman (Lite)
KPLIB_o_rifleman = "LOP_TKA_Infantry_Rifleman_2";                       // Rifleman
KPLIB_o_riflemanLAT = "LOP_TKA_Infantry_Rifleman_3";                    // Rifleman (LAT)
KPLIB_o_grenadier = "LOP_TKA_Infantry_GL";                              // Grenadier
KPLIB_o_machinegunner = "LOP_TKA_Infantry_MG";                          // Autorifleman
KPLIB_o_heavyGunner = "LOP_TKA_Infantry_MG";                            // Heavy Gunner
KPLIB_o_marksman = "LOP_TKA_Infantry_Marksman";                         // Marksman
KPLIB_o_sharpshooter = "LOP_TKA_Infantry_Marksman";                     // Sharpshooter
KPLIB_o_sniper = "LOP_TKA_Infantry_Marksman";                           // Sniper
KPLIB_o_atSpecialist = "LOP_TKA_Infantry_AT";                           // AT Specialist
KPLIB_o_aaSpecialist = "LOP_TKA_Infantry_AA";                           // AA Specialist
KPLIB_o_medic = "LOP_TKA_Infantry_Corpsman";                            // Combat Life Saver
KPLIB_o_engineer = "LOP_TKA_Infantry_Engineer";                         // Engineer
KPLIB_o_paratrooper = "LOP_TKA_Infantry_Rifleman";                      // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "LOP_TKA_UAZ";                                           // UAZ-3151
KPLIB_o_mrapArmed = "LOP_TKA_UAZ_AGS";                                  // UAZ-3151 (AGS-30)
KPLIB_o_transportHeli = "LOP_TKA_Mi8MT_Cargo";                          // Mi-8MT (Cargo)
KPLIB_o_transportTruck = "LOP_TKA_Ural";                                // Ural-4320 Transport (Covered)
KPLIB_o_transportTruckAmmo = "LOP_TKA_Ural_open";                       // Ural-4320 Transport (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "RHS_Ural_Fuel_MSV_01";                             // Ural-4320 Fuel
KPLIB_o_ammoTruck = "rhs_gaz66_ammo_msv";                               // GAZ-66 Ammo
KPLIB_o_fuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";            // Taru Fuel Pod
KPLIB_o_ammoContainer = "Land_Pod_Heli_Transport_04_ammo_F";            // Taru Ammo Pod
KPLIB_o_flag = "lop_Flag_tak_F";                                        // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "LOP_TKA_Infantry_Rifleman",                                        // Rifleman (Lite)
    "LOP_TKA_Infantry_Rifleman",                                        // Rifleman (Lite)
    "LOP_TKA_Infantry_Rifleman_2",                                      // Rifleman
    "LOP_TKA_Infantry_Rifleman_2",                                      // Rifleman
    "LOP_TKA_Infantry_Rifleman_3",                                      // Rifleman (AT)
    "LOP_TKA_Infantry_MG",                                              // Autorifleman
    "LOP_TKA_Infantry_Marksman",                                        // Marksman
    "LOP_TKA_Infantry_Corpsman",                                        // Medic
    "LOP_TKA_Infantry_Engineer"                                         // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "LOP_TKA_UAZ_DshKM"                                                 // UAZ-3151 (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "LOP_TKA_UAZ_DshKM",                                                // UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  // UAZ-3151 (AGS-30)
    "LOP_TKA_UAZ_SPG",                                                  // UAZ-3151 (SPG-9)
    "LOP_TKA_BMP2",                                                     // BMP-2
    "LOP_TKA_BMP2D",                                                    // BMP-2D
    "LOP_TKA_BTR70",                                                    // BTR-70
    "LOP_TKA_ZSU234",                                                   // ZSU-23-4V
    "LOP_TKA_ZSU234",                                                   // ZSU-23-4V
    "LOP_TKA_T55",                                                      // T-55A
    "LOP_TKA_T72BB",                                                    // T-72B
    "LOP_TKA_T72BB"                                                     // T-72B
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "LOP_TKA_UAZ_DshKM",                                                // UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  // UAZ-3151 (AGS-30)
    "LOP_TKA_BMP1",                                                     // BMP-1
    "LOP_TKA_BMP1D",                                                    // BMP-1D
    "LOP_TKA_BTR60"                                                     // BTR-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "LOP_TKA_UAZ",                                                      // UAZ-3151 (Covered)
    "LOP_TKA_UAZ_DshKM",                                                // UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  // UAZ-3151 (AGS-30)
    "LOP_TKA_UAZ_SPG",                                                  // UAZ-3151 (SPG-9)
    "LOP_TKA_Ural_open",                                                // Ural-4320 Transport
    "LOP_TKA_Ural",                                                     // Ural-4320 Transport (Covered)
    "LOP_TKA_BMP2",                                                     // BMP-2
    "LOP_TKA_BMP2D",                                                    // BMP-2D
    "LOP_TKA_BTR70",                                                    // BTR-70
    "LOP_TKA_ZSU234",                                                   // ZSU-23-4V
    "LOP_TKA_ZSU234",                                                   // ZSU-23-4V
    "LOP_TKA_T55",                                                      // T-55A
    "LOP_TKA_T72BB",                                                    // T-72B
    "LOP_TKA_T72BB",                                                    // T-72B
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23",                                              // Mi-24V (UPK)
    "LOP_TKA_Mi8MT_Cargo"                                               // Mi-8MT (Cargo)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "LOP_TKA_UAZ_Open",                                                 // UAZ-3151
    "LOP_TKA_UAZ_DshKM",                                                // UAZ-3151 (DShKM)
    "LOP_TKA_UAZ_AGS",                                                  // UAZ-3151 (AGS-30)
    "LOP_TKA_Ural_open",                                                // Ural-4320 Transport
    "LOP_TKA_BMP1",                                                     // BMP-1
    "LOP_TKA_BMP1D",                                                    // BMP-1D
    "LOP_TKA_BTR60",                                                    // BTR-60PB
    "LOP_TKA_ZSU234",                                                   // ZSU-23-4V
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23",                                              // Mi-24V (UPK)
    "LOP_TKA_Mi8MT_Cargo"                                               // Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "LOP_TKA_Ural_open",                                                // Ural-4320 Transport
    "LOP_TKA_Ural",                                                     // Ural-4320 Transport (Covered)
    "LOP_TKA_BTR70",                                                    // BTR-70
    "LOP_TKA_BMP1D",                                                    // BMP-1D
    "LOP_TKA_BMP2D",                                                    // BMP-2D
    "LOP_TKA_Mi8MT_Cargo",                                              // Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23"                                               // Mi-24V (UPK)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "LOP_TKA_Mi8MT_Cargo",                                              // Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24P (AT)
    "LOP_TKA_Mi24V_UPK23"                                               // Mi-24V (UPK)
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "RHS_Su25SM_vvsc",                                                  // Su-25
    "RHS_Su25SM_KH29_vvsc"                                              // Su-25 (KH29)
];
