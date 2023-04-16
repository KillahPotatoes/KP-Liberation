/*
    File: cup_bad_desert.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2020-04-16
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP BAF Desert enemy preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "CUP_B_BAF_Soldier_Officer_DDPM";                     // Officer
KPLIB_o_squadLeader = "CUP_B_BAF_Soldier_SquadLeader_DDPM";             // Squad Leader
KPLIB_o_teamLeader = "CUP_B_BAF_Soldier_TeamLeader_DDPM";               // Team Leader
KPLIB_o_sentry = "CUP_B_BAF_Soldier_RiflemanLite_DDPM";                 // Rifleman (Lite)
KPLIB_o_rifleman = "CUP_B_BAF_Soldier_Rifleman_DDPM";                   // Rifleman
KPLIB_o_riflemanLAT = "CUP_B_BAF_Soldier_RiflemanLAT_DDPM";             // Rifleman (LAT)
KPLIB_o_grenadier = "CUP_B_BAF_Soldier_Grenadier_DDPM";                 // Grenadier
KPLIB_o_machinegunner = "CUP_B_BAF_Soldier_AutoRifleman_DDPM";          // Autorifleman
KPLIB_o_heavyGunner = "CUP_B_BAF_Soldier_HeavyGunner_DDPM";             // Heavy Gunner
KPLIB_o_marksman = "CUP_B_BAF_Soldier_Marksman_DDPM";                   // Marksman
KPLIB_o_sharpshooter = "CUP_B_BAF_Soldier_SharpShooter_DDPM";           // Sharpshooter
KPLIB_o_sniper = "CUP_B_BAF_Sniper_AS50_DDPM";                          // Sniper
KPLIB_o_atSpecialist = "CUP_B_BAF_Soldier_AT_DDPM";                     // AT Specialist
KPLIB_o_aaSpecialist = "CUP_B_BAF_Soldier_AA_DDPM";                     // AA Specialist
KPLIB_o_medic = "CUP_B_BAF_Soldier_Medic_DDPM";                         // Medic
KPLIB_o_engineer = "CUP_B_BAF_Soldier_Engineer_DDPM";                   // Engineer
KPLIB_o_paratrooper = "CUP_B_BAF_Soldier_Paratrooper_DDPM";             // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "CUP_B_Ridgeback_LMG_GB_D";                              // Ridgeback PPV LMG Woodland
KPLIB_o_mrapArmed = "CUP_B_Ridgeback_HMG_GB_D";                         // Ridgeback PPV HMG Woodland
KPLIB_o_transportHeli = "CUP_B_CH47F_GB";                               // Chinook HC-4
KPLIB_o_transportTruck = "CUP_B_MTVR_BAF_DES";                          // MTVR
KPLIB_o_transportTruckAmmo = "CUP_B_MTVR_BAF_DES";                      // MTVR -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "CUP_B_MTVR_Refuel_BAF_DES";                        // MTVR (Refuel)
KPLIB_o_ammoTruck = "CUP_B_MTVR_Ammo_BAF_DES";                          // MTVR (Ammo)
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Container
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Container
KPLIB_o_flag = "Flag_UK_F";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "CUP_B_BAF_Soldier_TeamLeader_MTP",                                 // Team Leader
    "CUP_B_BAF_Soldier_Medic_MTP",                                      // Combat Life Saver
    "CUP_B_BAF_Soldier_RiflemanLAT_MTP",                                // Rifleman (Light AT)
    "CUP_B_BAF_Soldier_RiflemanLite_MTP",                               // Rifleman (Light)
    "CUP_B_BAF_Soldier_RiflemanLite_MTP",                               // Rifleman (Light)
    "CUP_B_BAF_Soldier_RiflemanLite_MTP"                                // Rifleman (Light)
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "CUP_B_LR_MG_GB_D"                                                  // Land Rover 110 (M2) Woodland
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "CUP_B_LR_Special_M2_GB_D",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_D",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_BAF_Coyote_L2A1_D",                                          // Coyote L2A1 (Woodland)
    "CUP_B_BAF_Coyote_GMG_D",                                           // Coyote GMG (Woodland)
    "CUP_B_Wolfhound_LMG_GB_D",                                         // Wolfhound TSV LMG Woodland
    "CUP_B_Wolfhound_HMG_GB_D",                                         // Wolfhound TSV HMG Woodland
    "CUP_B_Wolfhound_GMG_GB_D",                                         // Wolfhound TSV GMG Woodland
    "CUP_B_Mastiff_LMG_GB_D",                                           // Mastiff PPV LMG Woodland
    "CUP_B_Mastiff_HMG_GB_D",                                           // Mastiff PPV HMG Woodland
    "CUP_B_Mastiff_GMG_GB_D",                                           // Mastiff PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_D_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_FV432_Bulldog_GB_D_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_MCV80_GB_D",                                                 // MCV-80 Warrior (Woodland)
    "CUP_B_MCV80_GB_D_SLAT",                                            // MCV-80 Warrior (SLAT - Woodland)
    "CUP_B_FV510_GB_D",                                                 // FV510 Warrior (Woodland)
    "CUP_B_FV510_GB_D_SLAT",                                            // FV510 Warrior (SLAT - Woodland)
    "CUP_B_Challenger2_2CD_BAF",                                        // FV4034 Challenger 2 (Two Color Woodland)
    "CUP_B_Challenger2_Desert_BAF"                                      // FV4034 Challenger 2 (Woodland)
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "CUP_B_LR_Special_M2_GB_D",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_D",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_Jackal2_L2A1_GB_D",                                          // Jackal 2 L2A1 Woodland
    "CUP_B_Jackal2_GMG_GB_D",                                           // Jackal 2 GMG Woodland
    "CUP_B_Ridgeback_LMG_GB_D",                                         // Ridgeback PPV LMG Woodland
    "CUP_B_Ridgeback_HMG_GB_D",                                         // Ridgeback PPV HMG Woodland
    "CUP_B_Ridgeback_GMG_GB_D",                                         // Ridgeback PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_D",                                         // FV432 Bulldog L7A2 [Woodland]
    "CUP_B_FV432_Bulldog_GB_D"                                          // FV432 Bulldog L7A2 [Woodland]
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "CUP_B_LR_Special_M2_GB_D",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_D",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_BAF_Coyote_L2A1_D",                                          // Coyote L2A1 (Woodland)
    "CUP_B_BAF_Coyote_GMG_D",                                           // Coyote GMG (Woodland)
    "CUP_B_Wolfhound_LMG_GB_D",                                         // Wolfhound TSV LMG Woodland
    "CUP_B_Wolfhound_HMG_GB_D",                                         // Wolfhound TSV HMG Woodland
    "CUP_B_Wolfhound_GMG_GB_D",                                         // Wolfhound TSV GMG Woodland
    "CUP_B_Mastiff_LMG_GB_D",                                           // Mastiff PPV LMG Woodland
    "CUP_B_Mastiff_HMG_GB_D",                                           // Mastiff PPV HMG Woodland
    "CUP_B_Mastiff_GMG_GB_D",                                           // Mastiff PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_D_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_FV432_Bulldog_GB_D_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_MCV80_GB_D",                                                 // MCV-80 Warrior (Woodland)
    "CUP_B_MCV80_GB_D_SLAT",                                            // MCV-80 Warrior (SLAT - Woodland)
    "CUP_B_FV510_GB_D",                                                 // FV510 Warrior (Woodland)
    "CUP_B_FV510_GB_D_SLAT",                                            // FV510 Warrior (SLAT - Woodland)
    "CUP_B_Challenger2_2CD_BAF",                                        // FV4034 Challenger 2 (Two Color Woodland)
    "CUP_B_Challenger2_Desert_BAF",                                     // FV4034 Challenger 2 (Woodland)
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "CUP_B_LR_Special_M2_GB_D",                                         // Land Rover 110 (M2 Special) Woodland
    "CUP_B_LR_Special_GMG_GB_D",                                        // Land Rover 110 (GMG Special) Woodland
    "CUP_B_Jackal2_L2A1_GB_D",                                          // Jackal 2 L2A1 Woodland
    "CUP_B_Jackal2_GMG_GB_D",                                           // Jackal 2 GMG Woodland
    "CUP_B_Ridgeback_LMG_GB_D",                                         // Ridgeback PPV LMG Woodland
    "CUP_B_Ridgeback_HMG_GB_D",                                         // Ridgeback PPV HMG Woodland
    "CUP_B_Ridgeback_GMG_GB_D",                                         // Ridgeback PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_D",                                         // FV432 Bulldog L7A2 [Woodland]
    "CUP_B_FV432_Bulldog_GB_D",                                         // FV432 Bulldog L7A2 [Woodland]
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "CUP_B_BAF_Coyote_L2A1_D",                                          // Coyote L2A1 (Woodland)
    "CUP_B_BAF_Coyote_GMG_D",                                           // Coyote GMG (Woodland)
    "CUP_B_Mastiff_LMG_GB_D",                                           // Mastiff PPV LMG Woodland
    "CUP_B_Mastiff_HMG_GB_D",                                           // Mastiff PPV HMG Woodland
    "CUP_B_Mastiff_GMG_GB_D",                                           // Mastiff PPV GMG Woodland
    "CUP_B_FV432_Bulldog_GB_D_RWS",                                     // FV432 Bulldog L111A1 RWS [Woodland]
    "CUP_B_Jackal2_L2A1_GB_D",                                          // Jackal 2 L2A1 Woodland
    "CUP_B_Jackal2_GMG_GB_D",                                           // Jackal 2 GMG Woodland
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "CUP_B_AH1_DL_BAF",                                                 // AH1
    "CUP_B_AW159_GB",                                                   // AW159 Wildcat (Green)
    "CUP_B_CH47F_GB",                                                   // Chinook HC-4
    "CUP_B_Merlin_HC3A_Armed_GB"                                        // Merlin HC3A (Armed)
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "CUP_B_F35B_BAF",                                                   // F-35B Lightning II
    "CUP_B_F35B_Stealth_BAF",                                           // F-35B Lightning II (Stealth)
    "CUP_B_GR9_DYN_GB"                                                  // Harrier GR.9
];
