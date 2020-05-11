/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "CUP_B_BAF_Soldier_Officer_DPM";                        // Officer
opfor_squad_leader = "CUP_B_BAF_Soldier_SquadLeader_DPM";               // Squad Leader
opfor_team_leader = "CUP_B_BAF_Soldier_TeamLeader_DPM";                 // Team Leader
opfor_sentry = "CUP_B_BAF_Soldier_RiflemanLite_DPM";                    // Rifleman (Lite)
opfor_rifleman = "CUP_B_BAF_Soldier_Rifleman_DPM";                      // Rifleman
opfor_rpg = "CUP_B_BAF_Soldier_RiflemanLAT_DPM";                        // Rifleman (LAT)
opfor_grenadier = "CUP_B_BAF_Soldier_Grenadier_DPM";                    // Grenadier
opfor_machinegunner = "CUP_B_BAF_Soldier_AutoRifleman_DPM";             // Autorifleman
opfor_heavygunner = "CUP_B_BAF_Soldier_HeavyGunner_DPM";                // Heavy Gunner
opfor_marksman = "CUP_B_BAF_Soldier_Marksman_DPM";                      // Marksman
opfor_sharpshooter = "CUP_B_BAF_Soldier_SharpShooter_DPM";              // Sharpshooter
opfor_sniper = "CUP_B_BAF_Sniper_AS50_DPM";                             // Sniper
opfor_at = "CUP_B_BAF_Soldier_AT_DPM";                                  // AT Specialist
opfor_aa = "CUP_B_BAF_Soldier_AA_DPM";                                  // AA Specialist
opfor_medic = "CUP_B_BAF_Soldier_Medic_DPM";                            // Medic
opfor_engineer = "CUP_B_BAF_Soldier_Engineer_DPM";                      // Engineer
opfor_paratrooper = "CUP_B_BAF_Soldier_Paratrooper_DPM";                // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "CUP_B_Ridgeback_LMG_GB_W";                                // Ridgeback PPV LMG Woodland
opfor_mrap_armed = "CUP_B_Ridgeback_HMG_GB_W";                          // Ridgeback PPV HMG Woodland
opfor_transport_helo = "CUP_B_CH47F_GB";                                // Chinook HC-4
opfor_transport_truck = "CUP_B_MTVR_BAF_WOOD";                          // MTVR
opfor_ammobox_transport = "CUP_B_MTVR_BAF_WOOD";                        // MTVR -> Has to be able to transport resource crates!
opfor_fuel_truck = "CUP_B_MTVR_Refuel_BAF_WOOD";                        // MTVR (Refuel)
opfor_ammo_truck = "CUP_B_MTVR_Ammo_BAF_WOOD";                          // MTVR (Ammo)
opfor_fuel_container = "B_Slingload_01_Fuel_F";                         // Huron Fuel Container
opfor_ammo_container = "B_Slingload_01_Ammo_F";                         // Huron Ammo Container
opfor_flag = "Flag_UK_F";                                               // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "CUP_B_BAF_Soldier_TeamLeader_MTP",                                 // Team Leader
    "CUP_B_BAF_Soldier_Medic_MTP",                                      // Combat Life Saver
    "CUP_B_BAF_Soldier_RiflemanLAT_MTP",                                // Rifleman (Light AT)
    "CUP_B_BAF_Soldier_RiflemanLite_MTP",                               // Rifleman (Light)
    "CUP_B_BAF_Soldier_RiflemanLite_MTP",                               // Rifleman (Light)
    "CUP_B_BAF_Soldier_RiflemanLite_MTP"                                // Rifleman (Light)
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "CUP_B_LR_MG_GB_W"                                                  // Land Rover 110 (M2) Woodland
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "CUP_B_LR_Special_M2_GB_W",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_W",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_BAF_Coyote_L2A1_W",                                          // Coyote L2A1 (Woodland)
    "CUP_B_BAF_Coyote_GMG_W",                                           // Coyote GMG (Woodland)
    "CUP_B_Wolfhound_LMG_GB_W",                                         // Wolfhound TSV LMG Woodland
    "CUP_B_Wolfhound_HMG_GB_W",                                         // Wolfhound TSV HMG Woodland
    "CUP_B_Wolfhound_GMG_GB_W",                                         // Wolfhound TSV GMG Woodland
    "CUP_B_Mastiff_LMG_GB_W",                                           // Mastiff PPV LMG Woodland
    "CUP_B_Mastiff_HMG_GB_W",                                           // Mastiff PPV HMG Woodland
    "CUP_B_Mastiff_GMG_GB_W",                                           // Mastiff PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_W_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_FV432_Bulldog_GB_W_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_MCV80_GB_W",                                                 // MCV-80 Warrior (Woodland)
    "CUP_B_MCV80_GB_W_SLAT",                                            // MCV-80 Warrior (SLAT - Woodland)
    "CUP_B_FV510_GB_W",                                                 // FV510 Warrior (Woodland)
    "CUP_B_FV510_GB_W_SLAT",                                            // FV510 Warrior (SLAT - Woodland)
    "CUP_B_Challenger2_2CW_BAF",                                        // FV4034 Challenger 2 (Two Color Woodland)
    "CUP_B_Challenger2_Woodland_BAF"                                    // FV4034 Challenger 2 (Woodland)
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "CUP_B_LR_Special_M2_GB_W",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_W",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_Jackal2_L2A1_GB_W",                                          // Jackal 2 L2A1 Woodland
    "CUP_B_Jackal2_GMG_GB_W",                                           // Jackal 2 GMG Woodland
    "CUP_B_Ridgeback_LMG_GB_W",                                         // Ridgeback PPV LMG Woodland
    "CUP_B_Ridgeback_HMG_GB_W",                                         // Ridgeback PPV HMG Woodland
    "CUP_B_Ridgeback_GMG_GB_W",                                         // Ridgeback PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_W",                                         // FV432 Bulldog L7A2 [Woodland]
    "CUP_B_FV432_Bulldog_GB_W"                                          // FV432 Bulldog L7A2 [Woodland]
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "CUP_B_LR_Special_M2_GB_W",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_W",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_BAF_Coyote_L2A1_W",                                          // Coyote L2A1 (Woodland)
    "CUP_B_BAF_Coyote_GMG_W",                                           // Coyote GMG (Woodland)
    "CUP_B_Wolfhound_LMG_GB_W",                                         // Wolfhound TSV LMG Woodland
    "CUP_B_Wolfhound_HMG_GB_W",                                         // Wolfhound TSV HMG Woodland
    "CUP_B_Wolfhound_GMG_GB_W",                                         // Wolfhound TSV GMG Woodland
    "CUP_B_Mastiff_LMG_GB_W",                                           // Mastiff PPV LMG Woodland
    "CUP_B_Mastiff_HMG_GB_W",                                           // Mastiff PPV HMG Woodland
    "CUP_B_Mastiff_GMG_GB_W",                                           // Mastiff PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_W_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_FV432_Bulldog_GB_W_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_MCV80_GB_W",                                                 // MCV-80 Warrior (Woodland)
    "CUP_B_MCV80_GB_W_SLAT",                                            // MCV-80 Warrior (SLAT - Woodland)
    "CUP_B_FV510_GB_W",                                                 // FV510 Warrior (Woodland)
    "CUP_B_FV510_GB_W_SLAT",                                            // FV510 Warrior (SLAT - Woodland)
    "CUP_B_Challenger2_2CW_BAF",                                        // FV4034 Challenger 2 (Two Color Woodland)
    "CUP_B_Challenger2_Woodland_BAF",                                   // FV4034 Challenger 2 (Woodland)
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "CUP_B_LR_Special_M2_GB_W",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_W",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_Jackal2_L2A1_GB_W",                                          // Jackal 2 L2A1 Woodland
    "CUP_B_Jackal2_GMG_GB_W",                                           // Jackal 2 GMG Woodland
    "CUP_B_Ridgeback_LMG_GB_W",                                         // Ridgeback PPV LMG Woodland
    "CUP_B_Ridgeback_HMG_GB_W",                                         // Ridgeback PPV HMG Woodland
    "CUP_B_Ridgeback_GMG_GB_W",                                         // Ridgeback PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_W",                                         // FV432 Bulldog L7A2 [Woodland]
    "CUP_B_FV432_Bulldog_GB_W",                                         // FV432 Bulldog L7A2 [Woodland]
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "CUP_B_BAF_Coyote_L2A1_W",                                          // Coyote L2A1 (Woodland)
    "CUP_B_BAF_Coyote_GMG_W",                                           // Coyote GMG (Woodland)
    "CUP_B_Mastiff_LMG_GB_W",                                           // Mastiff PPV LMG Woodland
    "CUP_B_Mastiff_HMG_GB_W",                                           // Mastiff PPV HMG Woodland
    "CUP_B_Mastiff_GMG_GB_W",                                           // Mastiff PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_W_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_Jackal2_L2A1_GB_W",                                          // Jackal 2 L2A1 Woodland
    "CUP_B_Jackal2_GMG_GB_W",                                           // Jackal 2 GMG Woodland
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "CUP_B_F35B_BAF",                                                   // F-35B Lightning II
    "CUP_B_F35B_Stealth_BAF",                                           // F-35B Lightning II (Stealth)
    "CUP_B_GR9_DYN_GB"                                                  // Harrier GR.9
];
