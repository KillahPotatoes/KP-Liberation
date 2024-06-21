/*
    File: cup_cdf.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2020-04-06
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP CDF enemy preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "CUP_B_CDF_Commander_FST";                            // Officer
KPLIB_o_squadLeader = "CUP_B_CDF_Officer_FST";                          // Squad Leader
KPLIB_o_teamLeader = "CUP_B_CDF_Soldier_TL_FST";                        // Team Leader
KPLIB_o_sentry = "CUP_B_CDF_Militia_FST";                               // Rifleman (Lite)
KPLIB_o_rifleman = "CUP_B_CDF_Soldier_FST";                             // Rifleman
KPLIB_o_riflemanLAT = "CUP_B_CDF_Soldier_RPG18_FST";                    // Rifleman (LAT)
KPLIB_o_grenadier = "CUP_B_CDF_Soldier_GL_FST";                         // Grenadier
KPLIB_o_machinegunner = "CUP_B_CDF_Soldier_AR_FST";                     // Autorifleman
KPLIB_o_heavyGunner = "CUP_B_CDF_Soldier_MG_FST";                       // Heavy Gunner
KPLIB_o_marksman = "CUP_B_CDF_Soldier_Marksman_FST";                    // Marksman
KPLIB_o_sharpshooter = "CUP_B_CDF_Soldier_Marksman_FST";                // Sharpshooter
KPLIB_o_sniper = "CUP_B_CDF_Sniper_FST";                                // Sniper
KPLIB_o_atSpecialist = "CUP_B_CDF_Soldier_LAT_FST";                     // AT Specialist
KPLIB_o_aaSpecialist = "CUP_B_CDF_Soldier_AA_FST";                      // AA Specialist
KPLIB_o_medic = "CUP_B_CDF_Medic_FST";                                  // Medic
KPLIB_o_engineer = "CUP_B_CDF_Engineer_FST";                            // Engineer
KPLIB_o_paratrooper = "CUP_B_CDF_Soldier_RPG18_FST";                    // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "CUP_B_UAZ_Unarmed_CDF";                                 // UAZ
KPLIB_o_mrapArmed = "CUP_B_UAZ_MG_CDF";                                 // UAZ (DShKM)
KPLIB_o_transportHeli = "CUP_B_Mi17_CDF";                               // Mi-8MT
KPLIB_o_transportTruck = "CUP_B_Ural_CDF";                              // Ural
KPLIB_o_transportTruckAmmo = "CUP_B_Ural_Open_CDF";                     // Ural (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "CUP_B_Kamaz_Refuel_CDF";                           // Kamaz 5350 (Fuel)
KPLIB_o_ammoTruck = "CUP_B_Kamaz_Reammo_CDF";                           // Kamaz 5350 (Ammo)
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Container
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Container
KPLIB_o_flag = "FlagCarrierCDF";                                        // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "CUP_B_CDF_Soldier_TL_FST",                                         // Team Leader
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST"                                             // Militia
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "CUP_B_UAZ_MG_CDF",                                                 // UAZ (DShKM)
    "CUP_B_UAZ_AGS30_CDF"                                               // UAZ (AGS-30)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "CUP_B_UAZ_MG_CDF",                                                 // UAZ (DShKM)
    "CUP_B_UAZ_AA_CDF",                                                 // UAZ (AA)
    "CUP_B_UAZ_AGS30_CDF",                                              // UAZ (AGS-30)
    "CUP_B_UAZ_SPG9_CDF",                                               // UAZ (SPG-9)
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR80_CDF",                                                  // BTR-80
    "CUP_B_BTR80_CDF",                                                  // BTR-80
    "CUP_B_BTR80A_CDF",                                                 // BTR-80A
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_ZSU23_Afghan_CDF",                                           // ZSU-23-4 Afghanski
    "CUP_B_ZSU23_CDF",                                                  // ZSU-23-4
    "CUP_B_T72_CDF",                                                    // T-72
    "CUP_B_T72_CDF"                                                     // T-72
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "CUP_B_UAZ_MG_CDF",                                                 // UAZ (DShKM)
    "CUP_B_UAZ_AGS30_CDF",                                              // UAZ (AGS-30)
    "CUP_B_MTLB_pk_CDF",                                                // MT-LB LV
    "CUP_B_MTLB_pk_CDF",                                                // MT-LB LV
    "CUP_B_BRDM2_CDF",                                                  // BRDM-2
    "CUP_B_BRDM2_CDF",                                                  // BRDM-2
    "CUP_B_Ural_ZU23_CDF",                                              // Ural (ZU-23)
    "CUP_B_BTR60_CDF"                                                   // BTR-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "CUP_B_UAZ_MG_CDF",                                                 // UAZ (DShKM)
    "CUP_B_UAZ_AA_CDF",                                                 // UAZ (AA)
    "CUP_B_UAZ_AGS30_CDF",                                              // UAZ (AGS-30)
    "CUP_B_UAZ_SPG9_CDF",                                               // UAZ (SPG-9)
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR80_CDF",                                                  // BTR-80
    "CUP_B_BTR80_CDF",                                                  // BTR-80
    "CUP_B_BTR80A_CDF",                                                 // BTR-80A
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_ZSU23_Afghan_CDF",                                           // ZSU-23-4 Afghanski
    "CUP_B_ZSU23_CDF",                                                  // ZSU-23-4
    "CUP_B_T72_CDF",                                                    // T-72
    "CUP_B_T72_CDF",                                                    // T-72
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi17_CDF"                                                    // Mi-8MT
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "CUP_B_UAZ_MG_CDF",                                                 // UAZ (DShKM)
    "CUP_B_UAZ_AGS30_CDF",                                              // UAZ (AGS-30)
    "CUP_B_MTLB_pk_CDF",                                                // MT-LB LV
    "CUP_B_MTLB_pk_CDF",                                                // MT-LB LV
    "CUP_B_Ural_ZU23_CDF",                                              // Ural (ZU-23)
    "CUP_B_Ural_ZU23_CDF",                                              // Ural (ZU-23)
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_Mi17_CDF"                                                    // Mi-8MT
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_MTLB_pk_CDF",                                                // MT-LB LV
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_BTR80_CDF",                                                  // BTR-80
    "CUP_B_BTR80A_CDF",                                                 // BTR-80A
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi17_CDF"                                                    // Mi-8MT
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi17_CDF"                                                    // Mi-8MT
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "CUP_B_SU34_CDF",                                                   // Su-34
    "CUP_B_Su25_Dyn_CDF"                                                // Su-25 Frogfoot
];
