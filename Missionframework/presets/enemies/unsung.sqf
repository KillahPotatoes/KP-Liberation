/*
    File: unsung.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-07-08
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        North Vietnamese Army enemy preset.

    Needed Mods:
        - Unsung

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "uns_men_NVA_68_COM";                                 // Officer
KPLIB_o_squadLeader = "uns_men_NVA_68_off";                             // Squad Leader
KPLIB_o_teamLeader = "uns_men_NVA_68_nco";                              // Team Leader
KPLIB_o_sentry = "uns_men_NVA_68_RSAP";                                 // Rifleman (Lite)
KPLIB_o_rifleman = "uns_men_NVA_68_AS5";                                // Rifleman
KPLIB_o_riflemanLAT = "uns_men_NVA_68_AT2";                             // Rifleman (LAT)
KPLIB_o_grenadier = "uns_men_NVA_68_AS1";                               // Grenadier
KPLIB_o_machinegunner = "uns_men_NVA_68_LMG";                           // Autorifleman
KPLIB_o_heavyGunner = "uns_men_NVA_68_HMG";                             // Heavy Gunner
KPLIB_o_marksman = "uns_men_NVA_68_RF2";                                // Marksman
KPLIB_o_sharpshooter = "uns_men_NVA_68_RF1";                            // Sharpshooter
KPLIB_o_sniper = "uns_men_NVA_68_Rmrk";                                 // Sniper
KPLIB_o_atSpecialist = "uns_men_NVA_68_AT";                             // AT Specialist
KPLIB_o_aaSpecialist = "uns_men_NVA_68_AA";                             // AA Specialist
KPLIB_o_medic = "uns_men_NVA_68_MED";                                   // Combat Life Saver
KPLIB_o_engineer = "uns_men_NVA_68_SAP";                                // Engineer
KPLIB_o_paratrooper = "uns_men_NVA_68_Ra2";                             // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "uns_Type55";                                            // Type 55 (Transport)
KPLIB_o_mrapArmed = "uns_Type55_MG";                                    // Type 55 APC (DShk)
KPLIB_o_transportHeli = "uns_Mi8T_VPAF";                                // Mi-8T Hip-C (Transport)
KPLIB_o_transportTruck = "uns_nvatruck";                                // Ural Truck
KPLIB_o_transportTruckAmmo = "uns_nvatruck_open";                       // Ural Truck (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "uns_nvatruck_refuel";                              // Ural Truck (refuel)
KPLIB_o_ammoTruck = "uns_nvatruck_reammo";                              // Ural Truck (ammo)
KPLIB_o_fuelContainer = "Box_EAF_AmmoVeh_F";                            // LDF Vehicle Ammo Box
KPLIB_o_ammoContainer = "Box_EAF_AmmoVeh_F";                            // LDF Vehicle Ammo Box
KPLIB_o_flag = "uns_FlagCarrierNVA";                                    // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
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
KPLIB_o_militiaVehicles = [];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
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
KPLIB_o_armyVehiclesLight = [
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_RR57",                                                  // Type 55 APC (57mm Type36)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg"                                                     // Type63 APC (MG)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
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
KPLIB_o_battleGrpVehiclesLight = [
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_Type55_patrol",                                                // Type 55 APC (Patrol)
    "uns_nvatruck_mg",                                                  // Ural Truck (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "pook_ZSU57_NVA",                                                   // ZSU-57-2 (Sparka)
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "uns_nvatruck_open",                                                // Ural Truck (Open)
    "uns_nvatruck",                                                     // Ural Truck
    "uns_nvatruck_mg",                                                  // Ural Truck (MG)
    "uns_Type63_mg",                                                    // Type63 APC (MG)
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "uns_Mi8TV_VPAF_MG"                                                 // Mi-8TV Hip-C (Transport)
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "uns_an2_cas",                                                      // An-2 Colt (CAS)
    "uns_Mig21_CAP",                                                    // Mig-21 Fishbed F (CAP)
    "uns_Mig21_CAS"                                                     // Mig-21 Fishbed F (CAS)
];
