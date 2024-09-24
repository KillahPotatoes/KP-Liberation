/*
    File: cup_afrf_msv.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2019-07-20
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP AFRF MSV enemy preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "CUP_O_RU_Officer_EMR";                               // Officer
KPLIB_o_squadLeader = "CUP_O_RU_Soldier_SL_EMR";                        // Squad Leader
KPLIB_o_teamLeader = "CUP_O_RU_Soldier_TL_EMR";                         // Team Leader
KPLIB_o_sentry = "CUP_O_RU_Soldier_Saiga_EMR";                          // Rifleman (Lite)
KPLIB_o_rifleman = "CUP_O_RU_Soldier_EMR";                              // Rifleman
KPLIB_o_riflemanLAT = "CUP_O_RU_Soldier_AT_EMR";                        // Rifleman (LAT)
KPLIB_o_grenadier = "CUP_O_RU_Soldier_GL_EMR";                          // Grenadier
KPLIB_o_machinegunner = "CUP_O_RU_Soldier_AR_EMR";                      // Autorifleman
KPLIB_o_heavyGunner = "CUP_O_RU_Soldier_MG_EMR";                        // Heavy Gunner
KPLIB_o_marksman = "CUP_O_RU_Soldier_Marksman_EMR";                     // Marksman
KPLIB_o_sharpshooter = "CUP_O_RU_Sniper_EMR";                           // Sharpshooter
KPLIB_o_sniper = "CUP_O_RU_Sniper_KSVK_EMR";                            // Sniper
KPLIB_o_atSpecialist = "CUP_O_RU_Soldier_HAT_EMR";                      // AT Specialist
KPLIB_o_aaSpecialist = "CUP_O_RU_Soldier_AA_EMR";                       // AA Specialist
KPLIB_o_medic = "CUP_O_RU_Medic_EMR";                                   // Medic
KPLIB_o_engineer = "CUP_O_RU_Engineer_EMR";                             // Engineer
KPLIB_o_paratrooper = "CUP_O_RU_Soldier_LAT_EMR";                       // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "CUP_O_UAZ_Unarmed_RU";                                  // UAZ
KPLIB_o_mrapArmed = "CUP_O_UAZ_MG_RU";                                  // UAZ (DShKM)
KPLIB_o_transportHeli = "CUP_O_Mi8_RU";                                 // Mi-8MTV3
KPLIB_o_transportTruck = "CUP_O_Kamaz_RU";                              // Kamaz 5350
KPLIB_o_transportTruckAmmo = "CUP_O_Kamaz_Open_RU";                     // Kamaz 5350 (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "CUP_O_Kamaz_Refuel_RU";                            // Kamaz 5350 (Fuel)
KPLIB_o_ammoTruck = "CUP_O_Kamaz_Reammo_RU";                            // Kamaz 5350 (Ammo)
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Container
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Container
KPLIB_o_flag = "FlagCarrierRU";                                         // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "CUP_O_RU_Soldier_Saiga",                                           // Rifleman (Saiga)
    "CUP_O_RU_Soldier_Saiga",                                           // Rifleman (Saiga)
    "CUP_O_RU_Soldier",                                                 // Rifleman
    "CUP_O_RU_Soldier",                                                 // Rifleman
    "CUP_O_RU_Soldier_AT",                                              // Rifleman (RPG-7)
    "CUP_O_RU_Soldier_AR",                                              // Automatic Rifleman
    "CUP_O_RU_Soldier_Marksman",                                        // Marksman (SVD)
    "CUP_O_RU_Medic",                                                   // Medic
    "CUP_O_RU_Engineer"                                                 // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "CUP_O_UAZ_MG_RU"                                                   // UAZ (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "CUP_O_GAZ_Vodnik_PK_RU",                                           // GAZ Vodnik (2x PKM)
    "CUP_O_GAZ_Vodnik_AGS_RU",                                          // GAZ Vodnik (AGS-30/PKM)
    "CUP_O_GAZ_Vodnik_BPPU_RU",                                         // GAZ Vodnik (BPPU)
    "CUP_O_GAZ_Vodnik_BPPU_RU",                                         // GAZ Vodnik (BPPU)
    "CUP_O_BTR80_CAMO_RU",                                              // BTR-80 (Camo)
    "CUP_O_BTR80_GREEN_RU",                                             // BTR-80 (Green)
    "CUP_O_BTR80A_CAMO_RU",                                             // BTR-80A (Camo)
    "CUP_O_BTR80A_CAMO_RU",                                             // BTR-80A (Green)
    "CUP_O_BTR90_RU",                                                   // BTR-90
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BMP3_RU",                                                    // BMP-3
    "CUP_O_2S6_RU",                                                     // 2S6 Tunguska
    "CUP_O_2S6_RU",                                                     // 2S6 Tunguska
    "CUP_O_T72_RU",                                                     // T-72
    "CUP_O_T72_RU",                                                     // T-72
    "CUP_O_T72_RU",                                                     // T-72
    "CUP_O_T90_RU",                                                     // T-90A
    "CUP_O_T90_RU",                                                     // T-90A
    "CUP_O_T90_RU"                                                      // T-90A
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "CUP_O_UAZ_MG_RU",                                                  // UAZ (DShKM)
    "CUP_O_UAZ_AGS30_RU",                                               // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_RU",                                                // UAZ (SPG-9)
    "CUP_O_MTLB_pk_WDL_RU",                                             // MT-LB LV (Camo)
    "CUP_O_BRDM2_RU",                                                   // BRDM-2
    "CUP_O_Ural_ZU23_RU",                                               // Ural (ZU-23)
    "CUP_O_BTR60_RU",                                                   // BTR-60PB (Camo)
    "CUP_O_BTR60_RU",                                                   // BTR-60PB (Camo)
    "CUP_O_BMP2_RU"                                                     // BMP-2
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "CUP_O_GAZ_Vodnik_PK_RU",                                           // GAZ Vodnik (2x PKM)
    "CUP_O_GAZ_Vodnik_AGS_RU",                                          // GAZ Vodnik (AGS-30/PKM)
    "CUP_O_GAZ_Vodnik_BPPU_RU",                                         // GAZ Vodnik (BPPU)
    "CUP_O_GAZ_Vodnik_BPPU_RU",                                         // GAZ Vodnik (BPPU)
    "CUP_O_BTR80_CAMO_RU",                                              // BTR-80 (Camo)
    "CUP_O_BTR80_GREEN_RU",                                             // BTR-80 (Green)
    "CUP_O_BTR80A_CAMO_RU",                                             // BTR-80A (Camo)
    "CUP_O_BTR80A_CAMO_RU",                                             // BTR-80A (Green)
    "CUP_O_BTR90_RU",                                                   // BTR-90
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BMP3_RU",                                                    // BMP-3
    "CUP_O_2S6_RU",                                                     // 2S6 Tunguska
    "CUP_O_2S6_RU",                                                     // 2S6 Tunguska
    "CUP_O_T72_RU",                                                     // T-72
    "CUP_O_T72_RU",                                                     // T-72
    "CUP_O_T72_RU",                                                     // T-72
    "CUP_O_T90_RU",                                                     // T-90A
    "CUP_O_T90_RU",                                                     // T-90A
    "CUP_O_T90_RU",                                                     // T-90A
    "CUP_O_Mi24_V_Dynamic_RU",                                          // Mi-24V
    "CUP_O_Mi24_P_Dynamic_RU",                                          // Mi-24P
    "CUP_O_Mi8_RU",                                                     // Mi-8MTV3
    "CUP_O_Ka52_RU",                                                    // Ka-52
    "CUP_O_Ka50_DL_RU"                                                  // Ka-50 Black Shark
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "CUP_O_UAZ_MG_RU",                                                  // UAZ (DShKM)
    "CUP_O_UAZ_AGS30_RU",                                               // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_RU",                                                // UAZ (SPG-9)
    "CUP_O_MTLB_pk_WDL_RU",                                             // MT-LB LV (Camo)
    "CUP_O_BRDM2_RU",                                                   // BRDM-2
    "CUP_O_Ural_ZU23_RU",                                               // Ural (ZU-23)
    "CUP_O_BTR60_RU",                                                   // BTR-60PB (Camo)
    "CUP_O_BTR60_RU",                                                   // BTR-60PB (Camo)
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_Ka60_Grey_RU",                                               // Ka-60 Kasatka Grey (Rockets)
    "CUP_O_Mi8_RU"                                                      // Mi-8MTV3
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
KPLIB_o_troopTransports = [
    "CUP_O_Ka60_Grey_RU",                                               // Ka-60 Kasatka Grey (Rockets)
    "CUP_O_Mi8_RU",                                                     // Mi-8MTV3
    "CUP_O_Mi24_V_Dynamic_RU",                                          // Mi-24V
    "CUP_O_Mi24_P_Dynamic_RU",                                          // Mi-24P
    "CUP_O_BMP2_RU",                                                    // BMP-2
    "CUP_O_BTR60_RU",                                                   // BTR-60PB (Camo)
    "CUP_O_BTR80_CAMO_RU",                                              // BTR-80 (Camo)
    "CUP_O_BTR80_GREEN_RU",                                             // BTR-80 (Green)
    "CUP_O_BTR80A_CAMO_RU",                                             // BTR-80A (Camo)
    "CUP_O_BTR80A_CAMO_RU",                                             // BTR-80A (Green)
    "CUP_O_BTR90_RU",                                                   // BTR-90
    "CUP_O_GAZ_Vodnik_PK_RU",                                           // GAZ Vodnik (2x PKM)
    "CUP_O_GAZ_Vodnik_AGS_RU",                                          // GAZ Vodnik (AGS-30/PKM)
    "CUP_O_MTLB_pk_WDL_RU"                                              // MT-LB LV (Camo)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "CUP_O_Mi24_V_Dynamic_RU",                                          // Mi-24V
    "CUP_O_Mi24_P_Dynamic_RU",                                          // Mi-24P
    "CUP_O_Mi8_RU",                                                     // Mi-8MTV3
    "CUP_O_Ka60_Grey_RU",                                               // Ka-60 Kasatka Grey (Rockets)
    "CUP_O_Ka52_RU",                                                    // Ka-52
    "CUP_O_Ka50_DL_RU"                                                  // Ka-50 Black Shark
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "CUP_O_Su25_Dyn_RU",                                                // Su-25T Frogfoot
    "CUP_O_SU34_RU"                                                     // Su-34
];
