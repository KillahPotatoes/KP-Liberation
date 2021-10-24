/*
    Author: Discord Karelia#5286
    
    Needed Mods:
    - 3CB Factions
	- RHS AFRF
	- RHS GREF
	- RHS USAF


    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "UK3CB_AAF_B_OFF";                                      // Officer
opfor_squad_leader = "UK3CB_AAF_B_SL";                                  // Squad Leader
opfor_team_leader = "UK3CB_AAF_B_TL";                                   // Team Leader
opfor_sentry = "UK3CB_AAF_B_JNR_OFF";                                   // Rifleman (Lite)
opfor_rifleman = "UK3CB_AAF_B_RIF_1";                                   // Rifleman
opfor_rpg = "UK3CB_AAF_B_LAT";                                          // Rifleman (LAT)
opfor_grenadier = "UK3CB_AAF_B_GL";                                     // Grenadier
opfor_machinegunner = "UK3CB_AAF_B_AR";                                 // Autorifleman
opfor_heavygunner = "UK3CB_AAF_B_MG";                                   // Heavy Gunner
opfor_marksman = "UK3CB_AAF_B_MK";                                      // Marksman
opfor_sharpshooter = "UK3CB_AAF_B_MK";                                  // Sharpshooter
opfor_sniper = "UK3CB_AAF_B_SNI";                                       // Sniper
opfor_at = "UK3CB_AAF_B_AT";                                            // AT Specialist
opfor_aa = "UK3CB_AAF_B_AA";                                            // AA Specialist
opfor_medic = "UK3CB_AAF_B_MD";                                         // Combat Life Saver
opfor_engineer = "UK3CB_AAF_B_ENG";                                     // Engineer
opfor_paratrooper = "UK3CB_AAF_B_SF_LAT";                               // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "UK3CB_AAF_B_M1025";                                       // M1025 HMMWV
opfor_mrap_armed = "UK3CB_AAF_B_M1025_M2";                              // M1025 HMMWV M2
opfor_transport_helo = "UK3CB_AAF_B_UH60M";                             // UH-60 Black Hawk
opfor_transport_truck = "UK3CB_AAF_B_MTVR_Closed";                      // MTVR
opfor_ammobox_transport = "UK3CB_AAF_B_M977A4_Recovery";                // M977A4 Recovery -> Has to be able to transport resource crates!
opfor_fuel_truck = "UK3CB_AAF_B_M977A4_Fuel";                           // M977A4 Fuel
opfor_ammo_truck = "UK3CB_AAF_B_M977A4_Reammo";                         // M977A4 Ammo
opfor_fuel_container = "UK3CB_AAF_B_MTVR_Refuel";                       // MTVR Refuel
opfor_ammo_container = "UK3CB_AAF_B_MTVR_Reammo";                       // MTVR Reammo
opfor_flag = "Flag_AAF_F";                                              // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "UK3CB_AAF_B_RIF_1",                                                 // Rifleman
    "UK3CB_AAF_B_RIF_1",                                                 // Rifleman
    "UK3CB_AAF_B_JNR_OFF",                                               // Platoon Leader
    "UK3CB_AAF_B_SL",                                                    // Squad Leader
    "UK3CB_AAF_B_LAT",                                                   // Rifleman (AT)
    "UK3CB_AAF_B_AR",                                                    // Autorifleman
    "UK3CB_AAF_B_MK",                                                    // Marksman
    "UK3CB_AAF_B_MD",                                                    // Medic
    "UK3CB_AAF_B_ENG"                                                    // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "UK3CB_AAF_B_LR_M2",                                                 // Land Rover M2
    "UK3CB_AAF_B_LR_M2",                                                 // Land Rover M2
    "UK3CB_AAF_B_M1025_M2",                                              // M1025 HMMWV M2
    "UK3CB_AAF_B_M1025_M2"                                               // M1025 HMMWV M2
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "UK3CB_AAF_B_M1025_M2",                                             // M1025 HMMWV M2
    "UK3CB_AAF_B_M1025_MK19",                                           // M1025 HMMWV Mk19
    "UK3CB_AAF_B_M1117",                                                // M1117 Guardian
    "UK3CB_AAF_B_LAV25",                                                // LAV-25
    "UK3CB_AAF_B_AAV",                                                  // AAV-7
    "UK3CB_AAF_B_MTVR_ZU23",                                            // MTVR ZU23
    "UK3CB_AAF_B_M60A3",                                                // M60A3 Patton
    "UK3CB_AAF_B_M1A1"                                                  // M1A1 Abrams
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "UK3CB_AAF_B_M1025_M2",                                             // M1025 HMMWV M2
    "UK3CB_AAF_B_M1025_M2",                                             // M1025 HMMWV M2
    "UK3CB_AAF_B_M1025_M2",                                             // M1025 HMMWV M2
    "UK3CB_AAF_B_M1025_M2",                                             // M1025 HMMWV M2
    "UK3CB_AAF_B_MTVR_ZU23",                                            // MTVR w/ ZU23
    "UK3CB_AAF_B_M1117",                                                // M1117 Guardian
    "UK3CB_AAF_B_M1117",                                                // M1117 Guardian
    "UK3CB_AAF_B_LAV25",                                                // LAV-25
    "UK3CB_AAF_B_LAV25",                                                // LAV-25
    "UK3CB_AAF_B_M60A3"                                                 // M60A3 Patton
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "UK3CB_AAF_B_M1025_M2",                                             // M1025 HMMWV M2
    "UK3CB_AAF_B_M1025_MK19",                                           // M1025 HMMWV Mk19
    "UK3CB_AAF_B_M1117",                                                // M1117 Guardian
    "UK3CB_AAF_B_M977_Transport_Open",                                  // M997
    "UK3CB_AAF_B_MTVR_Closed",                                          // MTVR
    "UK3CB_AAF_B_LAV25",                                    		    // LAV-25
    "UK3CB_AAF_B_MTVR_ZU23",                                            // MTVR ZU23
    "UK3CB_AAF_B_AAV",                                          	    // AAV-7
    "UK3CB_AAF_B_M60A3",                                                // M60A3 Patton
    "UK3CB_AAF_B_M1A1",                                                 // M1A1 Abrams
    "UK3CB_AAF_B_UH1H_GUNSHIP",                                         // UH-1H Iroquois
    "UK3CB_AAF_B_UH60M",                                                // UH-60 Black Hawk
    "UK3CB_AAF_B_AH1Z",                                                 // AH-1Z Viper
    "UK3CB_AAF_B_L39_CAS",                                              // L-39
    "UK3CB_AAF_B_Gripen",                                               // Gripen
    "UK3CB_AAF_B_Gripen_G"                                              // Gripen
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "UK3CB_AAF_B_M113_M2",                                              // M113 w/ M2
    "UK3CB_AAF_B_LAV25",                                                // Wiesel MK20
    "UK3CB_AAF_B_M1117",                                                // Wiesel ATGM
    "UK3CB_AAF_B_MTVR_Closed",                                          // Kamaz Transport
    "UK3CB_AAF_B_AAV",                                                  // SPz Pandur
    "UK3CB_AAF_B_M60A3",                                                // M60A3 Patton
    "UK3CB_AAF_B_MTVR_ZU23",                                            // MTVR ZU23
    "UK3CB_AAF_B_UH60M",                                                // UH-60 Black Hawk
    "UK3CB_AAF_B_UH1H_GUNSHIP"                                          // UH-1H Iroquois
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"UK3CB_AAF_B_M113_M2",											   // M113 M2
    "UK3CB_AAF_B_M977_Transport_Open",                                 // M997
    "UK3CB_AAF_B_MTVR_Closed",                                         // MTVR
    "UK3CB_AAF_B_AAV",                                                 // AAV-7
    "UK3CB_AAF_B_UH60M",                        	        		   // UH-60 Black Hawk
    "UK3CB_AAF_B_UH1H_GUNSHIP"                                         // UH-1H Iroquois
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "UK3CB_AAF_B_UH1H_GUNSHIP",                                        // UH-1H Iroquois
    "UK3CB_AAF_B_UH60M",                                               // UH-60 Black Hawk
    "UK3CB_AAF_B_AH1Z"                                                 // AH-1Z Viper
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "UK3CB_AAF_B_L39_CAS",                                             // L-39
    "UK3CB_AAF_B_Gripen",                                              // Gripen
    "UK3CB_AAF_B_Gripen_G"                                             // Gripen
];
