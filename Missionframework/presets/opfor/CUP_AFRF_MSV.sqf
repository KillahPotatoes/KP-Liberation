/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "CUP_O_RU_Officer_EMR";                                 // Officer
opfor_squad_leader = "CUP_O_RU_Soldier_SL_EMR";                         // Squad Leader
opfor_team_leader = "CUP_O_RU_Soldier_TL_EMR";                          // Team Leader
opfor_sentry = "CUP_O_RU_Soldier_Saiga_EMR";                            // Rifleman (Lite)
opfor_rifleman = "CUP_O_RU_Soldier_EMR";                                // Rifleman
opfor_rpg = "CUP_O_RU_Soldier_AT_EMR";                                  // Rifleman (LAT)
opfor_grenadier = "CUP_O_RU_Soldier_GL_EMR";                            // Grenadier
opfor_machinegunner = "CUP_O_RU_Soldier_AR_EMR";                        // Autorifleman
opfor_heavygunner = "CUP_O_RU_Soldier_MG_EMR";                          // Heavy Gunner
opfor_marksman = "CUP_O_RU_Soldier_Marksman_EMR";                       // Marksman
opfor_sharpshooter = "CUP_O_RU_Sniper_EMR";                             // Sharpshooter
opfor_sniper = "CUP_O_RU_Sniper_KSVK_EMR";                              // Sniper
opfor_at = "CUP_O_RU_Soldier_HAT_EMR";                                  // AT Specialist
opfor_aa = "CUP_O_RU_Soldier_AA_EMR";                                   // AA Specialist
opfor_medic = "CUP_O_RU_Medic_EMR";                                     // Medic
opfor_engineer = "CUP_O_RU_Engineer_EMR";                               // Engineer
opfor_paratrooper = "CUP_O_RU_Soldier_LAT_EMR";                         // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "CUP_O_UAZ_Unarmed_RU";                                    // UAZ
opfor_mrap_armed = "CUP_O_UAZ_MG_RU";                                   // UAZ (DShKM)
opfor_transport_helo = "CUP_O_Mi8_RU";                                  // Mi-8MTV3
opfor_transport_truck = "CUP_O_Kamaz_RU";                               // Kamaz 5350
opfor_ammobox_transport = "CUP_O_Kamaz_Open_RU";                        // Kamaz 5350 (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "CUP_O_Kamaz_Refuel_RU";                             // Kamaz 5350 (Fuel)
opfor_ammo_truck = "CUP_O_Kamaz_Reammo_RU";                             // Kamaz 5350 (Ammo)
opfor_fuel_container = "B_Slingload_01_Fuel_F";                         // Huron Fuel Container
opfor_ammo_container = "B_Slingload_01_Ammo_F";                         // Huron Ammo Container
opfor_flag = "FlagCarrierRU";                                           // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
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
militia_vehicles = [
    "CUP_O_UAZ_MG_RU"                                                   // UAZ (DShKM)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
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
opfor_vehicles_low_intensity = [
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
opfor_battlegroup_vehicles = [
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
opfor_battlegroup_vehicles_low_intensity = [
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
opfor_troup_transports = [
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
opfor_choppers = [
    "CUP_O_Mi24_V_Dynamic_RU",                                          // Mi-24V
    "CUP_O_Mi24_P_Dynamic_RU",                                          // Mi-24P
    "CUP_O_Mi8_RU",                                                     // Mi-8MTV3
    "CUP_O_Ka60_Grey_RU",                                               // Ka-60 Kasatka Grey (Rockets)
    "CUP_O_Ka52_RU",                                                    // Ka-52
    "CUP_O_Ka50_DL_RU"                                                  // Ka-50 Black Shark
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "CUP_O_Su25_Dyn_RU",                                                // Su-25T Frogfoot
    "CUP_O_SU34_RU"                                                     // Su-34
];
