/*
    Needed Mods:
    - The Unsung Vietnam War Mod

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "uns_men_NVA_68_COM";                                   // Officer
opfor_squad_leader = "uns_men_NVA_68_off";                              // Squad Leader
opfor_team_leader = "uns_men_NVA_68_nco";                               // Team Leader
opfor_sentry = "uns_men_NVA_68_RSAP";                                   // Rifleman (Lite)
opfor_rifleman = "uns_men_NVA_68_AS5";                                  // Rifleman
opfor_rpg = "uns_men_NVA_68_AT2";                                       // Rifleman (LAT)
opfor_grenadier = "uns_men_NVA_68_AS1";                                 // Grenadier
opfor_machinegunner = "uns_men_NVA_68_LMG";                             // Autorifleman
opfor_heavygunner = "uns_men_NVA_68_HMG";                               // Heavy Gunner
opfor_marksman = "uns_men_NVA_68_RF2";                                  // Marksman
opfor_sharpshooter = "uns_men_NVA_68_RF1";                              // Sharpshooter
opfor_sniper = "uns_men_NVA_68_Rmrk";                                   // Sniper
opfor_at = "uns_men_NVA_68_AT";                                         // AT Specialist
opfor_aa = "uns_men_NVA_68_AA";                                         // AA Specialist
opfor_medic = "uns_men_NVA_68_MED";                                     // Combat Life Saver
opfor_engineer = "uns_men_NVA_68_SAP";                                  // Engineer
opfor_paratrooper = "uns_men_NVA_68_Ra2";                               // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "uns_Type55";                                              // Type 55 (Transport)
opfor_mrap_armed = "uns_Type55_MG";                                     // Type 55 APC (DShk)
opfor_transport_helo = "uns_Mi8T_VPAF";                                 // Mi-8T Hip-C (Transport)
opfor_transport_truck = "uns_nvatruck";                                 // Ural Truck
opfor_ammobox_transport = "uns_nvatruck_open";                          // Ural Truck (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "uns_nvatruck_refuel";                               // Ural Truck (refuel)
opfor_ammo_truck = "uns_nvatruck_reammo";                               // Ural Truck (ammo)
opfor_fuel_container = "Box_EAF_AmmoVeh_F";                             // LDF Vehicle Ammo Box
opfor_ammo_container = "Box_EAF_AmmoVeh_F";                             // LDF Vehicle Ammo Box
opfor_flag = "uns_FlagCarrierNVA";                                      // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "uns_men_VC_local_RF4",                                             // Rifleman (MAS36)
    "uns_men_VC_local_RF4",                                             // Rifleman (MAS36)
    "uns_men_VC_local_RF2",                                             // Rifleman (Mosin)
    "uns_men_VC_local_RF2",                                             // Rifleman (Mosin)
    "uns_men_VC_local_RF6",                                             // Rifleman (Type99)
    "uns_men_VC_local_nco",                                             // Guerilla Deputy (PPSH-41)
    "uns_men_VC_local_off",                                             // Guerilla Leader (K-50M)
    "uns_men_VC_local_MRK2",                                            // Sharpshooter (Type99)
    "uns_men_VC_local_MED",                                             // Medic (M3A1)
    "uns_men_VC_local_SAP"                                              // Sapper (M3A1)
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_RR57",                                                  // Type 55 APC (57mm Type36)
    "uns_Type55_RR57",                                                  // Type 55 APC (57mm Type36)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "pook_ZSU57_NVA",                                                   // ZSU-57-2 (Sparka)
    "pook_ZSU57_NVA",                                                   // ZSU-57-2 (Sparka)
    "pook_ZSU_NVA",                                                     // ZSU-23-4 Shilka
    "pook_ZSU_NVA",                                                     // ZSU-23-4 Shilka
    "uns_ot34_85_nva",                                                  // OT-34/85 Medium Tank
    "uns_ot34_85_nva",                                                  // OT-34/85 Medium Tank
    "uns_t34_85_nva",                                                   // T-34/85 Medium Tank
    "uns_t34_85_nva",                                                   // T-34/85 Medium Tank
    "uns_t54_nva",                                                      // T-54 Medium Tank
    "uns_t55_nva"                                                       // T-55A Medium Tank
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_RR57",                                                  // Type 55 APC (57mm Type36)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg"                                                     // Type63 APC (MG)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_RR57",                                                  // Type 55 APC (57mm Type36)
    "uns_Type55_RR57",                                                  // Type 55 APC (57mm Type36)
    "uns_nvatruck_open",                                                // Ural Truck (Open)
    "uns_nvatruck_mg",                                                  // Ural Truck (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "pook_ZSU57_NVA",                                                   // ZSU-57-2 (Sparka)
    "pook_ZSU_NVA",                                                     // ZSU-23-4 Shilka
    "uns_ot34_85_nva",                                                  // OT-34/85 Medium Tank
    "uns_ot34_85_nva",                                                  // OT-34/85 Medium Tank
    "uns_t34_85_nva",                                                   // T-34/85 Medium Tank
    "uns_t54_nva",                                                      // T-54 Medium Tank
    "uns_t55_nva",                                                      // T-55A Medium Tank
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_nvatruck_mg",                                                  // Ural Truck (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "pook_ZSU57_NVA",                                                   // ZSU-57-2 (Sparka)
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "uns_nvatruck_open",                                                // Ural Truck (Open)
    "uns_nvatruck",                                                     // Ural Truck
    "uns_nvatruck_mg",                                                  // Ural Truck (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "uns_an2_cas",                                                      // An-2 Colt (CAS)
    "uns_Mig21_CAP",                                                    // Mig-21 Fishbed F (CAP)
    "uns_Mig21_CAS"                                                     // Mig-21 Fishbed F (CAS)
];
