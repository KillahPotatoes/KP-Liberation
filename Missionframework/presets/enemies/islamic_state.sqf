/*
    File: islamic_state.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-09
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Islamic State enemy preset.

    Needed Mods:
        - Project OPFOR
        - RHS AFRF
        - RHS GREF
        - RHS USAF

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "LOP_ISTS_OPF_Infantry_SL";                           // Officer (Warlord)
KPLIB_o_squadLeader = "LOP_ISTS_OPF_Infantry_SL";                       // Squad Leader (Warlord)
KPLIB_o_teamLeader = "LOP_ISTS_OPF_Infantry_TL";                        // Team Leader (Chief)
KPLIB_o_sentry = "LOP_ISTS_OPF_Infantry_Rifleman";                      // Rifleman (AKM)
KPLIB_o_rifleman = "LOP_ISTS_OPF_Infantry_Rifleman_5";                  // Rifleman (AK-74)
KPLIB_o_riflemanLAT = "LOP_ISTS_OPF_Infantry_AT";                       // Rifleman (RPG-7)
KPLIB_o_grenadier = "LOP_ISTS_OPF_Infantry_GL";                         // Grenadier (AKM GP-25)
KPLIB_o_machinegunner = "LOP_ISTS_OPF_Infantry_AR_Asst";                // Autorifleman (AR_Asst)
KPLIB_o_heavyGunner = "LOP_ISTS_OPF_Infantry_AR";                       // Heavy Gunner (PKM)
KPLIB_o_marksman = "LOP_ISTS_OPF_Infantry_Rifleman_2";                  // Marksman (Lee Enfield)
KPLIB_o_sharpshooter = "LOP_ISTS_OPF_Infantry_Marksman";                // Sharpshooter (SVD)
KPLIB_o_sniper = "LOP_ISTS_OPF_Infantry_Marksman";                      // Sniper (SVD)
KPLIB_o_atSpecialist = "LOP_ISTS_OPF_Infantry_AT";                      // AT Specialist (RPG-7)
KPLIB_o_aaSpecialist = "LOP_ISTS_OPF_Infantry_AT";                      // AA Specialist (RPG-7)
KPLIB_o_medic = "LOP_ISTS_OPF_Infantry_Corpsman";                       // Combat Life Saver (Bonesetter)
KPLIB_o_engineer = "LOP_ISTS_OPF_Infantry_Engineer";                    // Engineer (Bomber)
KPLIB_o_paratrooper = "LOP_ISTS_OPF_Infantry_Rifleman_6";               // Paratrooper (AKM PM-63)

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "LOP_ISTS_OPF_Offroad";                                  // Offroad
KPLIB_o_mrapArmed = "LOP_ISTS_OPF_Offroad_M2";                          // Offroad (M2)
KPLIB_o_transportHeli = "LOP_TKA_Mi8MT_Cargo";                          // Mi-8MT (Cargo)
KPLIB_o_transportTruck = "LOP_TKA_Ural";                                // Ural-4320 (Covered)
KPLIB_o_transportTruckAmmo = "LOP_TKA_Ural_open";                       // Ural-4320 (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "RHS_Ural_Fuel_MSV_01";                             // Ural-4320 (Fuel)
KPLIB_o_ammoTruck = "rhs_gaz66_ammo_msv";                               // GAZ-66 (Ammo)
KPLIB_o_fuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";            // Taru Fuel Pod
KPLIB_o_ammoContainer = "Land_Pod_Heli_Transport_04_ammo_F";            // Taru Ammo Pod
KPLIB_o_flag = "lop_Flag_tak_F";                                        // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "LOP_AM_OPF_Infantry_Rifleman",                                     // Rifleman (AKM)
    "LOP_AM_OPF_Infantry_Rifleman",                                     // Rifleman (AKM)
    "LOP_AM_OPF_Infantry_Rifleman_5",                                   // Rifleman (AKM-74)
    "LOP_AM_OPF_Infantry_Rifleman_5",                                   // Rifleman (AKM-74)
    "LOP_AM_OPF_Infantry_AT",                                           // Rifleman (RPG-7)
    "LOP_AM_OPF_Infantry_AR",                                           // Autorifleman (PKM)
    "LOP_AM_OPF_Infantry_Rifleman_3",                                   // Marksman (Lee Enfield)
    "LOP_AM_OPF_Infantry_Corpsman",                                     // Medic (Bonesetter)
    "LOP_AM_OPF_Infantry_Engineer"                                      // Engineer (Bomber)
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "LOP_AM_OPF_UAZ_DshKM"                                              // UAZ-3151 (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "LOP_ISTS_OPF_Landrover_M2",                                        // Land Rover (M2)
    "LOP_ISTS_OPF_Landrover_SPG9",                                      // Land Rover (SPG)
    "LOP_ISTS_OPF_M1025_W_M2",                                          // M10252 (M2)
    "LOP_ISTS_OPF_M1025_W_Mk19",                                        // M1025A2 (Mk19)
    "LOP_ISTS_OPF_Offroad_M2",                                          // Offroad (M2)
    "LOP_ISTS_OPF_BMP2",                                                // BMP-2
    "LOP_ISTS_OPF_BTR60",                                               // BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 // T-34-85M
    "LOP_ISTS_OPF_T55",                                                 // T55A
    "LOP_ISTS_OPF_T55",                                                 // T55A
    "LOP_ISTS_OPF_T72BA",                                               // T72B
    "LOP_ISTS_OPF_T72BA",                                               // T72B
    "LOP_ISTS_OPF_ZSU234",                                              // ZSU-23-4V
    "LOP_ISTS_OPF_ZSU234"                                               // ZSU-23-4V
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "LOP_ISTS_OPF_Landrover_M2",                                        // Land Rover (M2)
    "LOP_ISTS_OPF_Nissan_PKM",                                          // Nissan (PKM)
    "LOP_ISTS_OPF_Nissan_PKM",                                          // Nissan (PKM)
    "LOP_ISTS_OPF_Nissan_PKM",                                          // Nissan (PKM)
    "LOP_ISTS_OPF_BMP1",                                                // BMP-1
    "LOP_ISTS_OPF_BMP1",                                                // BMP-1
    "LOP_ISTS_OPF_BMP2",                                                // BMP-2
    "LOP_ISTS_OPF_BTR60"                                                // BTR-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "LOP_ISTS_OPF_Landrover_M2",                                        // Land Rover (M2)
    "LOP_ISTS_OPF_Landrover_SPG9",                                      // Land Rover (SPG)
    "LOP_ISTS_OPF_M1025_W_M2",                                          // M10252 (M2)
    "LOP_ISTS_OPF_M1025_W_Mk19",                                        // M1025A2 (Mk19)
    "LOP_ISTS_OPF_Offroad_M2",                                          // Offroad (M2)
    "LOP_ISTS_OPF_Truck",                                               // Truck (Cargo)
    "LOP_ISTS_OPF_Truck",                                               // Truck (Cargo)
    "LOP_ISTS_OPF_BMP2",                                                // BMP-2
    "LOP_ISTS_OPF_BTR60",                                               // BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 // T-34-85M
    "LOP_ISTS_OPF_T55",                                                 // T55A
    "LOP_ISTS_OPF_T55",                                                 // T55A
    "LOP_ISTS_OPF_T72BA",                                               // T72B
    "LOP_ISTS_OPF_T72BA",                                               // T72B
    "LOP_ISTS_OPF_ZSU234",                                              // ZSU-23-4V
    "LOP_ISTS_OPF_ZSU234",                                              // ZSU-23-4V
    "LOP_TKA_Mi8MT_Cargo",                                              // Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24V (AT)
    "LOP_TKA_Mi24V_FAB",                                                // Mi-24V (FAB)
    "LOP_TKA_Mi24V_UPK23"                                               // Mi-24V (UPK)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "LOP_ISTS_OPF_Landrover_M2",                                        // Land Rover (M2)
    "LOP_ISTS_OPF_Nissan_PKM",                                          // Nissan (PKM)
    "LOP_ISTS_OPF_Nissan_PKM",                                          // Nissan (PKM)
    "LOP_ISTS_OPF_Nissan_PKM",                                          // Nissan (PKM)
    "LOP_ISTS_OPF_Truck",                                               // Truck (Cargo)
    "LOP_ISTS_OPF_Truck",                                               // Truck (Cargo)
    "LOP_ISTS_OPF_BMP1",                                                // BMP-1
    "LOP_ISTS_OPF_BMP1",                                                // BMP-1
    "LOP_ISTS_OPF_BMP2",                                                // BMP-2
    "LOP_ISTS_OPF_BTR60",                                               // BTR-60PB
    "LOP_ISTS_OPF_T34",                                                 // T-34-85M
    "LOP_ISTS_OPF_ZSU234",                                              // ZSU-23-4V
    "LOP_TKA_Mi8MT_Cargo",                                              // Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24V (AT)
    "LOP_TKA_Mi24V_FAB",                                                // Mi-24V (FAB)
    "LOP_TKA_Mi24V_UPK23"                                               // Mi-24V (UPK)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "LOP_ISTS_OPF_Truck",                                               // Truck (Cargo)
    "LOP_ISTS_OPF_BMP1",                                                // BMP-1
    "LOP_ISTS_OPF_BMP2",                                                // BMP-2
    "LOP_ISTS_OPF_BTR60",                                               // BTR-60PB
    "LOP_TKA_Mi8MT_Cargo"                                               // Mi-8MT (Cargo)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "LOP_TKA_Mi8MT_Cargo",                                              // Mi-8MT (Cargo)
    "LOP_TKA_Mi24V_AT",                                                 // Mi-24V (AT)
    "LOP_TKA_Mi24V_FAB",                                                // Mi-24V (FAB)
    "LOP_TKA_Mi24V_UPK23"                                               // Mi-24V (UPK)
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "RHS_Su25SM_vvsc",                                                  // Su-25
    "RHS_Su25SM_KH29_vvsc"                                              // Su-25 (KH29)
];
