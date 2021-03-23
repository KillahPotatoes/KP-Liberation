/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "LOP_AM_Infantry_SL";                                 // Officer
opfor_squad_leader = "LOP_ISTS_OPF_Infantry_SL";                     // Squad Leader
opfor_team_leader = "LOP_ISTS_OPF_Infantry_TL";                         // Team Leader
opfor_sentry = "LOP_AM_Infantry_Rifleman_5";                          // Rifleman (Lite)
opfor_rifleman = "LOP_AM_Infantry_Rifleman_4";                        // Rifleman
opfor_rpg = "LOP_ISTS_OPF_Infantry_Rifleman_3";                                          // Rifleman (LAT)
opfor_grenadier = "LOP_AM_Infantry_GL";                                     // Grenadier
opfor_machinegunner = "LOP_AM_Infantry_AR";                                 // Autorifleman
opfor_heavygunner = "LOP_ISTS_OPF_Infantry_AR_2";                                  // Heavy Gunner
opfor_marksman = "LOP_AM_Infantry_Rifleman_7";                                       // Marksman
opfor_sharpshooter = "LOP_AM_Infantry_Marksman";                                // Sharpshooter
opfor_sniper = "LOP_ISTS_OPF_Infantry_Marksman";                                            // Sniper
opfor_at = "LOP_AM_Infantry_AT";                                            // AT Specialist
opfor_aa = "rhsgref_ins_g_specialist_aa";                                            // AA Specialist
opfor_medic = "LOP_AM_Infantry_Corpsman";                                              // Combat Life Saver
opfor_engineer = "LOP_AM_Infantry_Engineer";                                        // Engineer
opfor_paratrooper = "LOP_ISTS_OPF_Infantry_Rifleman_9";                                   // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "LOP_ISTS_OPF_Landrover";                                             // Ifrit
opfor_mrap_armed = "LOP_ISTS_OPF_Landrover_M2";                                   // Ifrit (HMG)
opfor_transport_helo = "LOP_SYR_KAMAZ_Repair";                   // Mi-290 Taru (Bench)
opfor_transport_truck = "LOP_SYR_KAMAZ_Transport";                         // Tempest Transport (Covered)
opfor_ammobox_transport = "LOP_TAK_Civ_Ural";                     // Tempest Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "LOP_SYR_KAMAZ_Fuel";                                 // Tempest Fuel
opfor_ammo_truck = "LOP_SYR_KAMAZ_Ammo";                                 // Tempest Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "lop_Flag_am_opf_F";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "LOP_ISTS_OPF_Infantry_SL",                                                     // Rifleman (Lite)
    "LOP_AM_Infantry_Rifleman_5",                                                     // Rifleman (Lite)
    "LOP_AM_Infantry_Rifleman_4",                                                     // Rifleman
    "LOP_AM_Infantry_Rifleman_4",                                                     // Rifleman
    "LOP_ISTS_OPF_Infantry_Rifleman_3",                                                 // Rifleman (AT)
    "LOP_ISTS_OPF_Infantry_AR_2",                                                  // Autorifleman
    "LOP_AM_Infantry_Rifleman_7",                                                   // Marksman
    "LOP_AM_Infantry_Corpsman",                                               // Medic
    "LOP_AM_Infantry_Engineer"                                                    // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "LOP_ISTS_OPF_Landrover_M2"                                                  // Qilin (armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "LOP_ISTS_OPF_Landrover_SPG9",
    "LOP_ISTS_OPF_Nissan_PKM",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BMP1",
    "LOP_ISTS_OPF_BMP1",
    "LOP_ISTS_OPF_BMP1",
    "LOP_ISTS_OPF_BMP2",
    "LOP_ISTS_OPF_T34",
    "LOP_ISTS_OPF_T34",
    "LOP_ISTS_OPF_T34",
    "LOP_ISTS_OPF_T55",
    "LOP_ISTS_OPF_T55",
    "LOP_ISTS_OPF_T72BA",
    "LOP_ISTS_OPF_ZSU234"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "LOP_ISTS_OPF_Landrover_M2",                                                  // Ifrit (HMG)
    "LOP_ISTS_OPF_Landrover_M2",                                                  // Ifrit (HMG)
    "LOP_ISTS_OPF_Landrover_SPG9",                                                    // Qilin (AT)
    "LOP_ISTS_OPF_BTR60",                                          // MSE-3 Marid
    "LOP_ISTS_OPF_BMP1"                                         // BTR-K Kamysh
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "LOP_ISTS_OPF_Landrover_SPG9",
    "LOP_ISTS_OPF_Nissan_PKM",
    "LOP_TKA_Ural_open",
    "LOP_TKA_Ural",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BTR60",
    "LOP_ISTS_OPF_BMP1",
    "LOP_ISTS_OPF_BMP1",
    "LOP_ISTS_OPF_BMP1",
    "LOP_ISTS_OPF_BMP2",
    "LOP_ISTS_OPF_T34",
    "LOP_ISTS_OPF_T34",
    "LOP_ISTS_OPF_T34",
    "LOP_ISTS_OPF_T55",
    "LOP_ISTS_OPF_T55",
    "LOP_ISTS_OPF_T72BA",
    "LOP_ISTS_OPF_ZSU234"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "LOP_ISTS_OPF_Landrover_M2",                                                  // Ifrit (HMG)
    "LOP_ISTS_OPF_Landrover_M2",                                                  // Ifrit (HMG)
    "LOP_ISTS_OPF_Landrover_SPG9",
    "LOP_TKA_Ural_open",                                            // Qilin (AT)
    "LOP_ISTS_OPF_BTR60",                                          // MSE-3 Marid
    "LOP_ISTS_OPF_BMP1"                                         // BTR-K Kamysh
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "LOP_TKA_Ural",                                           // Tempest Transport
    "LOP_TKA_Ural_open",
    "LOP_ISTS_OPF_BMP1",                
    "LOP_ISTS_OPF_BTR60"                                          // MSE-3 Marid
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [];
