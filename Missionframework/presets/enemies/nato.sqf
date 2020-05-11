/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "B_officer_F";                                          // Officer
opfor_squad_leader = "B_Soldier_SL_F";                                  // Squad Leader
opfor_team_leader = "B_Soldier_TL_F";                                   // Team Leader
opfor_sentry = "B_Soldier_lite_F";                                      // Rifleman (Lite)
opfor_rifleman = "B_Soldier_F";                                         // Rifleman
opfor_rpg = "B_soldier_LAT_F";                                          // Rifleman (LAT)
opfor_grenadier = "B_Soldier_GL_F";                                     // Grenadier
opfor_machinegunner = "B_soldier_AR_F";                                 // Autorifleman
opfor_heavygunner = "B_HeavyGunner_F";                                  // Heavy Gunner
opfor_marksman = "B_soldier_M_F";                                       // Marksman
opfor_sharpshooter = "B_Sharpshooter_F";                                // Sharpshooter
opfor_sniper = "B_sniper_F";                                            // Sniper
opfor_at = "B_soldier_AT_F";                                            // AT Specialist
opfor_aa = "B_soldier_AA_F";                                            // AA Specialist
opfor_medic = "B_medic_F";                                              // Combat Life Saver
opfor_engineer = "B_engineer_F";                                        // Engineer
opfor_paratrooper = "B_soldier_PG_F";                                   // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "B_MRAP_01_F";                                             // M-ATV
opfor_mrap_armed = "B_MRAP_01_hmg_F";                                   // MATV (HMG)
opfor_transport_helo = "B_Heli_Transport_03_unarmed_F";                 // CH-47l Chinook (unarmed)
opfor_transport_truck = "B_Truck_01_covered_F";                         // HEMTT Transport (Covered)
opfor_ammobox_transport = "B_Truck_01_transport_F";                     // HEMTT Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "B_Truck_01_fuel_F";                                 // HEMTT Fuel
opfor_ammo_truck = "B_Truck_01_ammo_F";                                 // HEMTT Ammo
opfor_fuel_container = "B_Slingload_01_Fuel_F";                         // Huron Fuel Pod
opfor_ammo_container = "B_Slingload_01_Ammo_F";                         // Huron Ammo Pod
opfor_flag = "Flag_NATO_F";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "B_Soldier_F",                                                     // Rifleman (Lite)
    "B_Soldier_F",                                                     // Rifleman (Lite)
    "B_Soldier_F",                                                     // Rifleman
    "B_Soldier_F",                                                     // Rifleman
    "B_soldier_LAT_F",                                                 // Rifleman (AT)
    "B_soldier_AR_F",                                                  // Autorifleman
    "B_soldier_M_F",                                                   // Marksman
    "B_medic_F",                                                       // Medic
    "B_engineer_F"                                                     // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "B_LSV_01_armed_F",                                                 // Polaris DAGOR (XM312)
    "B_LSV_01_armed_F",                                                 // Polaris DAGOR (XM312)
    "B_MRAP_01_hmg_F",                                                  // Ifrit (HMG)
    "B_APC_Wheeled_01_cannon_F"                                         // SPz Badger
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_MRAP_01_gmg_F",                                                  // M-ATV (GMG)
    "B_LSV_01_AT_F",                                                    // Polaris (Mini-Spike PZAbw)
    "B_APC_Wheeled_01_cannon_F",                                        // SPz Badger
    "B_APC_Wheeled_01_cannon_F",                                        // SPz Badger
    "B_APC_Tracked_01_rcws_F",                                          // Namer
    "B_APC_Tracked_01_rcws_F",                                          // Namer
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "B_MBT_01_cannon_F",                                                // Merkava Mk IV M
    "B_AFV_Wheeled_01_cannon_F",                                        // Rooikat 120
    "B_AFV_Wheeled_01_up_cannon_F"                                      // Rooikat 120 UP
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_LSV_01_AT_F",                                                    // Polaris DAGOR (Mini-Spike PZAbw)
    "B_APC_Wheeled_01_cannon_F",                                        // SPz Badger
    "B_APC_Tracked_01_rcws_F"                                           // Namer
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_MRAP_01_gmg_F",                                                  // M-ATV (GMG)
    "B_MRAP_01_gmg_F",                                                  // M-ATV (GMG)
    "B_LSV_01_AT_F",                                                    // Polaris DAGOR (Mini-Spike PZAbw)
    "B_Truck_01_transport_F",                                           // HEMTT Transport
    "B_Truck_01_covered_F",                                             // HEMTT Transport (Covered)
    "B_APC_Tracked_01_rcws_F",                                          // Namer
    "B_APC_Tracked_01_rcws_F",                                          // Namer
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "B_MBT_01_cannon_F",                                                // Merkava Mk IV M
    "B_MBT_01_cannon_F",                                                // Merkava Mk IV M
    "B_MBT_01_TUSK_F",                                                  // Merkava Mk IV LIC
    "B_MBT_01_TUSK_F",                                                  // Merkava Mk IV LIC
    "B_Heli_Light_01_dynamicLoadout_F",                                 // AH-6 Little Bird (Armed)
    "B_Heli_Light_01_dynamicLoadout_F",                                 // AH-6 Little Bird (Armed)
    "B_Heli_Transport_03_F",                                            // CH-471 Chinook
    "B_Heli_Attack_01_dynamicLoadout_F"                                 // RAH-66 Comanche
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_MRAP_01_hmg_F",                                                  // M-ATV (HMG)
    "B_Truck_01_transport_F",                                           // HEMTT Transport
    "B_APC_Wheeled_01_cannon_F",                                        // SPz Badger
    "B_APC_Tracked_01_rcws_F",                                          // Namer
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "B_CTRG_Heli_Transport_01_sand_F",                                  // UH-80 Ghost Hawk (Sand)
    "B_Heli_Transport_03_F"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
    "B_Truck_01_transport_F",                                           // HEMTT Transport
    "B_Truck_01_covered_F",                                             // HEMTT Transport (Covered)
    "B_APC_Wheeled_01_cannon_F",                                        // SPz Badger
    "B_CTRG_Heli_Transport_01_sand_F",                                  // UH-80 Ghost Hawk (sand)
    "B_Heli_Transport_03_F"                                             // CH-471 Chinook
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "B_Heli_Light_01_dynamicLoadout_F",                                 // AH-6 Little Bird (Armed)
    "B_CTRG_Heli_Transport_01_sand_F",                                  // UH-80 Ghost Hawk (Sand)
    "B_Heli_Attack_01_dynamicLoadout_F",                                // RAH-66 Comanche
    "B_Heli_Transport_01_F",                                            // UH-80 Ghost Hawk
    "B_Heli_Transport_03_F",                                            // CH-471 Chinook
    "B_Heli_Transport_03_unarmed_F"                                     // CH-47l Chinook (unarmed)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "B_Plane_CAS_01_dynamicLoadout_F",                                  // A-10D Thunderbolt II (CAS)
    "B_Plane_Fighter_01_F"                                              // F/A-181 Black Wasp II
];
