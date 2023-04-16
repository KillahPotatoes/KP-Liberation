/*
    File: custom.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-07
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Custom (default CSAT) enemy preset.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "O_officer_F";                                        // Officer
KPLIB_o_squadLeader = "O_Soldier_SL_F";                                 // Squad Leader
KPLIB_o_teamLeader = "O_Soldier_TL_F";                                  // Team Leader
KPLIB_o_sentry = "O_Soldier_lite_F";                                    // Rifleman (Lite)
KPLIB_o_rifleman = "O_Soldier_F";                                       // Rifleman
KPLIB_o_riflemanLAT = "O_Soldier_LAT_F";                                // Rifleman (LAT)
KPLIB_o_grenadier = "O_Soldier_GL_F";                                   // Grenadier
KPLIB_o_machinegunner = "O_Soldier_AR_F";                               // Autorifleman
KPLIB_o_heavyGunner = "O_HeavyGunner_F";                                // Heavy Gunner
KPLIB_o_marksman = "O_soldier_M_F";                                     // Marksman
KPLIB_o_sharpshooter = "O_Sharpshooter_F";                              // Sharpshooter
KPLIB_o_sniper = "O_sniper_F";                                          // Sniper
KPLIB_o_atSpecialist = "O_Soldier_AT_F";                                // AT Specialist
KPLIB_o_aaSpecialist = "O_Soldier_AA_F";                                // AA Specialist
KPLIB_o_medic = "O_medic_F";                                            // Combat Life Saver
KPLIB_o_engineer = "O_engineer_F";                                      // Engineer
KPLIB_o_paratrooper = "O_soldier_PG_F";                                 // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "O_MRAP_02_F";                                           // Ifrit
KPLIB_o_mrapArmed = "O_MRAP_02_hmg_F";                                  // Ifrit (HMG)
KPLIB_o_transportHeli = "O_Heli_Transport_04_bench_F";                  // Mi-290 Taru (Bench)
KPLIB_o_transportTruck = "O_Truck_03_covered_F";                        // Tempest Transport (Covered)
KPLIB_o_transportTruckAmmo = "O_Truck_03_transport_F";                  // Tempest Transport (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "O_Truck_03_fuel_F";                                // Tempest Fuel
KPLIB_o_ammoTruck = "O_Truck_03_ammo_F";                                // Tempest Ammo
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
    "O_LSV_02_armed_F"                                                  // Qilin (armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "O_MRAP_02_hmg_F",                                                  // Ifrit (HMG)
    "O_MRAP_02_hmg_F",                                                  // Ifrit (GMG)
    "O_MRAP_02_gmg_F",                                                  // Ifrit (GMG)
    "O_LSV_02_AT_F",                                                    // Qilin (AT)
    "O_APC_Tracked_02_cannon_F",                                        // BTR-K Kamysh
    "O_APC_Tracked_02_cannon_F",                                        // BTR-K Kamysh
    "O_APC_Tracked_02_AA_F",                                            // ZSU-39 Tigris
    "O_APC_Tracked_02_AA_F",                                            // ZSU-39 Tigris
    "O_MBT_02_cannon_F",                                                // T-100 Varsuk
    "O_MBT_02_cannon_F",                                                // T-100 Varsuk
    "O_MBT_04_cannon_F",                                                // T-140 Angara
    "O_MBT_04_command_F"                                                // T-140K Angara
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "O_MRAP_02_hmg_F",                                                  // Ifrit (HMG)
    "O_MRAP_02_hmg_F",                                                  // Ifrit (HMG)
    "O_LSV_02_AT_F",                                                    // Qilin (AT)
    "O_APC_Wheeled_02_rcws_F",                                          // MSE-3 Marid
    "O_APC_Tracked_02_cannon_F"                                         // BTR-K Kamysh
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "O_MRAP_02_hmg_F",                                                  // Ifrit (HMG)
    "O_MRAP_02_gmg_F",                                                  // Ifrit (GMG)
    "O_MRAP_02_gmg_F",                                                  // Ifrit (GMG)
    "O_LSV_02_AT_F",                                                    // Qilin (AT)
    "O_Truck_03_transport_F",                                           // Tempest Transport
    "O_Truck_03_covered_F",                                             // Tempest Transport (Covered)
    "O_APC_Tracked_02_cannon_F",                                        // BTR-K Kamysh
    "O_APC_Tracked_02_cannon_F",                                        // BTR-K Kamysh
    "O_APC_Tracked_02_AA_F",                                            // ZSU-39 Tigris
    "O_APC_Tracked_02_AA_F",                                            // ZSU-39 Tigris
    "O_MBT_02_cannon_F",                                                // T-100 Varsuk
    "O_MBT_02_cannon_F",                                                // T-100 Varsuk
    "O_MBT_04_cannon_F",                                                // T-140 Angara
    "O_MBT_04_command_F",                                               // T-140K Angara
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Attack_02_dynamicLoadout_F"                                 // Mi-48 Kajman
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "O_MRAP_02_hmg_F",                                                  // Ifrit (HMG)
    "O_MRAP_02_hmg_F",                                                  // Ifrit (HMG)
    "O_Truck_03_transport_F",                                           // Tempest Transport
    "O_APC_Wheeled_02_rcws_F",                                          // MSE-3 Marid
    "O_APC_Tracked_02_cannon_F",                                        // BTR-K Kamysh
    "O_APC_Tracked_02_AA_F",                                            // ZSU-39 Tigris
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Transport_04_bench_F"                                       // Mi-290 Taru (Bench)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "O_Truck_03_transport_F",                                           // Tempest Transport
    "O_Truck_03_covered_F",                                             // Tempest Transport (Covered)
    "O_APC_Wheeled_02_rcws_F",                                          // MSE-3 Marid
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F"                                  // Po-30 Orca (Armed)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Attack_02_dynamicLoadout_F"                                 // Mi-48 Kajman
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "O_Plane_CAS_02_dynamicLoadout_F",                                  // To-199 Neophron (CAS)
    "O_Plane_Fighter_02_F"                                              // To-201 Shikra
];

// Enemy defence turrets that will be spawned in sectors.
KPLIB_o_turrets_HMG = [
    "O_HMG_01_F",
    "O_HMG_01_high_F"
];

// Enemy defence turrets that will be spawned in sectors.
KPLIB_o_turrets_GMG = [
    "O_GMG_01_F",
    "O_GMG_01_high_F"
];

// Enemy defence turrets that will be spawned in sectors.
KPLIB_o_turrets_AT = [
    "O_static_AT_F"
];

// Enemy defence turrets that will be spawned in sectors.
KPLIB_o_turrets_AA = [
    "O_static_AA_F"
];

// Enemy defence turrets that will be spawned in sectors.
KPLIB_o_turrets_MORTAR = [
    "O_Mortar_01_F"
];

// Enemy SAM turrets that will be spawned in the back country
KPLIB_o_turrets_SAM = [
    ["B_SAM_System_01_F"], 
    ["B_SAM_System_02_F"], 
    ["O_SAM_System_04_F", "O_Radar_System_02_F"]
];