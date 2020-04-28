/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "CUP_B_CDF_Commander_FST";                              // Officer
opfor_squad_leader = "CUP_B_CDF_Officer_FST";                           // Squad Leader
opfor_team_leader = "CUP_B_CDF_Soldier_TL_FST";                         // Team Leader
opfor_sentry = "CUP_B_CDF_Militia_FST";                                 // Rifleman (Lite)
opfor_rifleman = "CUP_B_CDF_Soldier_FST";                               // Rifleman
opfor_rpg = "CUP_B_CDF_Soldier_RPG18_FST";                              // Rifleman (LAT)
opfor_grenadier = "CUP_B_CDF_Soldier_GL_FST";                           // Grenadier
opfor_machinegunner = "CUP_B_CDF_Soldier_AR_FST";                       // Autorifleman
opfor_heavygunner = "CUP_B_CDF_Soldier_MG_FST";                         // Heavy Gunner
opfor_marksman = "CUP_B_CDF_Soldier_Marksman_FST";                      // Marksman
opfor_sharpshooter = "CUP_B_CDF_Soldier_Marksman_FST";                  // Sharpshooter
opfor_sniper = "CUP_B_CDF_Sniper_FST";                                  // Sniper
opfor_at = "CUP_B_CDF_Soldier_LAT_FST";                                 // AT Specialist
opfor_aa = "CUP_B_CDF_Soldier_AA_FST";                                  // AA Specialist
opfor_medic = "CUP_B_CDF_Medic_FST";                                    // Medic
opfor_engineer = "CUP_B_CDF_Engineer_FST";                              // Engineer
opfor_paratrooper = "CUP_B_CDF_Soldier_RPG18_FST";                      // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "CUP_B_UAZ_Unarmed_CDF";                                   // UAZ
opfor_mrap_armed = "CUP_B_UAZ_MG_CDF";                                  // UAZ (DShKM)
opfor_transport_helo = "CUP_B_Mi17_CDF";                                // Mi-8MT
opfor_transport_truck = "CUP_B_Ural_CDF";                               // Ural
opfor_ammobox_transport = "CUP_B_Ural_Open_CDF";                        // Ural (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "CUP_B_Kamaz_Refuel_CDF";                            // Kamaz 5350 (Fuel)
opfor_ammo_truck = "CUP_B_Kamaz_Reammo_CDF";                            // Kamaz 5350 (Ammo)
opfor_fuel_container = "B_Slingload_01_Fuel_F";                         // Huron Fuel Container
opfor_ammo_container = "B_Slingload_01_Ammo_F";                         // Huron Ammo Container
opfor_flag = "FlagCarrierCDF";                                          // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "CUP_B_CDF_Soldier_TL_FST",                                         // Team Leader
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST",                                            // Militia
    "CUP_B_CDF_Militia_FST"                                             // Militia
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "CUP_B_UAZ_MG_CDF",                                                 // UAZ (DShKM)
    "CUP_B_UAZ_AGS30_CDF"                                               // UAZ (AGS-30)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
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
opfor_vehicles_low_intensity = [
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
opfor_battlegroup_vehicles = [
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
opfor_battlegroup_vehicles_low_intensity = [
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
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "CUP_B_BTR60_CDF",                                                  // BTR-60PB
    "CUP_B_MTLB_pk_CDF",                                                // MT-LB LV
    "CUP_B_BMP2_CDF",                                                   // BMP-2
    "CUP_B_BTR80_CDF",                                                  // BTR-80
    "CUP_B_BTR80A_CDF",                                                 // BTR-80A
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi17_CDF"                                                    // Mi-8MT
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "CUP_B_Mi24_D_Dynamic_CDF",                                         // Mi-24D
    "CUP_B_Mi17_CDF"                                                    // Mi-8MT
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "CUP_B_SU34_CDF",                                                   // Su-34
    "CUP_B_Su25_Dyn_CDF"                                                // Su-25 Frogfoot
];
