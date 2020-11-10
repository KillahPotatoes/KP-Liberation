/*
    Needed Mods:
    - Global Mobilization

    Optional Mods:
    - LEN - Cold War Helicopters (due to lack fo air assets in GM for now) - https://steamcommunity.com/sharedfiles/filedetails/?id=1726445116
*/

// Enemy infantry classes
opfor_officer = "gm_ge_army_officer_p1_parka_80_win";                   // Officer
opfor_squad_leader = "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win";   // Squad Leader
opfor_team_leader = "gm_ge_army_squadleader_g3a3_p2a1_parka_80_win";    // Team Leader
opfor_sentry = "gm_ge_army_rifleman_g3a3_parka_80_win";                 // Rifleman (Lite)
opfor_rifleman = "gm_ge_army_rifleman_g3a3_parka_80_win";               // Rifleman
opfor_rpg = "gm_ge_army_antitank_g3a3_pzf44_parka_80_win";              // Rifleman (LAT)
opfor_grenadier = "gm_ge_army_grenadier_g3a3_parka_80_win";             // Grenadier
opfor_machinegunner = "gm_ge_army_machinegunner_mg3_parka_80_win";      // Autorifleman
opfor_heavygunner = "gm_ge_army_machinegunner_mg3_parka_80_win";        // Heavy Gunner
opfor_marksman = "gm_ge_army_rifleman_g3a3_parka_80_win";               // Marksman
opfor_sharpshooter = "gm_ge_army_rifleman_g3a3_parka_80_win";           // Sharpshooter
opfor_sniper = "gm_ge_army_rifleman_g3a3_parka_80_win";                 // Sniper
opfor_at = "gm_ge_army_antitank_g3a3_pzf84_parka_80_win";               // AT Specialist
opfor_aa = "gm_ge_army_demolition_g3a4_parka_80_win";                   // AA Specialist
opfor_medic = "gm_ge_army_medic_g3a3_parka_80_win";                     // Combat Life Saver
opfor_engineer = "gm_ge_army_engineer_g3a4_parka_80_win";               // Engineer
opfor_paratrooper = "gm_ge_army_rifleman_g3a3_parka_80_win";            // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "gm_ge_army_iltis_cargo_win";                              // Truck 0.5t
opfor_mrap_armed = "gm_ge_army_iltis_milan_win";                        // Truck 0.5t MILAN
opfor_transport_helo = "gm_ge_army_kat1_454_cargo_win";                 // Truck 10t mil gl Transport
opfor_transport_truck = "gm_ge_army_kat1_451_cargo_win";                // Truck 5t mil gl Transport
opfor_ammobox_transport = "gm_ge_army_kat1_451_container_win";          // Truck 5t mil gl Container -> Has to be able to transport resource crates!
opfor_fuel_truck = "gm_ge_army_kat1_451_refuel_win";                    // Truck 5t mil gl Fuel
opfor_ammo_truck = "gm_ge_army_kat1_451_reammo_win";                    // Truck 5t mil gl Ammo
opfor_fuel_container = "B_Slingload_01_Fuel_F";                         // Huron Fuel Container
opfor_ammo_container = "B_Slingload_01_Ammo_F";                         // Huron Ammo Container
opfor_flag = "FlagPole_F";                                              // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "gm_ge_army_rifleman_g3a3_parka_80_win",                            // Rifleman (Lite)
    "gm_ge_army_rifleman_g3a3_parka_80_win",                            // Rifleman (Lite)
    "gm_ge_army_rifleman_g3a3_parka_80_win",                            // Rifleman
    "gm_ge_army_rifleman_g3a3_parka_80_win",                            // Rifleman
    "gm_ge_army_antitank_g3a3_pzf44_parka_80_win",                      // Rifleman (AT)
    "gm_ge_army_machinegunner_mg3_parka_80_win",                        // Autorifleman
    "gm_ge_army_rifleman_g3a3_parka_80_win",                            // Marksman
    "gm_ge_army_medic_g3a3_parka_80_win",                               // Medic
    "gm_ge_army_engineer_g3a4_parka_80_win"                             // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "gm_ge_army_u1300l_cargo"                                           // Truck 2t Transport
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "gm_ge_army_u1300l_cargo_win",                                      // Truck 2t Transport
    "gm_ge_army_iltis_milan_win",                                       // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer_win",                                  // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance_win",                            // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc_win",                                       // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan_win",                                 // M113A3 (MILAN)
    "gm_ge_army_gepard1a1_win",                                         // Gepard 1A1
    "gm_ge_army_Leopard1a1a1_win",                                      // Leopard 1A1A1
    "gm_ge_army_Leopard1a1a2_win",                                      // Leopard 1A1A2
    "gm_ge_army_Leopard1a3a1_win"                                       // Leopard 1A3A1
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "gm_ge_army_u1300l_cargo_win",                                      // Truck 2t Transport
    "gm_ge_army_iltis_milan_win",                                       // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer_win",                                  // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance_win"                             // Fuchs (Recon, MILAN)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "gm_ge_army_u1300l_cargo_win",                                      // Truck 2t Transport
    "gm_ge_army_iltis_milan_win",                                       // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer_win",                                  // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance_win",                            // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc_win",                                       // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan_win",                                 // M113A3 (MILAN)
    "gm_ge_army_gepard1a1_win",                                         // Gepard 1A1
    "gm_ge_army_Leopard1a1a1_win",                                      // Leopard 1A1A1
    "gm_ge_army_Leopard1a1a2_win",                                      // Leopard 1A1A2
    "gm_ge_army_Leopard1a3a1_win",                                      // Leopard 1A3A1
    "len_uh1d_bw"                                                       // BW UH-1D
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "gm_ge_army_u1300l_cargo_win",                                      // Truck 2t Transport
    "gm_ge_army_iltis_milan_win",                                       // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer_win",                                  // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance_win",                            // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc_win",                                       // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan_win",                                 // M113A3 (MILAN)
    "gm_ge_army_gepard1a1_win",                                         // Gepard 1A1
    "len_uh1d_bw"                                                       // BW UH-1D
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.   */
opfor_troup_transports = [
    "gm_ge_army_u1300l_cargo_win",                                      // Truck 2t Transport
    "gm_ge_army_fuchsa0_engineer_win",                                  // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance_win",                            // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc_win",                                       // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan_win"                                  // M113A3 (MILAN)
    "gm_ge_army_ch53g"                                                  // CH-53G
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "gm_ge_army_bo105p_pah1",                                           // PAH 1
    "gm_ge_army_bo105p_pah1a1",                                         // PAH 1A1
    "gm_ge_army_ch53g",                                                 // CH-53G
    "len_uh1d_bw"                                                       // BW UH-1D
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [];
