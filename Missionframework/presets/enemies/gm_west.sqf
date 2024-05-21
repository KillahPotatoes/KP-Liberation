/*
    File: gm_west.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-06
    Last Update: 2020-09-16
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        West Germany enemy preset.

    Needed Mods:
        - Global Mobilization

    Optional Mods:
        - LEN - Cold War Aircraft
*/

// Enemy infantry classes
KPLIB_o_officer = "gm_ge_army_officer_p1_80_oli";                       // Officer
KPLIB_o_squadLeader = "gm_ge_army_squadleader_g3a3_p2a1_80_ols";        // Squad Leader
KPLIB_o_teamLeader = "gm_ge_army_squadleader_g3a3_p2a1_80_ols";         // Team Leader
KPLIB_o_sentry = "gm_ge_army_rifleman_g3a3_80_ols";                     // Rifleman (Lite)
KPLIB_o_rifleman = "gm_ge_army_rifleman_g3a3_80_ols";                   // Rifleman
KPLIB_o_riflemanLAT = "gm_ge_army_antitank_g3a3_pzf44_80_ols";          // Rifleman (LAT)
KPLIB_o_grenadier = "gm_ge_army_grenadier_g3a3_80_ols";                 // Grenadier
KPLIB_o_machinegunner = "gm_ge_army_machinegunner_mg3_80_ols";          // Autorifleman
KPLIB_o_heavyGunner = "gm_ge_army_machinegunner_mg3_80_ols";            // Heavy Gunner
KPLIB_o_marksman = "gm_ge_army_rifleman_g3a3_80_ols";                   // Marksman
KPLIB_o_sharpshooter = "gm_ge_army_rifleman_g3a3_80_ols";               // Sharpshooter
KPLIB_o_sniper = "gm_ge_army_rifleman_g3a3_80_ols";                     // Sniper
KPLIB_o_atSpecialist = "gm_ge_army_antitank_g3a3_pzf84_80_ols";         // AT Specialist
KPLIB_o_aaSpecialist = "gm_ge_army_demolition_g3a4_80_ols";             // AA Specialist
KPLIB_o_medic = "gm_ge_army_medic_g3a3_80_ols";                         // Combat Life Saver
KPLIB_o_engineer = "gm_ge_army_engineer_g3a4_80_ols";                   // Engineer
KPLIB_o_paratrooper = "gm_ge_army_rifleman_g3a3_80_ols";                // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "gm_ge_army_iltis_cargo";                                // Truck 0.5t
KPLIB_o_mrapArmed = "gm_ge_army_iltis_milan";                           // Truck 0.5t MILAN
KPLIB_o_transportHeli = "gm_ge_army_kat1_454_cargo";                    // Truck 10t mil gl Transport
KPLIB_o_transportTruck = "gm_ge_army_kat1_451_cargo";                   // Truck 5t mil gl Transport
KPLIB_o_transportTruckAmmo = "gm_ge_army_kat1_451_container";           // Truck 5t mil gl Container -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "gm_ge_army_kat1_451_refuel";                       // Truck 5t mil gl Fuel
KPLIB_o_ammoTruck = "gm_ge_army_kat1_451_reammo";                       // Truck 5t mil gl Ammo
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Container
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Container
KPLIB_o_flag = "FlagPole_F";                                            // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "gm_ge_army_rifleman_g3a3_80_ols",                                  // Rifleman (Lite)
    "gm_ge_army_rifleman_g3a3_80_ols",                                  // Rifleman (Lite)
    "gm_ge_army_rifleman_g3a3_80_ols",                                  // Rifleman
    "gm_ge_army_rifleman_g3a3_80_ols",                                  // Rifleman
    "gm_ge_army_antitank_g3a3_pzf44_80_ols",                            // Rifleman (AT)
    "gm_ge_army_machinegunner_mg3_80_ols",                              // Autorifleman
    "gm_ge_army_rifleman_g3a3_80_ols",                                  // Marksman
    "gm_ge_army_medic_g3a3_80_ols",                                     // Medic
    "gm_ge_army_engineer_g3a4_80_ols"                                   // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "gm_ge_army_u1300l_cargo"                                           // Truck 2t Transport
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "gm_ge_army_u1300l_cargo",                                          // Truck 2t Transport
    "gm_ge_army_iltis_milan",                                           // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer",                                      // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance",                                // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc",                                           // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan",                                     // M113A3 (MILAN)
    "gm_ge_army_gepard1a1",                                             // Gepard 1A1
    "gm_ge_army_Leopard1a1a1",                                          // Leopard 1A1A1
    "gm_ge_army_Leopard1a1a2",                                          // Leopard 1A1A2
    "gm_ge_army_Leopard1a3a1"                                           // Leopard 1A3A1
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "gm_ge_army_u1300l_cargo",                                          // Truck 2t Transport
    "gm_ge_army_iltis_milan",                                           // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer",                                      // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance"                                 // Fuchs (Recon, MILAN)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "gm_ge_army_u1300l_cargo",                                          // Truck 2t Transport
    "gm_ge_army_iltis_milan",                                           // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer",                                      // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance",                                // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc",                                           // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan",                                     // M113A3 (MILAN)
    "gm_ge_army_gepard1a1",                                             // Gepard 1A1
    "gm_ge_army_Leopard1a1a1",                                          // Leopard 1A1A1
    "gm_ge_army_Leopard1a1a2",                                          // Leopard 1A1A2
    "gm_ge_army_Leopard1a3a1",                                          // Leopard 1A3A1
    "len_uh1d_bw"                                                       // BW UH-1D
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "gm_ge_army_u1300l_cargo",                                          // Truck 2t Transport
    "gm_ge_army_iltis_milan",                                           // Truck 0.5t MILAN
    "gm_ge_army_fuchsa0_engineer",                                      // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance",                                // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc",                                           // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan",                                     // M113A3 (MILAN)
    "gm_ge_army_gepard1a1",                                             // Gepard 1A1
    "len_uh1d_bw"                                                       // BW UH-1D
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.   */
KPLIB_o_troopTransports = [
    "gm_ge_army_u1300l_cargo",                                          // Truck 2t Transport
    "gm_ge_army_fuchsa0_engineer",                                      // Fuchs (Engineer)
    "gm_ge_army_fuchsa0_reconnaissance",                                // Fuchs (Recon, MILAN)
    "gm_ge_army_m113a1g_apc",                                           // M113A3 (MG3)
    "gm_ge_army_m113a1g_apc_milan",                                     // M113A3 (MILAN)
    "gm_ge_army_ch53g"                                                  // CH-53G
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "gm_ge_army_bo105p_pah1",                                           // PAH 1
    "gm_ge_army_bo105p_pah1a1",                                         // PAH 1A1
    "gm_ge_army_ch53g",                                                 // CH-53G
    "len_uh1d_bw"                                                       // BW UH-1D
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [];
