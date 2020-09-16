/*
    File: gm_east.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-06
    Last Update: 2020-09-16
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        East Germany enemy preset.

    Needed Mods:
        - Global Mobilization

    Optional Mods:
        - LEN - Cold War Aircraft
*/

// Enemy infantry classes
KPLIB_o_officer = "gm_gc_army_officer_80_gry";                          // Officer
KPLIB_o_squadLeader = "gm_gc_army_squadleader_mpiak74n_80_str";         // Squad Leader
KPLIB_o_teamLeader = "gm_gc_army_squadleader_mpiak74n_80_str";          // Team Leader
KPLIB_o_sentry = "gm_gc_army_rifleman_mpiak74n_80_str";                 // Rifleman (Lite)
KPLIB_o_rifleman = "gm_gc_army_rifleman_mpiak74n_80_str";               // Rifleman
KPLIB_o_riflemanLAT = "gm_gc_army_antitank_mpiak74n_rpg7_80_str";       // Rifleman (LAT)
KPLIB_o_grenadier = "gm_gc_army_demolition_mpiaks74n_80_str";           // Grenadier
KPLIB_o_machinegunner = "gm_gc_army_machinegunner_lmgrpk_80_str";       // Autorifleman
KPLIB_o_heavyGunner = "gm_gc_army_machinegunner_pk_80_str";             // Heavy Gunner
KPLIB_o_marksman = "gm_gc_army_rifleman_mpiak74n_80_str";               // Marksman
KPLIB_o_sharpshooter = "gm_gc_army_rifleman_mpiak74n_80_str";           // Sharpshooter
KPLIB_o_sniper = "gm_gc_army_rifleman_mpiak74n_80_str";                 // Sniper
KPLIB_o_atSpecialist = "gm_gc_army_antitank_mpiak74n_rpg7_80_str";      // AT Specialist
KPLIB_o_aaSpecialist = "gm_gc_army_demolition_mpiaks74n_80_str";        // AA Specialist
KPLIB_o_medic = "gm_gc_army_rifleman_mpiak74n_80_str";                  // Combat Life Saver
KPLIB_o_engineer = "gm_gc_army_engineer_mpiaks74n_80_str";              // Engineer
KPLIB_o_paratrooper = "gm_gc_army_rifleman_mpiak74n_80_str";            // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "gm_gc_army_brdm2um";                                    // SPW40-P2UM
KPLIB_o_mrapArmed = "gm_gc_army_brdm2";                                 // SPW-40P2
KPLIB_o_transportHeli = "gm_gc_army_ural4320_cargo";                    // Truck gel. 5 Transport
KPLIB_o_transportTruck = "gm_gc_army_ural4320_cargo";                   // Truck gel. 5 Transport
KPLIB_o_transportTruckAmmo = "gm_gc_army_ural4320_cargo";               // Truck gel. 5 Transport -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "gm_gc_army_ural4320_refuel";                       // Truck gel. 5 Fuel
KPLIB_o_ammoTruck = "gm_gc_army_ural4320_reammo";                       // Truck gel. 5 Ammo
KPLIB_o_fuelContainer = "Land_Pod_Heli_Transport_04_fuel_F";            // Taru Fuel Pod
KPLIB_o_ammoContainer = "Land_Pod_Heli_Transport_04_ammo_F";            // Taru Ammo Pod
KPLIB_o_flag = "FlagPole_F";                                            // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
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
KPLIB_o_militiaVehicles = [
    "gm_gc_army_brdm2um",                                               // SPW40-P2UM
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_brdm2"                                                  // SPW-40P2
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
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
KPLIB_o_armyVehiclesLight = [
    "gm_gc_army_brdm2um",                                               // SPW40-P2UM
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_brdm2",                                                 // SPW-40P2
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb"                                                // SPW-60PB
    "gm_gc_army_btr60pb"                                                // SPW-60PB
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "gm_gc_army_ural4320_cargo",                                        // Truck gel. 5 Transport
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
KPLIB_o_battleGrpVehiclesLight = [
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
KPLIB_o_troopTransports = [
    "gm_gc_army_ural4320_cargo",                                        // Truck gel. 5 Transport
    "gm_gc_army_btr60pa",                                               // SPW-60PA
    "gm_gc_army_btr60pb",                                               // SPW-60PB
    "gm_gc_army_bmp1sp2",                                               // BMP-1 SP-2
    "gm_gc_airforce_mi2p"                                               // Mi-2P
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
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
KPLIB_o_planes = [
    "len_l39_nva"                                                       // Aero L-39
];
