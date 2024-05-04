/*
    Needed Mods:
    - Legion Studios Base - Stable
    - Legion Studios - Star Wars Battlefields
    - Just Like The Simulations - The Great War
    - 3AS (Beta Test)
    - Kobra Mod Pack - Main
    - Keeli Company Auxillary Mod

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "3AS_CIS_TS_F";                                         // Officer
opfor_squad_leader = "BNA_KC_CIS_Unit_Droid_B1_Commander";              // Squad Leader
opfor_team_leader = "BNA_KC_CIS_Unit_Droid_B1";                         // Team Leader
opfor_sentry = "BNA_KC_CIS_Unit_Droid_B1_Security";                     // Rifleman (Lite)
opfor_rifleman = "BNA_KC_CIS_Unit_Droid_B1";                            // Rifleman
opfor_rpg = "BNA_KC_CIS_Unit_Droid_B1_Marine";                          // Rifleman (LAT)
opfor_grenadier = "BNA_KC_CIS_Unit_Droid_B1_CQC";                       // Grenadier
opfor_machinegunner = "BNA_KC_CIS_Unit_Droid_B1_Heavy";                 // Autorifleman
opfor_heavygunner = "BNA_KC_CIS_Unit_Droid_B1_Heavy";                   // Heavy Gunner
opfor_marksman = "BNA_KC_CIS_Unit_Droid_B1_Sniper";                     // Marksman
opfor_sharpshooter = "BNA_KC_CIS_Unit_Droid_B1_Sniper";                 // Sharpshooter
opfor_sniper = "BNA_KC_CIS_Unit_Droid_B1_Sniper";                       // Sniper
opfor_at = "BNA_KC_CIS_Unit_Droid_B1_AT";                               // AT Specialist
opfor_aa = "BNA_KC_CIS_Unit_Droid_B1_AA";                               // AA Specialist
opfor_medic = "BNA_KC_CIS_Unit_Droid_B1";                               // Combat Life Saver
opfor_engineer = "BNA_KC_CIS_Unit_Droid_B1_Engineer";                   // Engineer
opfor_paratrooper = "BNA_KC_CIS_Unit_Droid_B1_Rocket";                  // Jetpack droid

// Enemy vehicles used by secondary objectives.
opfor_mrap = "3AS_SAC_F";                                               // Squad Assault Craft
opfor_mrap_armed = "3AS_SAC_F";                                         // Squad Assault Craft
opfor_transport_helo = "3AS_HMP_Transport";                             // HMP Gunship
opfor_transport_truck = "3AS_SAC_F";                                    // Squad Assault Craft
opfor_ammobox_transport = "442_argon_transport_cis";                    // Argon Transport (Open) -> Has to be able to transport resource crates!
opfor_fuel_truck = "442_argon_fuel_cis";                                // Argon Fuel
opfor_ammo_truck = "442_argon_ammo_cis";                                // Argon Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "ls_flag_cis";                                             // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    opfor_rifleman,                                                     // Rifleman
    opfor_rifleman,                                                     // Rifleman
    opfor_rifleman,                                                     // Rifleman
    opfor_rifleman,                                                     // Rifleman
    opfor_rifleman,                                                     // Rifleman (AT)
    opfor_machinegunner,                                                // Autorifleman
    opfor_marksman,                                                     // Marksman
    opfor_medic,                                                        // Medic
    opfor_engineer                                                      // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "3AS_SAC_F",                                                        // Squad Assault Craft
    "lsd_ground_agtRaptor"                                              // Raptor
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "3AS_PAC_F",                                                        // Platoon Assault Craft
    "lsd_car_ast",                                                      // Scout tank
    "lsd_car_ast",                                                      // Scout tank
    "lsd_ground_agtRaptor",                                             // Raptor
    "lsd_ground_agtRaptor",                                             // Raptor
    "3AS_GAT_Light",                                                    // GAT (Light)
    "3AS_GAT_Light",                                                    // GAT (Light)
    "3AS_GAT",                                                          // GAT
    "BNA_KC_CIS_AAT",                                                   // AAT
    "BNA_KC_CIS_AAT",                                                   // AAT
    "BNA_KC_CIS_AAT_Heavy"                                              // Heavy AAT
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "lsd_car_ast",                                                      // Scout tank
    "lsd_car_ast",                                                      // Scout tank
    "lsd_ground_agtRaptor",                                             // Raptor
    "lsd_ground_agtRaptor",                                             // Raptor
    "BNA_KC_CIS_AAT"                                                    // AAT
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "3AS_PAC_F",                                                        // Platoon Assault Craft
    "3AS_PAC_F",                                                        // Platoon Assault Craft
    "lsd_car_ast",                                                      // Scout tank
    "lsd_ground_agtRaptor",                                             // Raptor
    "lsd_ground_agtRaptor",                                             // Raptor
    "3AS_N99",                                                          // N99 Snail Tank
    "3AS_N99",                                                          // N99 Snail Tank
    "3AS_GAT",                                                          // GAT
    "3AS_GAT",                                                          // GAT
    "BNA_KC_CIS_AAT",                                                   // AAT
    "BNA_KC_CIS_AAT",                                                   // AAT
    "BNA_KC_CIS_AAT",                                                   // AAT
    "BNA_KC_CIS_AAT_Heavy",                                             // Heavy AAT
    "BNA_KC_CIS_AAT_Heavy",                                             // Heavy AAT
    "BNA_KC_CIS_AAT_King",                                              // King AAT
    "3AS_CIS_Vulture_CAS_F",                                            // Vulture (CAS)
    "3AS_CIS_Vulture_CAS_F",                                            // Vulture (CAS)
    "3AS_HMP_Gunship"                                                   // HMP Gunship
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "3AS_SAC_F",                                                        // Squad Assault Craft
    "3AS_SAC_F",                                                        // Squad Assault Craft
    "3AS_PAC_F",                                                        // Platoon Assault Craft
    "3AS_N99",                                                          // N99 Snail Tank
    "3AS_N99",                                                          // N99 Snail Tank
    "BNA_KC_CIS_AAT",                                                   // AAT
    "BNA_KC_CIS_AAT",                                                   // AAT
    "3AS_CIS_Vulture_CAS_F"                                             // Vulture (CAS)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "3AS_SAC_F",                                                        // Squad Assault Craft
    "3AS_PAC_F",                                                        // Platoon Assault Craft
    "3AS_HMP_Gunship"                                                   // HMP Gunship
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "3AS_HMP_Transport",                                                // HMP Transport
    "3AS_HMP_Gunship"                                                   // HMP Gunship
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "3AS_CIS_Vulture_F",                                                // Vulture
    "3AS_CIS_Vulture_CAS_F",                                            // Vulture (CAS)
    "3AS_CIS_Vulture_AA_F"                                              // Vulture (AA)
];
