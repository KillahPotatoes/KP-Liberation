/*
    Needed Mods:
    - RHS USAF

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "rhsusf_army_ucp_officer";                                          // Officer
opfor_squad_leader = "rhsusf_army_ucp_squadleader";                                 // Squad Leader
opfor_team_leader = "rhsusf_army_ucp_teamleader";                                   // Team Leader
opfor_sentry = "rhsusf_army_ucp_riflemanl";                                     	// Rifleman (Lite)
opfor_rifleman = "rhsusf_army_ucp_rifleman_m4";                                     // Rifleman M4
opfor_rpg = "rhsusf_army_ucp_maaws";                                          		// Rifleman (MAAWS)
opfor_grenadier = "rhsusf_army_ucp_grenadier";                                     	// Grenadier
opfor_machinegunner = "rhsusf_army_ucp_autorifleman";                               // Autorifleman
opfor_heavygunner = "rhsusf_army_ucp_machinegunner";                                // Heavy Gunner
opfor_marksman = "rhsusf_army_ucp_marksman";                                       	// Marksman
opfor_sharpshooter = "rhsusf_army_ucp_m107";                                		// Sharpshooter
opfor_sniper = "rhsusf_army_ucp_sniper";                                            // Sniper
opfor_at = "rhsusf_army_ucp_javelin";                                            	// AT Specialist
opfor_aa = "rhsusf_army_ucp_aa";                                            		// AA Specialist
opfor_medic = "rhsusf_army_ucp_medic";                                              // Combat Life Saver
opfor_engineer = "rhsusf_army_ucp_engineer";                                        // Engineer
opfor_paratrooper = "O_soldier_PG_F";                                   			// Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "rhsusf_M1220_usarmy_wd";                                             	// M1220 MRAP
opfor_mrap_armed = "thsusf_M1120_M2_usarmy_wd";                                     // HMMWV (M2)
opfor_transport_helo = "RHS_UH60M";                   								// UH 60 M
opfor_transport_truck = "rhsusf_M1083A1P2_WD_fmtv_usarmy";                         	// M1083A1P2 (Covered)
opfor_ammobox_transport = "rhsusf_M1083A1P2_WD_flatbed_fmtv_usarmy";                // M1083A1P2 (Open)
opfor_fuel_truck = "rhsusf_M978A4_BKIT_usarmy_wd";                                	// M978A4 Fuel
opfor_ammo_truck = "rhsusf_M977A4_AMMO_BKIT_usarmy_wd";                             // M977A4 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             			// Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             			// Taru Ammo Pod
opfor_flag = "Flag_US_F";                                             				// Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "rhsusf_army_ucp_riflemanl",                                                    // Rifleman (Lite)
    "rhsusf_army_ucp_riflemanl",                                                    // Rifleman (Lite)
    "rhsusf_army_ucp_rifleman",                                                     // Rifleman
    "rhsusf_army_ucp_rifleman",                                                     // Rifleman
    "rhsusf_army_ucp_riflemanat",                                                 	// Rifleman (AT)
    "rhsusf_army_ucp_autorifleman",                                                 // Autorifleman
    "rhsusf_army_ucp_marksman",                                                   	// Marksman
    "rhsusf_army_ucp_medic",                                               			// Medic
    "rhsusf_army_ucp_engineer"                                                    	// Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "rhsusf_m1025_w_m2"                                                             // HMMWV (M2)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
	"rhsusf_m1151_m2_v1_usarmy_wd",                                                 // HMMWV (M2)
    "rhsusf_m1151_m2crows_usarmy_wd",                                               // HMMWV (M2 Crows)
    "rhsusf_m1151_mk19_v2_usarmy_wd",                                               // HMMWV (MK19)
    "rhsusf_m1151_m240_usarmy_wd",                                                  // HMMWV (TOW)
    "RHS_M2A3_BUSKI_wd ",                                                           // M2A3 Bradley 
    "RHS_M2A3_wd",                                                                  // M2A3 Bradley
    "RHS_M6_wd",                                                                    // M6 AA Bradley
    "RHS_M6_wd",                                                                    // M6 AA Bradley
    "rhsusf_m1a1aimwd_usarmy",                                                      // M1A1 Abrams
    "rhsusf_m1a1aim_tuski_wd",                                                      // M1A1 Abrams TUSK I
    "rhsusf_m1a2sep1wd_usarmy",                                                     // M1A2 Abrams
    "rhsusf_m1a2sep1tuskiiwd_usarmy"                                                // M1A2 Abrams TUSK II
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "rhsusf_m1025_w_m2",                                                            // HMMWV (HMG)
    "rhsusf_m1025_w_m2",                                                            // HMMWV (HMG)
    "rhsusf_m1045_w_s",                                                             // HMMWV (TOW)
    "rhsusf_m1240a1_m2_usarmy_wd",                                                  // M-ATV (HMG)
    "rhsusf_m113_usarmy"                                                            // M113
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "rhsusf_m1151_m2_v1_usarmy_wd",                                                  // HMMWV (M2)
    "rhsusf_m1025_w_m2",                                                             // HMMWV (M2)
    "rhsusf_m1025_w_mk19",                                                           // HMMWV (MK19)
    "rhsusf_m966_w",                                                                 // HMMWV (TOW)
    "rhsusf_M1232_M2_usarmy_wd",                                                     // M1232 Transport (M2)
    "rhsusf_M1078A1P2_WD_fmtv_usarmy",                                               // M1078A1P2 Transport (Covered)
    "rhsusf_stryker_m1127_m2_wd",                                                    // Stryker
    "RHS_M2A2_wd",                                                                   // Bradley
    "RHS_M6_wd",                                                                     // M6 AA Bradley
    "RHS_M6_wd",                                                                     // M6 AA Bradley
    "rhsusf_m1a1aimwd_usarmy",                                                       // M1A1 Abrams
    "rhsusf_m1a2sep1wd_usarmy",                                                      // M1A2 Abrams
    "rhsusf_m1a2sep1tskiwd_usarmy",                                                  // M1A2 Abrams TUSK I
    "rhsusf_m1a2sep1tskiiwd_usarmy",                                                 // M1A2 Abrams TUSK II
    "RHS_UH1Y_d",                                                                    // UH1Y (Armed)
    "RHS_UH60M_d",                                                                   // UH60M
    "RHS_CH_47F_10",                                                                 // Chinhook
    "RHS_AH64D_wd"                                                                   // AH64D
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "rhsusf_m1025_w_m2",                                                             // HMMWV (M2)
    "rhsusf_m1151_ma_v1_usarmy_wd",                                                  // HMMWV (M2)
    "rhsusf_M1232_M2_usarmy_wd",                                                     // M1232 Transport (M2)
    "rhsusf_m113_usarmy_M240",                                                       // M113 (M240)
    "RHS_M2A2_wd",                                                                   // M2A2 Bradley
    "RHS_M6_wdF",                                                                    // M6 AA Bradley
    "RHS_UH1Y_d",                                                                    // UH1Y (Armed)
    "RHS_UH60M_d"                                                                    // UH60M
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "rhsusf_M1078A1P2_WD_fmtv_usarmy",                                              // M1078A1P2 Transport (Covered)
    "rhsusf_stryker_m1127_m2_wd",                                                   // Stryker
    "rhsusf_M1232_M2_usarmy_wd",                                                    // M1232 Transport (M2)
    "RHS_UH60M_d",                                                                  // UH60M
    "RHS_CH_47F_10"                                                                 // Chinhook
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "RHS_UH60M_d",                                                                  // UH60M
    "RHS_UH1Y_d",                                                                   // UH1Y (Armed)
    "RHS_AH64D_wd",                                                                 // AH64D
	"RHS_CH_47F_10"                                                                 // Chinhook
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "RHS_A10",                                                                      // A10
    "rhsuf_f22"                                                                     // F22
];
