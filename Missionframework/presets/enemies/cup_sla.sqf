/*
    File: cup_sla.sqf
    Author: Eogos - https://github.com/Eogos
    Date: 2019-07-15
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        CUP SLA enemy preset.

    Needed Mods:
        - CUP Units
        - CUP Vehicles
        - CUP Weapons

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "CUP_O_sla_Officer";                                  // Officer
KPLIB_o_squadLeader = "CUP_O_sla_Soldier_SL";                           // Squad Leader
KPLIB_o_teamLeader = "CUP_O_sla_Soldier_SL";                            // Team Leader
KPLIB_o_sentry = "CUP_O_sla_Soldier";                                   // Rifleman (Lite)
KPLIB_o_rifleman = "CUP_O_SLA_Soldier_Backpack";                        // Rifleman
KPLIB_o_riflemanLAT = "CUP_O_sla_Soldier_AT";                           // Rifleman (LAT)
KPLIB_o_grenadier = "CUP_O_sla_Soldier_GL";                             // Grenadier
KPLIB_o_machinegunner = "CUP_O_sla_Soldier_AR";                         // Autorifleman
KPLIB_o_heavyGunner = "CUP_O_sla_Soldier_MG";                           // Heavy Gunner
KPLIB_o_marksman = "CUP_O_sla_Sniper";                                  // Marksman
KPLIB_o_sharpshooter = "CUP_O_SLA_Sniper_SVD_Night";                    // Sharpshooter
KPLIB_o_sniper = "CUP_O_sla_Sniper_KSVK";                               // Sniper
KPLIB_o_atSpecialist = "CUP_O_sla_Soldier_HAT";                         // AT Specialist
KPLIB_o_aaSpecialist = "CUP_O_sla_Soldier_AA";                          // AA Specialist
KPLIB_o_medic = "CUP_O_sla_Medic";                                      // Medic
KPLIB_o_engineer = "CUP_O_sla_Engineer";                                // Engineer
KPLIB_o_paratrooper = "CUP_O_sla_Soldier_LAT";                          // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "CUP_O_UAZ_Unarmed_SLA";                                 // UAZ
KPLIB_o_mrapArmed = "CUP_O_UAZ_MG_SLA";                                 // UAZ (DShKM)
KPLIB_o_transportHeli = "CUP_O_Mi8_SLA_1";                              // Mi-8MT
KPLIB_o_transportTruck = "CUP_O_Ural_SLA";                              // Ural
KPLIB_o_transportTruckAmmo = "CUP_O_Ural_Open_SLA";                     // Ural (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "CUP_O_Ural_Refuel_SLA";                            // Ural (Refuel)
KPLIB_o_ammoTruck = "CUP_O_Ural_Reammo_SLA";                            // Ural (Ammo)
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Container
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Container
KPLIB_o_flag = "FlagCarrierNorth";                                      // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "CUP_O_sla_Soldier_militia",                                        // Militiaman
    "CUP_O_sla_Soldier_militia",                                        // Militiaman
    "CUP_O_sla_Soldier_LAT_militia",                                    // Militiaman (RPG-18)
    "CUP_O_sla_Soldier_AA_militia",                                     // AA Specialist
    "CUP_O_sla_Soldier_AT_militia",                                     // Militiaman (RPG-7)
    "CUP_O_sla_Soldier_AR_militia",                                     // Militia Automatic Rifleman
    "CUP_O_sla_Soldier_GL_militia",                                     // Militia Grenadier
    "CUP_O_sla_Medic_militia",                                          // Militia Medic
    "CUP_O_sla_Engineer_militia"                                        // Militia Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "CUP_O_UAZ_MG_SLA"                                                  // UAZ (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "CUP_O_UAZ_MG_SLA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AA_SLA",                                                 // UAZ (AA)
    "CUP_O_UAZ_AGS30_SLA",                                              // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_SLA",                                               // UAZ (SPG-9)
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR80_SLA",                                                  // BTR-80
    "CUP_O_BTR80A_SLA",                                                 // BTR-80A
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_ZSU23_SLA",                                                  // ZSU-23-4
    "CUP_O_ZSU23_Afghan_SLA",                                           // ZSU-23-4 Afghanski
    "CUP_O_T55_SLA",                                                    // T-55
    "CUP_O_T55_SLA",                                                    // T-55
    "CUP_O_T72_SLA",                                                    // T-72
    "CUP_O_T72_SLA"                                                     // T-72
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "CUP_O_UAZ_MG_SLA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AA_SLA",                                                 // UAZ (AA)
    "CUP_O_UAZ_SPG9_SLA",                                               // UAZ (SPG-9)
    "CUP_O_Ural_ZU23_SLA",                                              // Ural (ZU-23)
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_MTLB_pk_SLA"                                                 // MT-LB LV
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "CUP_O_UAZ_MG_SLA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AA_SLA",                                                 // UAZ (AA)
    "CUP_O_UAZ_AGS30_SLA",                                              // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_SLA",                                               // UAZ (SPG-9)
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR80_SLA",                                                  // BTR-80
    "CUP_O_BTR80A_SLA",                                                 // BTR-80A
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_ZSU23_SLA",                                                  // ZSU-23-4
    "CUP_O_ZSU23_Afghan_SLA",                                           // ZSU-23-4 Afghanski
    "CUP_O_T55_SLA",                                                    // T-55
    "CUP_O_T55_SLA",                                                    // T-55
    "CUP_O_T72_SLA",                                                    // T-72
    "CUP_O_T72_SLA",                                                    // T-72
    "CUP_O_Ka50_DL_SLA",                                                // Ka-50 Black Shark
    "CUP_O_Mi24_D_Dynamic_SLA",                                         // Mi-24D
    "CUP_O_Mi8_SLA_2",                                                  // Mi-8MTV3
    "CUP_O_UH1H_gunship_SLA",                                           // UH-1H (Gunship)
    "CUP_O_UH1H_gunship_SLA"                                            // UH-1H (Gunship)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "CUP_O_UAZ_MG_SLA",                                                 // UAZ (DShKM)
    "CUP_O_UAZ_AA_SLA",                                                 // UAZ (AA)
    "CUP_O_UAZ_SPG9_SLA",                                               // UAZ (SPG-9)
    "CUP_O_Ural_ZU23_SLA",                                              // Ural (ZU-23)
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_MTLB_pk_SLA",                                                // MT-LB LV
    "CUP_O_Mi8_SLA_1",                                                  // Mi-8MT
    "CUP_O_UH1H_gunship_SLA",                                           // UH-1H (Gunship)
    "CUP_O_UH1H_armed_SLA",                                             // UH-1H (Armed)
    "CUP_O_UH1H_SLA"                                                    // UH-1H
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "CUP_O_BMP2_SLA",                                                   // BMP-2
    "CUP_O_Mi24_D_Dynamic_SLA",                                         // Mi-24D
    "CUP_O_Mi8_SLA_2",                                                  // Mi-8MTV3
    "CUP_O_BTR60_SLA",                                                  // BTR-60PB
    "CUP_O_BTR80_SLA",                                                  // BTR-80
    "CUP_O_BTR80A_SLA",                                                 // BTR-80A
    "CUP_O_MTLB_pk_SLA",                                                // MT-LB LV
    "CUP_O_Mi8_SLA_1",                                                  // Mi-8MT
    "CUP_O_UH1H_armed_SLA",                                             // UH-1H (Armed)
    "CUP_O_UH1H_SLA"                                                    // UH-1H
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "CUP_O_Ka50_DL_SLA",                                                // Ka-50 Black Shark
    "CUP_O_Mi24_D_Dynamic_SLA",                                         // Mi-24D
    "CUP_O_UH1H_gunship_SLA",                                           // UH-1H (Gunship)
    "CUP_O_UH1H_armed_SLA",                                             // UH-1H (Armed)
    "CUP_O_UH1H_SLA",                                                   // UH-1H
    "CUP_O_Mi8_SLA_1",                                                  // Mi-8MT
    "CUP_O_Mi8_SLA_2"                                                   // Mi-8MTV3
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "CUP_O_Su25_Dyn_SLA",                                               // Su-25 Frogfoot
    "CUP_O_SU34_SLA"                                                    // Su-34
];
