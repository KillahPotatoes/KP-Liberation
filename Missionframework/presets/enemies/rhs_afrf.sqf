/*
    File: rhs_afrf.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-07
    Last Update: 2020-06-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Armed Forces of the Russian Federation enemy preset.

    Needed Mods:
        - RHS AFRF

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "rhs_msv_emr_officer";                                // Officer
KPLIB_o_squadLeader = "rhs_msv_emr_sergeant";                           // Squad Leader
KPLIB_o_teamLeader = "rhs_msv_emr_efreitor";                            // Team Leader
KPLIB_o_sentry = "rhs_msv_emr_rifleman";                                // Rifleman (Lite)
KPLIB_o_rifleman = "rhs_msv_emr_rifleman";                              // Rifleman
KPLIB_o_riflemanLAT = "rhs_msv_emr_LAT";                                // Rifleman (LAT)
KPLIB_o_grenadier = "rhs_msv_emr_grenadier";                            // Grenadier
KPLIB_o_machinegunner = "rhs_msv_emr_arifleman";                        // Autorifleman
KPLIB_o_heavyGunner = "rhs_msv_emr_machinegunner";                      // Heavy Gunner
KPLIB_o_marksman = "rhs_msv_emr_marksman";                              // Marksman
KPLIB_o_sharpshooter = "rhs_msv_emr_marksman";                          // Sharpshooter
KPLIB_o_sniper = "rhs_msv_emr_marksman";                                // Sniper
KPLIB_o_atSpecialist = "rhs_msv_emr_at";                                // AT Specialist
KPLIB_o_aaSpecialist = "rhs_msv_emr_aa";                                // AA Specialist
KPLIB_o_medic = "rhs_msv_emr_medic";                                    // Combat Life Saver
KPLIB_o_engineer = "rhs_msv_emr_engineer";                              // Engineer
KPLIB_o_paratrooper = "rhs_msv_emr_RShG2";                              // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "rhs_tigr_msv";                                          // GAZ-233011
KPLIB_o_mrapArmed = "rhs_tigr_sts_msv";                                 // GAZ-233014 (Armed)
KPLIB_o_transportHeli = "RHS_Mi8mt_Cargo_vvsc";                         // Mi-8MT (Cargo)
KPLIB_o_transportTruck = "RHS_Ural_MSV_01";                             // Ural-4320 Transport (Covered)
KPLIB_o_transportTruckAmmo = "RHS_Ural_Open_MSV_01";                    // Ural-4320 Transport (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "RHS_Ural_Fuel_MSV_01";                             // Ural-4320 Fuel
KPLIB_o_ammoTruck = "rhs_gaz66_ammo_msv";                               // GAZ-66 Ammo
KPLIB_o_fuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";            // Taru Fuel Pod
KPLIB_o_ammoContainer = "Land_Pod_Heli_Transport_04_ammo_F";            // Taru Ammo Pod
KPLIB_o_flag = "rhs_Flag_Russia_F";                                     // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "rhs_msv_emr_rifleman",                                             // Rifleman
    "rhs_msv_emr_rifleman",                                             // Rifleman
    "rhs_msv_emr_rifleman",                                             // Rifleman
    "rhs_msv_emr_LAT",                                                  // Rifleman (AT)
    "rhs_msv_emr_arifleman",                                            // Autorifleman
    "rhs_msv_emr_marksman",                                             // Marksman
    "rhs_msv_emr_medic",                                                // Medic
    "rhs_msv_emr_engineer"                                              // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
KPLIB_o_militiaVehicles = [
    "rhs_tigr_sts_msv"                                                  // GAZ-233014 (Armed)
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_armyVehicles = [
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_bmp2d_msv",                                                    // BMP-2D
    "rhs_bmp2k_msv",                                                    // BMP-2K
    "rhs_brm1k_msv",                                                    // BRM-1K
    "rhs_zsu234_aa",                                                    // ZSU-23-4V
    "rhs_zsu234_aa",                                                    // ZSU-23-4V
    "rhs_t80",                                                          // T80
    "rhs_t80",                                                          // T80
    "rhs_t90a_tv",                                                      // T90A
    "rhs_t90sab_tv"                                                     // T90SA (2016)
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_btr80_msv",                                                    // BTR-80
    "rhs_btr80a_msv"                                                    // BTR-80A
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "RHS_Ural_Open_MSV_01",                                             // Ural-4320 Transport
    "RHS_Ural_MSV_01",                                                  // Ural-4320 Transport (Covered)
    "rhs_bmp2d_msv",                                                    // BMP-2D
    "rhs_bmp2k_msv",                                                    // BMP-2K
    "rhs_brm1k_msv",                                                    // BRM-1K
    "rhs_zsu234_aa",                                                    // ZSU-23-4V
    "rhs_zsu234_aa",                                                    // ZSU-23-4V
    "rhs_t80",                                                          // T80
    "rhs_t80",                                                          // T80
    "rhs_t90a_tv",                                                      // T90A
    "RHS_Mi24P_AT_vvsc",                                                // Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc",                                                // Mi-24V (AT)
    "RHS_Mi8mt_Cargo_vvsc",                                             // Mi-8MT (Cargo)
    "RHS_Ka52_vvsc"                                                     // Ka-52
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "rhs_tigr_msv",                                                     // GAZ-233011
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "rhs_tigr_sts_msv",                                                 // GAZ-233014 (Armed)
    "RHS_Ural_Open_MSV_01",                                             // Ural-4320 Transport
    "rhs_btr80_msv",                                                    // BTR-80
    "rhs_btr80a_msv",                                                   // BTR-80A
    "rhs_zsu234_aa",                                                    // ZSU-23-4V
    "RHS_Mi24P_AT_vvsc",                                                // Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc",                                                // Mi-24V (AT)
    "RHS_Mi8mt_Cargo_vvsc"                                              // Mi-8MT (Cargo)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "RHS_Ural_Open_MSV_01",                                             // Ural-4320 Transport
    "RHS_Ural_MSV_01",                                                  // Ural-4320 Transport (Covered)
    "rhs_btr80_msv",                                                    // BTR-80
    "rhs_btr80a_msv",                                                   // BTR-80A
    "rhs_bmp2d_msv",                                                    // BMP-2D
    "RHS_Mi8mt_Cargo_vvsc",                                             // Mi-8MT (Cargo)
    "RHS_Mi24P_AT_vvsc",                                                // Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc"                                                 // Mi-24V (AT)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "RHS_Mi8mt_Cargo_vvsc",                                             // Mi-8MT (Cargo)
    "RHS_Mi24P_AT_vvsc",                                                // Mi-24P (AT)
    "RHS_Mi24V_AT_vvsc",                                                // Mi-24V (AT)
    "RHS_Ka52_vvsc"                                                     // Ka-52
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "RHS_Su25SM_vvsc",                                                  // Su-25
    "RHS_Su25SM_KH29_vvsc"                                              // Su-25 (KH29)
];
