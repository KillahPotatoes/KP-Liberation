/*
    Needed Mods:
    - CUP Weapons
    - CUP Vehicles
    - CUP Units

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "CUP_O_INS_Story_Lopotev";                              // Officer
opfor_squad_leader = "CUP_O_INS_Commander";                             // Squad Leader
opfor_team_leader = "CUP_O_INS_Officer";                                // Team Leader
opfor_sentry = "CUP_O_INS_Soldier";                                     // Rifleman (Lite)
opfor_rifleman = "CUP_O_INS_Soldier_AK74";                              // Rifleman
opfor_rpg = "CUP_O_INS_Soldier_Exp";                                    // Rifleman (LAT)
opfor_grenadier = "CUP_O_INS_Soldier_GL";                               // Grenadier
opfor_machinegunner = "CUP_O_INS_Soldier";                              // Autorifleman
opfor_heavygunner = "CUP_O_INS_Soldier_MG";                             // Heavy Gunner
opfor_marksman = "CUP_O_INS_Woodlander2";                               // Marksman
opfor_sharpshooter = "CUP_O_INS_Villager3";                             // Sharpshooter
opfor_sniper = "CUP_O_INS_Sniper";                                      // Sniper
opfor_at = "CUP_O_INS_Soldier_AT";                                      // AT Specialist
opfor_aa = "CUP_O_INS_Soldier_AA";                                      // AA Specialist
opfor_medic = "CUP_O_INS_Medic";                                        // Medic
opfor_engineer = "CUP_O_INS_Soldier_Engineer";                          // Engineer
opfor_paratrooper = "CUP_O_INS_Saboteur";                               // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "CUP_O_UAZ_Unarmed_CHDKZ";                                 // UAZ
opfor_mrap_armed = "CUP_O_UAZ_MG_CHDKZ";                                // UAZ (DShKM)
opfor_transport_helo = "CUP_O_Mi8_CHDKZ";                               // Mi-8MT
opfor_transport_truck = "CUP_O_Ural_CHDKZ";                             // Ural
opfor_ammobox_transport = "CUP_O_Ural_Open_CHDKZ";                      // Ural (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "CUP_O_Ural_Refuel_CHDKZ";                           // Ural (Refuel)
opfor_ammo_truck = "CUP_O_Ural_Reammo_CHDKZ";                           // Ural (Ammo)
opfor_fuel_container = "B_Slingload_01_Fuel_F";                         // Huron Fuel Container
opfor_ammo_container = "B_Slingload_01_Ammo_F";                         // Huron Ammo Container
opfor_flag = "FlagCarrierINS";                                          // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "CUP_O_INS_Villager3",                                              // Farmer
    "CUP_O_INS_Woodlander3",                                            // Forester
    "CUP_O_INS_Woodlander2",                                            // Gamekeeper
    "CUP_O_INS_Worker2",                                                // Local
    "CUP_O_INS_Villager4",                                              // Villager
    "CUP_O_INS_Woodlander1"                                             // Woodman
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "CUP_O_Datsun_PK_Random"                                            // Datsun 620 Pickup (PK) Woodland
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "CUP_O_UAZ_MG_CHDKZ",                                               // UAZ (DShKM)
    "CUP_O_UAZ_AA_CHDKZ",                                               // UAZ (AA)
    "CUP_O_UAZ_AGS30_CHDKZ",                                            // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_CHDKZ",                                             // UAZ (SPG-9)
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR80_CHDKZ",                                                // BTR-80
    "CUP_O_BTR80A_CHDKZ",                                               // BTR-80A
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_ZSU23_Afghan_ChDKZ",                                         // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_ChDKZ",                                                // ZSU-23-4
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_T72_CHDKZ",                                                  // T-72
    "CUP_O_T72_CHDKZ"                                                   // T-72
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "CUP_O_UAZ_MG_CHDKZ",                                               // UAZ (DShKM)
    "CUP_O_Datsun_AA_Random",                                           // Datsun 620 Pickup (AA)
    "CUP_O_MTLB_pk_ChDKZ",                                              // MT-LB LV
    "CUP_O_BRDM2_CHDKZ",                                                // BRDM-2
    "CUP_O_Ural_ZU23_CHDKZ",                                            // Ural (ZU-23)
    "CUP_O_BTR60_CHDKZ"                                                 // BTR-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "CUP_O_UAZ_MG_CHDKZ",                                               // UAZ (DShKM)
    "CUP_O_UAZ_AA_CHDKZ",                                               // UAZ (AA)
    "CUP_O_UAZ_AGS30_CHDKZ",                                            // UAZ (AGS-30)
    "CUP_O_UAZ_SPG9_CHDKZ",                                             // UAZ (SPG-9)
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR80_CHDKZ",                                                // BTR-80
    "CUP_O_BTR80A_CHDKZ",                                               // BTR-80A
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_ZSU23_Afghan_ChDKZ",                                         // ZSU-23-4 Afghanski
    "CUP_O_ZSU23_ChDKZ",                                                // ZSU-23-4
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_T72_CHDKZ",                                                  // T-72
    "CUP_O_T72_CHDKZ",                                                  // T-72
    "CUP_O_Mi8_CHDKZ",                                                  // Mi-8MT
    "CUP_O_Mi8_CHDKZ"                                                   // Mi-8MT
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "CUP_O_UAZ_MG_CHDKZ",                                               // UAZ (DShKM)
    "CUP_O_Datsun_AA_Random",                                           // Datsun 620 Pickup (AA)
    "CUP_O_MTLB_pk_ChDKZ",                                              // MT-LB LV
    "CUP_O_BRDM2_CHDKZ",                                                // BRDM-2
    "CUP_O_Ural_ZU23_CHDKZ",                                            // Ural (ZU-23)
    "CUP_O_T55_CHDKZ",                                                  // T-55
    "CUP_O_BTR60_CHDKZ"                                                 // BTR-60PB
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "CUP_O_BTR60_CHDKZ",                                                // BTR-60PB
    "CUP_O_BTR80_CHDKZ",                                                // BTR-80
    "CUP_O_BTR80A_CHDKZ",                                               // BTR-80A
    "CUP_O_MTLB_pk_ChDKZ",                                              // MT-LB LV
    "CUP_O_BMP2_CHDKZ",                                                 // BMP-2
    "CUP_O_Mi8_CHDKZ"                                                   // Mi-8MT
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "CUP_O_Mi8_CHDKZ"                                                   // Mi-8MT
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "CUP_O_Su25_Dyn_RU"                                                 // Su-25T Frogfoot
];
