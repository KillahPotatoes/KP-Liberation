/*
    File: cup_takistan.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2019-07-15
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP Takistan Army enemy preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "CUP_O_TK_Officer";                                   // Officer
KPLIB_o_squadLeader = "CUP_O_TK_Soldier_SL";                            // Squad Leader
KPLIB_o_teamLeader = "CUP_O_TK_Soldier_SL";                             // Team Leader
KPLIB_o_sentry = "CUP_O_TK_Soldier";                                    // Rifleman (Lite)
KPLIB_o_rifleman = "CUP_O_TK_Soldier_Backpack";                         // Rifleman
KPLIB_o_riflemanLAT = "CUP_O_TK_Soldier_AT";                            // Rifleman (LAT)
KPLIB_o_grenadier = "CUP_O_TK_Soldier_GL";                              // Grenadier
KPLIB_o_machinegunner = "CUP_O_TK_Soldier_AR";                          // Autorifleman
KPLIB_o_heavyGunner = "CUP_O_TK_Soldier_MG";                            // Heavy Gunner
KPLIB_o_marksman = "CUP_O_TK_Sniper";                                   // Marksman
KPLIB_o_sharpshooter = "CUP_O_TK_Sniper_SVD_Night";                     // Sharpshooter
KPLIB_o_sniper = "CUP_O_TK_Sniper_KSVK";                                // Sniper
KPLIB_o_atSpecialist = "CUP_O_TK_Soldier_HAT";                          // AT Specialist
KPLIB_o_aaSpecialist = "CUP_O_TK_Soldier_AA";                           // AA Specialist
KPLIB_o_medic = "CUP_O_TK_Medic";                                       // Medic
KPLIB_o_engineer = "CUP_O_TK_Engineer";                                 // Engineer
KPLIB_o_paratrooper = "CUP_O_TK_Soldier_AKS_74_GOSHAWK";                // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "CUP_O_LR_Transport_TKA";                                // Land Rover 110 (Transport)
KPLIB_o_mrapArmed = "CUP_O_LR_MG_TKA";                                  // Land Rover 110 (M2)
KPLIB_o_transportHeli = "CUP_O_UH1H_TKA";                               // UH-1H
KPLIB_o_transportTruck = "CUP_O_Ural_TKA";                              // Ural
KPLIB_o_transportTruckAmmo = "CUP_O_Ural_Open_TKA";                     // Ural (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "CUP_O_Ural_Refuel_TKA";                            // Ural (Refuel)
KPLIB_o_ammoTruck = "CUP_O_Ural_Reammo_TKA";                            // Ural (Ammo)
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Container
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Container
KPLIB_o_flag = "FlagCarrierTakistan_EP1";                               // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "CUP_O_TK_INS_Soldier_FNFAL",                                       // Militiaman (FN FAL)
    "CUP_O_TK_INS_Soldier",                                             // Militiaman (AK-74)
    "CUP_O_TK_INS_Soldier_GL",                                          // Militiaman (AK-74 GL)
    "CUP_O_TK_INS_Soldier_TL",                                          // Team Leader
    "CUP_O_TK_INS_Soldier_AT",                                          // Militiaman (RPG-7)
    "CUP_O_TK_INS_Soldier_AR",                                          // Automatic Rifleman
    "CUP_O_TK_INS_Sniper",                                              // Sniper
    "CUP_O_TK_INS_Guerilla_Medic",                                      // Bonesetter
    "CUP_O_TK_INS_Mechanic"                                             // Militia Mechanic
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "CUP_O_LR_MG_TKM",                                                  // Land Rover 110 (M2)
    "CUP_O_LR_MG_TKM",                                                  // Land Rover 110 (M2)
    "CUP_O_Hilux_AGS30_TK_INS",                                         // Hilux (AGS-30)
    "CUP_O_Hilux_DSHKM_TK_INS",                                         // Hilux (DShKM)
    "CUP_O_Hilux_M2_TK_INS",                                            // Hilux (M2)
    "CUP_O_Hilux_SPG9_TK_INS",                                          // Hilux (SPG-9)
    "CUP_O_Hilux_armored_BMP1_TK_INS",                                  // Hilux Armored (BMP-1)
    "CUP_O_Hilux_armored_BTR60_TK_INS",                                 // Hilux Armored (BTR-60)
    "CUP_O_Hilux_armored_zu23_TK_INS",                                  // Hilux Armored (ZU-23-2)
    "CUP_O_BTR40_MG_TKM",                                               // BTR-40 (DSHKM)
    "CUP_O_MTLB_pk_TK_MILITIA"                                          // MT-LB LV
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "CUP_O_UAZ_MG_TKA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AGS30_TKA",                                              // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_TKA",                                               // UAZ (SPG-9)
    "CUP_O_LR_AA_TKA",                                                  // Land Rover 110 (AA)
    "CUP_O_BTR80_TK",                                                   // BTR-80
    "CUP_O_BTR80A_TK",                                                  // BTR-80A
    "CUP_O_BMP1P_TKA",                                                  // BMP-1P
    "CUP_O_BMP2_TKA",                                                   // BMP-2
    "CUP_O_BMP2_TKA",                                                   // BMP-2
    "CUP_O_BMP2_TKA",                                                   // BMP-2
    "CUP_O_ZSU23_Afghan_TK",                                            // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_TK",                                                   // ZSU-23-4
    "CUP_O_BMP2_ZU_TKA",                                                // BMP-2 ZU-23
    "CUP_O_T55_TK",                                                     // T-55
    "CUP_O_T72_TKA",                                                    // T-72
    "CUP_O_T72_TKA"                                                     // T-72
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "CUP_O_UAZ_MG_TKA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_MG_TKA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AGS30_TKA",                                              // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_TKA",                                               // UAZ (SPG-9)
    "CUP_O_MTLB_pk_TKA",                                                // MT-LB LV
    "CUP_O_Ural_ZU23_TKA",                                              // Ural (ZU-23)
    "CUP_O_Ural_ZU23_TKA",                                              // Ural (ZU-23)
    "CUP_O_BTR60_TK",                                                   // BTR-60PB
    "CUP_O_BRDM2_TKA",                                                  // BRDM-2
    "CUP_O_BRDM2_TKA",                                                  // BRDM-2
    "CUP_O_BTR40_MG_TKA",                                               // BTR-40 (DSHKM)
    "CUP_O_BMP1_TKA",                                                   // BMP-1
    "CUP_O_BMP1P_TKA",                                                  // BMP-1P
    "CUP_O_M113_TKA"                                                    // M113A3
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "CUP_O_UAZ_MG_TKA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AGS30_TKA",                                              // UAZ (AGS-30)
    "CUP_O_UAZ_AGS30_TKA",                                              // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_TKA",                                               // UAZ (SPG-9)
    "CUP_O_LR_AA_TKA",                                                  // Land Rover 110 (AA)
    "CUP_O_BTR60_TK",                                                   // BTR-60PB
    "CUP_O_BTR80_TK",                                                   // BTR-80
    "CUP_O_BTR80A_TK",                                                  // BTR-80A
    "CUP_O_BMP1P_TKA",                                                  // BMP-1P
    "CUP_O_BMP2_TKA",                                                   // BMP-2
    "CUP_O_BMP2_TKA",                                                   // BMP-2
    "CUP_O_ZSU23_Afghan_TK",                                            // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_TK",                                                   // ZSU-23-4
    "CUP_O_T55_TK",                                                     // T-55
    "CUP_O_T55_TK",                                                     // T-55
    "CUP_O_T72_TKA",                                                    // T-72
    "CUP_O_T72_TKA",                                                    // T-72
    "CUP_O_Mi17_TK",                                                    // Mi-8MT
    "CUP_O_Mi24_D_Dynamic_TK",                                          // Mi-24D
    "CUP_O_UH1H_armed_TKA",                                             // UH-1H (Armed)
    "CUP_O_UH1H_gunship_SLA_TKA",                                       // UH-1H (Gunship)
    "CUP_O_Mi24_D_Dynamic_TK"                                           // Mi-24D
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "CUP_O_UAZ_MG_TKA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_MG_TKA",                                                 // UAZ (DShKM)
    "CUP_O_MTLB_pk_TKA",                                                // MT-LB LV
    "CUP_O_BTR60_TK",                                                   // BTR-60PB
    "CUP_O_M113_TKA",                                                   // M113A3
    "CUP_O_BTR40_MG_TKA",                                               // BTR-40 (DSHKM)
    "CUP_O_BRDM2_TKA",                                                  // BRDM-2
    "CUP_O_BMP1_TKA",                                                   // BMP-1
    "CUP_O_BMP1P_TKA",                                                  // BMP-1P
    "CUP_O_T34_TKA",                                                    // T-34-85M
    "CUP_O_T34_TKA",                                                    // T-34-85M
    "CUP_O_BMP2_ZU_TKA",                                                // BMP-2 ZU-23
    "CUP_O_Ural_ZU23_TKA",                                              // Ural (ZU-23)
    "CUP_O_UH1H_TKA",                                                   // UH-1H
    "CUP_O_UH1H_gunship_SLA_TKA",                                       // UH-1H (Gunship)
    "CUP_O_UH1H_armed_TKA"                                              // UH-1H (Armed)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.   */
KPLIB_o_troopTransports = [
    "CUP_O_BMP1_TKA",                                                   // BMP-1
    "CUP_O_M113_TKA",                                                   // M113A3
    "CUP_O_MTLB_pk_TKA",                                                // MT-LB LV
    "CUP_O_UH1H_TKA",                                                   // UH-1H
    "CUP_O_UH1H_armed_TKA",                                             // UH-1H (Armed)
    "CUP_O_BTR60_TK",                                                   // BTR-60PB
    "CUP_O_BTR80_TK",                                                   // BTR-80
    "CUP_O_BTR80A_TK",                                                  // BTR-80A
    "CUP_O_Mi24_D_Dynamic_TK",                                          // Mi-24D
    "CUP_O_Mi17_TK",                                                    // Mi-8MT
    "CUP_O_T34_TKA",                                                    // T-34-85M
    "CUP_O_BMP1P_TKA",                                                  // BMP-1P
    "CUP_O_BMP2_TKA"                                                    // BMP-2
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "CUP_O_UH1H_TKA",                                                   // UH-1H
    "CUP_O_UH1H_armed_TKA",                                             // UH-1H (Armed)
    "CUP_O_UH1H_gunship_SLA_TKA",                                       // UH-1H (Gunship)
    "CUP_O_Mi24_D_Dynamic_TK",                                          // Mi-24D
    "CUP_O_Mi17_TK"                                                     // Mi-8MT
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "CUP_O_L39_TK",                                                     // L-39ZA
    "CUP_O_Su25_Dyn_TKA"                                                // Su-25 Frogfoot
];
