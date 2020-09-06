/*
    Needed Mods:
    - Global Mobilization

    Optional Mods:
    - LEN - Cold War Aircraft (due to lack fo air assets in GM for now) - https://steamcommunity.com/sharedfiles/filedetails/?id=1726445116
*/

// Enemy infantry classes
opfor_officer = "gm_gc_army_officer_80_gry";                            // Officer
opfor_squad_leader = "gm_gc_army_squadleader_mpiak74n_80_str";          // Squad Leader
opfor_team_leader = "gm_gc_army_squadleader_mpiak74n_80_str";           // Team Leader
opfor_sentry = "gm_gc_army_rifleman_mpiak74n_80_str";                   // Rifleman (Lite)
opfor_rifleman = "gm_gc_army_rifleman_mpiak74n_80_str";                 // Rifleman
opfor_rpg = "gm_gc_army_antitank_mpiak74n_rpg7_80_str";                 // Rifleman (LAT)
opfor_grenadier = "gm_gc_army_demolition_mpiaks74n_80_str";             // Grenadier
opfor_machinegunner = "gm_gc_army_machinegunner_lmgrpk_80_str";         // Autorifleman
opfor_heavygunner = "gm_gc_army_machinegunner_pk_80_str";               // Heavy Gunner
opfor_marksman = "gm_gc_army_rifleman_mpiak74n_80_str";                 // Marksman
opfor_sharpshooter = "gm_gc_army_rifleman_mpiak74n_80_str";             // Sharpshooter
opfor_sniper = "gm_gc_army_rifleman_mpiak74n_80_str";                   // Sniper
opfor_at = "gm_gc_army_antitank_mpiak74n_rpg7_80_str";                  // AT Specialist
opfor_aa = "gm_gc_army_demolition_mpiaks74n_80_str";                    // AA Specialist
opfor_medic = "gm_gc_army_rifleman_mpiak74n_80_str";                    // Combat Life Saver
opfor_engineer = "gm_gc_army_engineer_mpiaks74n_80_str";                // Engineer
opfor_paratrooper = "gm_gc_army_rifleman_mpiak74n_80_str";              // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "gm_gc_army_brdm2um";                                      // SPW40-P2UM
opfor_mrap_armed = "gm_gc_army_brdm2";                                  // SPW-40P2
opfor_transport_helo = "gm_gc_army_ural4320_cargo";                     // Truck gel. 5 Transport
opfor_transport_truck = "gm_gc_army_ural4320_cargo";                    // Truck gel. 5 Transport
opfor_ammobox_transport = "gm_gc_army_ural4320_cargo";                  // Truck gel. 5 Transport -> Has to be able to transport resource crates!
opfor_fuel_truck = "gm_gc_army_ural4320_refuel";                        // Truck gel. 5 Fuel
opfor_ammo_truck = "gm_gc_army_ural4320_reammo";                        // Truck gel. 5 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "FlagPole_F";                                              // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "gm_gc_army_rifleman_mpiak74n_80_str",                              // Rifleman (Lite)
    "gm_gc_army_rifleman_mpiak74n_80_str",                              // Rifleman (Lite)
    "gm_gc_army_rifleman_mpiak74n_80_str",                              // Rifleman
    "gm_gc_army_rifleman_mpiak74n_80_str",                              // Rifleman
    "gm_gc_army_antitank_mpiak74n_rpg7_80_str",                         // Rifleman (AT)
    "gm_gc_army_machinegunner_lmgrpk_80_str",                           // Autorifleman
    "gm_gc_army_rifleman_mpiak74n_80_str",                              // Marksman
    "gm_gc_army_rifleman_mpiak74n_80_str",                              // Medic
    "gm_gc_army_engineer_mpiaks74n_80_str"                              // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "gm_gc_army_brdm2um"                                                // SPW40-P2UM
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "gm_gc_army_brdm2um",                                               // SPW40-P2UM
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb",                                               // SPW-60PB
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_army_zsu234v1",                                              // ZSU-23-4V1
    "gm_gc_army_t55a",                                                  // T55A
    "gm_gc_army_t55a"                                                   // T55A
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "gm_gc_army_brdm2um",                                               // SPW40-P2UM
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb"                                                // SPW-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "gm_gc_army_ural4320_cargo",                                        // Truck gel. 5 Transport
    "gm_gc_army_brdm2um",                                               // SPW40-P2UM
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb",                                               // SPW-60PB
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_army_zsu234v1",                                              // ZSU-23-4V1
    "gm_gc_army_t55a",                                                  // T55A
    "gm_gc_army_t55a",                                                  // T55A
    "len_mi8amt_nva"                                                    // Mi8amt
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "gm_gc_army_ural4320_cargo",                                        // Truck gel. 5 Transport
    "gm_gc_army_brdm2um",                                               // SPW40-P2UM
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb",                                               // SPW-60PB
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_army_zsu234v1"                                               // ZSU-23-4V1
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.   */
opfor_troup_transports = [
    "gm_gc_army_ural4320_cargo",                                        // Truck gel. 5 Transport
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb",                                               // SPW-60PB
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_airforce_mi2p"                                               // Mi-2P
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "gm_gc_airforce_mi2p",                                              // Mi-2P
    "gm_gc_airforce_mi2us",                                             // Mi-2US
    "gm_gc_airforce_mi2urn",                                            // Mi-2URN
    "len_mi8amt_nva",                                                   // Mi8amt
    "len_mi24d_AT_nva",                                                 // Mi-24D (AT)
    "len_mi24d_CAS_nva",                                                // Mi-24D (CAS)
    "len_mi24d_FAB_nva",                                                // Mi-24D (FAB)
    "len_mi24p_AT_nva",                                                 // Mi-24P (AT)
    "len_mi24p_CAS_nva",                                                // Mi-24P (CAS)
    "len_mi24p_FAB_nva"                                                 // Mi-24P (FAB)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "len_l39_nva"                                                       // Aero L-39
];
