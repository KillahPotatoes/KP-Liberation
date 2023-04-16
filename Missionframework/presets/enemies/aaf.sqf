/*
    File: aaf.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-03
    Last Update: 2020-05-15
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        AAF enemy preset.

    Needed Mods:
        - None

    Optional Mods:
        - None
*/

// Enemy infantry classes
KPLIB_o_officer = "I_officer_F";                                        // Officer
KPLIB_o_squadLeader = "I_Soldier_SL_F";                                 // Squad Leader
KPLIB_o_teamLeader = "I_Soldier_TL_F";                                  // Team Leader
KPLIB_o_sentry = "I_Soldier_lite_F";                                    // Rifleman (Lite)
KPLIB_o_rifleman = "I_soldier_F";                                       // Rifleman
KPLIB_o_riflemanLAT = "I_Soldier_LAT2_F";                               // Rifleman (LAT)
KPLIB_o_grenadier = "I_Soldier_GL_F";                                   // Grenadier
KPLIB_o_machinegunner = "I_Soldier_AR_F";                               // Autorifleman
KPLIB_o_heavyGunner = "I_Soldier_AR_F";                                 // Heavy Gunner
KPLIB_o_marksman = "I_Soldier_M_F";                                     // Marksman
KPLIB_o_sharpshooter = "I_Soldier_M_F";                                 // Sharpshooter
KPLIB_o_sniper = "I_ghillie_sard_F";                                    // Sniper
KPLIB_o_atSpecialist = "I_Soldier_AT_F";                                // AT Specialist
KPLIB_o_aaSpecialist = "I_Soldier_AA_F";                                // AA Specialist
KPLIB_o_medic = "I_medic_F";                                            // Combat Life Saver
KPLIB_o_engineer = "I_engineer_F";                                      // Engineer
KPLIB_o_paratrooper = "B_soldier_PG_F";                                 // Paratrooper

// Enemy vehicles used by secondary objectives.
KPLIB_o_mrap = "I_MRAP_03_F";                                           // M-ATV
KPLIB_o_mrapArmed = "I_MRAP_03_hmg_F";                                  // MATV (HMG)
KPLIB_o_transportHeli = "I_Heli_Transport_02_F";                        // Merlin
KPLIB_o_transportTruck = "I_Truck_02_covered_F";                        // Kamaz Transport (Covered)
KPLIB_o_transportTruckAmmo = "I_Truck_02_transport_F";                  // Kamaz Transport (Open) -> Has to be able to transport resource crates!
KPLIB_o_fuelTruck = "I_Truck_02_fuel_F";                                // Kamaz Fuel
KPLIB_o_ammoTruck = "I_Truck_02_ammo_F";                                // Kamz Ammo
KPLIB_o_fuelContainer = "B_Slingload_01_Fuel_F";                        // Huron Fuel Pod
KPLIB_o_ammoContainer = "B_Slingload_01_Ammo_F";                        // Huron Ammo Pod
KPLIB_o_flag = "Flag_AAF_F";                                            // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
KPLIB_o_militiaInfantry = [
    "I_Soldier_lite_F",                                                 // Rifleman (Lite)
    "I_Soldier_lite_F",                                                 // Rifleman (Lite)
    "I_soldier_F",                                                      // Rifleman
    "I_soldier_F",                                                      // Rifleman
    "I_Soldier_LAT2_F",                                                 // Rifleman (AT)
    "I_Soldier_AR_F",                                                   // Autorifleman
    "I_Soldier_M_F",                                                    // Marksman
    "I_medic_F",                                                        // Medic
    "I_engineer_F"                                                      // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
KPLIB_o_militiaVehicles = [
    "B_LSV_01_armed_F",                                                 // Polaris DAGOR (XM312)
    "B_LSV_01_armed_F",                                                 // Polaris DAGOR (XM312)
    "I_MRAP_03_hmg_F",                                                  // MATV (HMG)
    "I_APC_Wheeled_03_cannon_F",                                        // SPz Pandur
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_AT_F"                                                      // Wiesel ATGM
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
KPLIB_o_armyVehicles = [
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "I_MRAP_03_gmg_F",                                                  // M-ATV (GMG)
    "B_LSV_01_AT_F",                                                    // Polaris (Mini-Spike PZAbw)
    "I_APC_Wheeled_03_cannon_F",                                        // SPz Pandur
    "I_APC_Wheeled_03_cannon_F",                                        // SPz Pandur
    "I_APC_tracked_03_cannon_F",                                        // Warrior
    "I_APC_tracked_03_cannon_F",                                        // Warrior
    "I_LT_01_AA_F",                                                     // Wiesel AA
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "I_MBT_03_cannon_F",                                                // Leopard
    "I_MBT_03_cannon_F",                                                // Leopard
    "B_AFV_Wheeled_01_up_cannon_F",                                     // Rooikat 120 UP
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_AT_F"                                                      // Wiesel ATGM
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
KPLIB_o_armyVehiclesLight = [
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "B_LSV_01_AT_F",                                                    // Polaris DAGOR (Mini-Spike PZAbw)
    "I_APC_Wheeled_03_cannon_F",                                        // SPz Pandur
    "I_APC_tracked_03_cannon_F",                                        // Warrior
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_AT_F"                                                      // Wiesel ATGM
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehicles = [
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "I_MRAP_03_gmg_F",                                                  // M-ATV (GMG)
    "I_MRAP_03_gmg_F",                                                  // M-ATV (GMG)
    "B_LSV_01_AT_F",                                                    // Polaris DAGOR (Mini-Spike PZAbw)
    "I_Truck_02_transport_F",                                           // Kamaz Transport
    "I_Truck_02_covered_F",                                             // Kamaz Transport (Covered)
    "I_APC_tracked_03_cannon_F",                                        // Warrior
    "I_APC_tracked_03_cannon_F",                                        // Warrior
    "I_LT_01_AA_F",                                                     // Wiesel AA
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "I_MBT_03_cannon_F",                                                // Leopard
    "I_MBT_03_cannon_F",                                                // Leopard
    "I_MBT_03_cannon_F",                                                // Leopard
    "B_MBT_01_TUSK_F",                                                  // Merkava Mk IV LIC
    "I_Heli_light_03_dynamicLoadout_F",                                 // Wildcat (Armed)
    "I_Heli_light_03_dynamicLoadout_F",                                 // Wildcat (Armed)
    "I_Heli_Transport_02_F",                                            // Merlin
    "B_Heli_Attack_01_dynamicLoadout_F",                                // RAH-66 Comanche
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_AT_F"                                                      // Wiesel ATGM
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
KPLIB_o_battleGrpVehiclesLight = [
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "I_MRAP_03_hmg_F",                                                  // M-ATV (HMG)
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_cannon_F",                                                 // Wiesel MK20
    "I_LT_01_AT_F",                                                     // Wiesel ATGM
    "I_Truck_02_transport_F",                                           // Kamaz Transport
    "I_APC_Wheeled_03_cannon_F",                                        // SPz Pandur
    "I_APC_tracked_03_cannon_F",                                        // Warrior
    "B_APC_Tracked_01_AA_F",                                            // Bardelas
    "I_LT_01_AA_F",                                                     // Wiesel AA
    "B_CTRG_Heli_Transport_01_sand_F",                                  // UH-80 Ghost Hawk (Sand)
    "I_Heli_Transport_02_F"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur. */
KPLIB_o_troopTransports = [
    "I_Truck_02_transport_F",                                           // Kamaz Transport
    "I_Truck_02_covered_F",                                             // Kamaz Transport (Covered)
    "I_APC_Wheeled_03_cannon_F",                                        // SPz Pandur
    "B_CTRG_Heli_Transport_01_sand_F",                                  // UH-80 Ghost Hawk (sand)
    "I_Heli_Transport_02_F"                                             // Merlin
];

// Enemy rotary-wings that will need to spawn in flight.
KPLIB_o_helicopters = [
    "I_Heli_light_03_dynamicLoadout_F",                                 // Wildcat (Armed)
    "B_CTRG_Heli_Transport_01_sand_F",                                  // UH-80 Ghost Hawk (Sand)
    "B_Heli_Attack_01_dynamicLoadout_F",                                // RAH-66 Comanche
    "B_Heli_Transport_01_F",                                            // UH-80 Ghost Hawk
    "I_Heli_Transport_02_F",                                            // Merlin
    "B_Heli_Transport_03_unarmed_F"                                     // CH-47l Chinook (unarmed)
];

// Enemy fixed-wings that will need to spawn in the air.
KPLIB_o_planes = [
    "B_Plane_CAS_01_dynamicLoadout_F",                                  // A-10D Thunderbolt II (CAS)
    "I_Plane_Fighter_03_dynamicLoadout_F",                              // L-159
    "I_Plane_Fighter_04_F"                                              // Gripen
];
