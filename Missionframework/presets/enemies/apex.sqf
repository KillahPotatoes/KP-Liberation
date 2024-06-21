/*
    File: apex.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-07
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CSAT pacific enemy preset.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "O_T_Officer_F";                                      // Officer
KPLIB_o_squadLeader = "O_T_Soldier_SL_F";                               // Squad Leader
KPLIB_o_teamLeader = "O_T_Soldier_TL_F";                                // Team Leader
KPLIB_o_sentry = "O_T_Soldier_F";                                       // Rifleman
KPLIB_o_rifleman = "O_T_Soldier_F";                                     // Rifleman
KPLIB_o_riflemanLAT = "O_T_Soldier_LAT_F";                              // Rifleman (LAT)
KPLIB_o_grenadier = "O_T_Soldier_GL_F";                                 // Grenadier
KPLIB_o_machinegunner = "O_T_Soldier_AR_F";                             // Autorifleman
KPLIB_o_heavyGunner = "O_T_Soldier_AR_F";                               // Autorifleman
KPLIB_o_marksman = "O_T_Soldier_M_F";                                   // Marksman
KPLIB_o_sharpshooter = "O_T_Soldier_M_F";                               // Marksman
KPLIB_o_sniper = "O_T_Sniper_F";                                        // Sniper
KPLIB_o_atSpecialist = "O_T_Soldier_AT_F";                              // AT Specialist
KPLIB_o_aaSpecialist = "O_T_Soldier_AA_F";                              // AA Specialist
KPLIB_o_medic = "O_T_Medic_F";                                          // Combat Life Saver
KPLIB_o_engineer = "O_T_Engineer_F";                                    // Engineer
KPLIB_o_paratrooper = "O_T_Soldier_PG_F";                               // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "O_T_LSV_02_unarmed_F";                                  // Qilin
KPLIB_o_mrapArmed = "O_T_LSV_02_armed_F";                               // Qilin (HMG)
KPLIB_o_transportHeli = "O_Heli_Transport_04_bench_F";                  // Mi-290 Taru (Bench)
KPLIB_o_transportTruck = "O_T_Truck_03_covered_ghex_F";                 // Tempest Transport (Covered)
KPLIB_o_transportTruckAmmo = "O_T_Truck_03_transport_ghex_F";           // Tempest Transport (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "O_T_Truck_03_fuel_ghex_F";                         // Tempest Fuel
KPLIB_o_ammoTruck = "O_T_Truck_03_ammo_ghex_F";                         // Tempest Ammo
KPLIB_o_fuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";            // Taru Fuel Pod
KPLIB_o_ammoContainer = "Land_Pod_Heli_Transport_04_ammo_F";            // Taru Ammo Pod
KPLIB_o_flag = "Flag_CSAT_F";                                           // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "O_soldierU_F",                                                     // Rifleman (Lite)
    "O_soldierU_F",                                                     // Rifleman (Lite)
    "O_soldierU_F",                                                     // Rifleman
    "O_soldierU_F",                                                     // Rifleman
    "O_soldierU_LAT_F",                                                 // Rifleman (AT)
    "O_soldierU_AR_F",                                                  // Autorifleman
    "O_soldierU_M_F",                                                   // Marksman
    "O_soldierU_medic_F",                                               // Medic
    "O_engineer_U_F"                                                    // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "O_T_LSV_02_armed_F"                                                // Qilin (armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
KPLIB_o_armyVehicles = [
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_gmg_ghex_F",                                           // Ifrit (GMG)
    "O_T_LSV_02_AT_F",                                                  // Qilin (AT)
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_MBT_02_cannon_ghex_F",                                         // T-100 Varsuk
    "O_T_MBT_02_cannon_ghex_F",                                         // T-100 Varsuk
    "O_T_MBT_04_cannon_F",                                              // T-140 Angara
    "O_T_MBT_04_command_F"                                              // T-140K Angara
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_LSV_02_AT_F",                                                  // Qilin (AT)
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_T_APC_Tracked_02_cannon_ghex_F"                                  // BTR-K Kamysh
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_gmg_ghex_F",                                           // Ifrit (GMG)
    "O_T_MRAP_02_gmg_ghex_F",                                           // Ifrit (GMG)
    "O_T_LSV_02_AT_F",                                                  // Qilin (AT)
    "O_T_Truck_03_transport_ghex_F",                                    // Tempest Transport
    "O_T_Truck_03_covered_ghex_F",                                      // Tempest Transport (Covered)
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_T_MBT_02_cannon_ghex_F",                                         // T-100 Varsuk
    "O_T_MBT_02_cannon_ghex_F",                                         // T-100 Varsuk
    "O_T_MBT_04_cannon_F",                                              // T-140 Angara
    "O_T_MBT_04_command_F",                                             // T-140K Angara
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "O_T_MRAP_02_ghex_F",                                               // Ifrit
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_Truck_03_transport_ghex_F",                                    // Tempest Transport
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_T_APC_Tracked_02_cannon_ghex_F",                                 // BTR-K Kamysh
    "O_T_APC_Tracked_02_AA_ghex_F",                                     // ZSU-39 Tigris
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F"                                       // Mi-290 Taru (Bench)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "O_T_Truck_03_transport_ghex_F",                                    // Tempest Transport
    "O_T_Truck_03_covered_ghex_F",                                      // Tempest Transport (Covered)
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "O_Plane_CAS_02_dynamicLoadout_F",                                  // To-199 Neophron (CAS)
    "O_Plane_Fighter_02_F"                                              // To-201 Shikra
];

// Enemy SAM turrets that will be spawned in the back country
KPLIB_o_turrets_SAM = [
    ["B_SAM_System_01_F"], 
    ["B_SAM_System_02_F"], 
    ["O_SAM_System_04_F", "O_Radar_System_02_F"]
];