/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "O_T_Officer_F";                                        // Officer
opfor_squad_leader = "O_T_Soldier_SL_F";                                // Squad Leader
opfor_team_leader = "O_T_Soldier_TL_F";                                 // Team Leader
opfor_sentry = "O_T_Soldier_F";                                         // Rifleman
opfor_rifleman = "O_T_Soldier_F";                                       // Rifleman
opfor_rpg = "O_T_Soldier_LAT_F";                                        // Rifleman (LAT)
opfor_grenadier = "O_T_Soldier_GL_F";                                   // Grenadier
opfor_machinegunner = "O_T_Soldier_AR_F";                               // Autorifleman
opfor_heavygunner = "O_T_Soldier_AR_F";                                 // Autorifleman
opfor_marksman = "O_T_Soldier_M_F";                                     // Marksman
opfor_sharpshooter = "O_T_Soldier_M_F";                                 // Marksman
opfor_sniper = "O_T_Sniper_F";                                          // Sniper
opfor_at = "O_T_Soldier_AT_F";                                          // AT Specialist
opfor_aa = "O_T_Soldier_AA_F";                                          // AA Specialist
opfor_medic = "O_T_Medic_F";                                            // Combat Life Saver
opfor_engineer = "O_T_Engineer_F";                                      // Engineer
opfor_paratrooper = "O_T_Soldier_PG_F";                                 // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "O_T_LSV_02_unarmed_F";                                    // Qilin
opfor_mrap_armed = "O_T_LSV_02_armed_F";                                // Qilin (HMG)
opfor_transport_helo = "O_Heli_Transport_04_bench_F";                   // Mi-290 Taru (Bench)
opfor_transport_truck = "O_T_Truck_03_covered_ghex_F";                  // Tempest Transport (Covered)
opfor_ammobox_transport = "O_T_Truck_03_transport_ghex_F";              // Tempest Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "O_T_Truck_03_fuel_ghex_F";                          // Tempest Fuel
opfor_ammo_truck = "O_T_Truck_03_ammo_ghex_F";                          // Tempest Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "Flag_CSAT_F";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
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
militia_vehicles = [
    "O_T_LSV_02_armed_F"                                                // Qilin (armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
opfor_vehicles = [
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
opfor_vehicles_low_intensity = [
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_MRAP_02_hmg_ghex_F",                                           // Ifrit (HMG)
    "O_T_LSV_02_AT_F",                                                  // Qilin (AT)
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_T_APC_Tracked_02_cannon_ghex_F"                                  // BTR-K Kamysh
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
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
opfor_battlegroup_vehicles_low_intensity = [
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
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "O_T_Truck_03_transport_ghex_F",                                    // Tempest Transport
    "O_T_Truck_03_covered_ghex_F",                                      // Tempest Transport (Covered)
    "O_T_APC_Wheeled_02_rcws_ghex_F",                                   // MSE-3 Marid
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "O_Heli_Transport_04_bench_F",                                      // Mi-290 Taru (Bench)
    "O_Heli_Light_02_dynamicLoadout_F",                                 // Po-30 Orca (Armed)
    "O_Heli_Attack_02_dynamicLoadout_F",                                // Mi-48 Kajman
    "O_T_VTOL_02_infantry_dynamicLoadout_F"                             // Y-32 Xi'an (Infantry)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "O_Plane_CAS_02_dynamicLoadout_F",                                  // To-199 Neophron (CAS)
    "O_Plane_Fighter_02_F"                                              // To-201 Shikra
];
