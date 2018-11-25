/*
    KP Liberation Custom East Side Preset

    File: customEast.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-24
    Last Update: 2018-11-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Custom east side preset file for individual adjustments.
*/

#include "script_component.hpp"

params [
    ["_isFriendly", false, [false]]
];

/*------------------------------------------------------------
    --- GENERAL SETTINGS ---
    General stuff like side and colors.
------------------------------------------------------------*/

// Color for this side
KPLIB_PRST_SETVAR("color", "ColorEast");
// Color for this side (active)
KPLIB_PRST_SETVAR("colorAct", "ColorRed");
// Name of the used/created army in this preset
KPLIB_PRST_SETVAR("name", "Custom East Army");
// Side for this preset
KPLIB_PRST_SETVAR("side", east);
// Military alphabet
KPLIB_PRST_AR_CREATE("alphabet");
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Alpha";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Bravo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Charlie";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Delta";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Echo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Foxtrot";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Golf";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Hotel";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "India";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Juliet";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Kilo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Lima";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Mike";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "November";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Oscar";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Papa";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Quebec";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Romeo";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Sierra";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Tango";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Uniform";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Victor";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Whiskey";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "X-Ray";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Yankee";
(KPLIB_PRST_GETVAR("alphabet")) pushBack "Zulu";


/*------------------------------------------------------------
    --- IMPORTANT UNIQUE CLASSNAMES ---
    Each of these has to be unique.
    Don't use any of the entered classnames anywhere else in the preset.
------------------------------------------------------------*/

// The building defined to unlock FOB air vehicle availability.
KPLIB_PRST_SETVAR("airBuilding", "Land_Radar_Small_F");
// This is the virtual arsenal as portable supply crate.
KPLIB_PRST_SETVAR("arsenalBox", "O_supplyCrate_F");
// This defines the ammunition resource crates.
KPLIB_PRST_SETVAR("crateAmmo", "O_CargoNet_01_ammo_F");
// This defines the fuel resource crates.
KPLIB_PRST_SETVAR("crateFuel", "CargoNet_01_barrels_F");
// This defines the supply resource crates.
KPLIB_PRST_SETVAR("crateSupply", "CargoNet_01_box_F");
// This is the FOB as a container.
KPLIB_PRST_SETVAR("fobBox", "Land_Pod_Heli_Transport_04_box_F");
// This is the main FOB HQ building.
KPLIB_PRST_SETVAR("fobBuilding", "Land_Cargo_HQ_V1_F");
// This is the FOB as a vehicle..
KPLIB_PRST_SETVAR("fobTruck", "O_Truck_03_device_F");
// The building defined to unlock FOB logistic functionalities.
KPLIB_PRST_SETVAR("logiBuilding", "Land_RepairDepot_01_tan_F");
// This is Potato 01, a multipurpose mobile respawn as a helicopter.
KPLIB_PRST_SETVAR("potato", "O_Heli_Transport_04_covered_F");
// This is the mobile respawn (and medical) truck.
KPLIB_PRST_SETVAR("respawnTruck", "O_Truck_03_medical_F");
// The helipad used to increase the GLOBAL rotary-wing cap.
KPLIB_PRST_SETVAR("slotHeli", "Land_HelipadSquare_F");
// The hangar used to increase the GLOBAL fixed-wing cap.
KPLIB_PRST_SETVAR("slotJet", "Land_TentHangar_V1_F");
// The large storage area for resources.
KPLIB_PRST_SETVAR("storageLarge", "ContainmentArea_01_sand_F");
// The small storage area for resources.
KPLIB_PRST_SETVAR("storageSmall", "ContainmentArea_02_sand_F");


/*------------------------------------------------------------
    --- ADDITIONAL MECHANICS CLASSNAMES ---
    Classnames of additional mechanics/functionalities in the mission.
    The entered classnames can be reused somewhere else in the preset.
------------------------------------------------------------*/

// These are the boats which spawn in the boat racks of the Liberty.
KPLIB_PRST_SETVAR("addBoat", "O_Boat_Transport_01_F");
// These are the additional helicopter which spawns at the Operation Base.
KPLIB_PRST_SETVAR("addHeli", "B_Heli_Light_01_F");
// These are the trucks which are used in the logistic convoy system.
KPLIB_PRST_SETVAR("logiTruck", "O_Truck_03_transport_F");
// Static Mortar Classname
KPLIB_PRST_SETVAR("mortar", "O_Mortar_01_F");
// Static AA Classname
KPLIB_PRST_SETVAR("staticAa", "O_static_AA_F");
// Static Big AA Classname
KPLIB_PRST_SETVAR("staticAaBig", "O_SAM_System_04_F");
// Static AT Classname
KPLIB_PRST_SETVAR("staticAt", "O_static_AT_F");

/*------------------------------------------------------------
    --- REGULAR SOLDIER CLASSNAMES ---
    Classnames of the different regular soldier types.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// AA Specialist
KPLIB_PRST_SETVAR("rsAntiAir", "O_Soldier_AA_F");
// AT Specialist
KPLIB_PRST_SETVAR("rsAntiTank", "O_Soldier_AT_F");
// Autorifleman
KPLIB_PRST_SETVAR("rsAutorifleMan", "O_Soldier_AR_F");
// Helicopter crew
KPLIB_PRST_SETVAR("rsCrewmanHeli", "O_helicrew_F");
// Vehicle crew
KPLIB_PRST_SETVAR("rsCrewmanVeh", "O_crew_F");
// Engineer
KPLIB_PRST_SETVAR("rsEngineer", "O_engineer_F");
// Grenadier
KPLIB_PRST_SETVAR("rsGrenadier", "O_Soldier_GL_F");
// Heavy Gunner
KPLIB_PRST_SETVAR("rsHeavyGunner", "O_HeavyGunner_F");
// Helicopter pilot
KPLIB_PRST_SETVAR("rsPilotHeli", "O_helipilot_F");
// Jet pilot
KPLIB_PRST_SETVAR("rsPilotJet", "O_Fighter_Pilot_F");
// Light Anti Tank
KPLIB_PRST_SETVAR("rsLightAt", "O_Soldier_LAT_F");
// Marksman
KPLIB_PRST_SETVAR("rsMarksman", "O_soldier_M_F");
// Medic
KPLIB_PRST_SETVAR("rsMedic", "O_medic_F");
// Officer
KPLIB_PRST_SETVAR("rsOfficer", "O_officer_F");
// Paratrooper
KPLIB_PRST_SETVAR("rsParatrooper", "O_soldier_PG_F");
// Rifleman
KPLIB_PRST_SETVAR("rsRifleman", "O_Soldier_F");
// Sharpshooter
KPLIB_PRST_SETVAR("rsSharpshooter", "O_Sharpshooter_F");
// Squad Leader
KPLIB_PRST_SETVAR("rsSquadLeader", "O_Soldier_SL_F");
// Survivor (no weapons, etc.)
KPLIB_PRST_SETVAR("rsSurvivor", "O_Survivor_F");
// Team Leader
KPLIB_PRST_SETVAR("rsTeamLeader", "O_Soldier_TL_F");


/*------------------------------------------------------------
    --- SPECIAL FORCES CLASSNAMES ---
    Classnames of the different special forces soldiers.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// Special Forces Diver
KPLIB_PRST_SETVAR("sfDiver", "O_diver_F");
// Special Forces Explosive Specialist
KPLIB_PRST_SETVAR("sfExplosive", "O_V_Soldier_Exp_hex_F");
// Special Forces Light Anti Tank
KPLIB_PRST_SETVAR("sfLightAt", "O_V_Soldier_LAT_hex_F");
// Special Forces Marksman
KPLIB_PRST_SETVAR("sfMarksman", "O_V_Soldier_M_hex_F");
// Special Forces Medic
KPLIB_PRST_SETVAR("sfMedic", "O_V_Soldier_Medic_hex_F");
// Special Forces Rifleman
KPLIB_PRST_SETVAR("sfRifleman", "O_V_Soldier_hex_F");
// Special Forces Sharpshooter
KPLIB_PRST_SETVAR("sfSharpshooter", "O_Pathfinder_F");
// Special Forces Sniper
KPLIB_PRST_SETVAR("sfSniper", "O_sniper_F");
// Special Forces Spotter
KPLIB_PRST_SETVAR("sfSpotter", "O_spotter_F");
// Special Forces Teamleader
KPLIB_PRST_SETVAR("sfTeamLeader", "O_V_Soldier_TL_hex_F");


/*------------------------------------------------------------
    --- BUILDABLE OBJECTS ARRAYS ---
    The arrays below are used to determine what can be build.
    Format: "classname", supplies, ammunition, fuel
    Example: KPLIB_PRST_AR_ADD("lVeh", "B_MRAP_01_F", 100, 0, 50);
    The above example adds the NATO Hunter MRAP to the light vehicles list
    with the costs of 100 supplies, 0 ammunition and 50 fuel.
------------------------------------------------------------*/

// Infantry units
KPLIB_PRST_AR_CREATE("soldiers");
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsRifleman"),             20,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsLightAt"),              30,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsGrenadier"),            25,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsAutorifleMan"),         25,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsHeavyGunner"),          35,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsMarksman"),             30,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsAntiTank"),             50,   10,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsAntiAir"),              50,   10,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsMedic"),                30,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsEngineer"),             30,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsParatrooper"),          20,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsCrewmanVeh"),           10,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsCrewmanHeli"),          10,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsPilotHeli"),            10,    0,   0);
KPLIB_PRST_AR_ADD("soldiers", KPLIB_PRST_GETVAR("rsPilotJet"),             10,    0,   0);
KPLIB_PRST_AR_PLAIN("soldiers", "soldiersPl");

// Special Forces units
KPLIB_PRST_AR_CREATE("specOps");
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfRifleman"),              50,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfLightAt"),               80,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfMarksman"),              80,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfMedic"),                 80,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfExplosive"),             80,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfSpotter"),               80,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfSharpshooter"),          85,    0,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfSniper"),               100,   10,   0);
KPLIB_PRST_AR_ADD("specOps", KPLIB_PRST_GETVAR("sfDiver"),                100,    0,   0);
KPLIB_PRST_AR_PLAIN("specOps", "specOpsPl");

// Light vehicles
KPLIB_PRST_AR_CREATE("lVeh");
KPLIB_PRST_AR_ADD("lVeh", "O_Quadbike_01_F",                             50,    0,  25);   // Quadbike
KPLIB_PRST_AR_ADD("lVeh", "O_LSV_02_unarmed_F",                          75,    0,  50);   // Qilin
KPLIB_PRST_AR_ADD("lVeh", "O_LSV_02_armed_F",                            75,   40,  50);   // Qilin (HMG)
KPLIB_PRST_AR_ADD("lVeh", "O_LSV_02_AT_F",                               75,   50,  50);   // Qilin (AT)
KPLIB_PRST_AR_ADD("lVeh", "O_MRAP_02_F",                                100,    0,  50);   // Ifrit
KPLIB_PRST_AR_ADD("lVeh", "O_MRAP_02_hmg_F",                            100,   40,  50);   // Ifrit (HMG)
KPLIB_PRST_AR_ADD("lVeh", "O_MRAP_02_gmg_F",                            100,   60,  50);   // Ifrit (GMG)
KPLIB_PRST_AR_PLAIN("lVeh", "lVehPl");

// Transport trucks
KPLIB_PRST_AR_CREATE("transports");
KPLIB_PRST_AR_ADD("transports", "O_Truck_03_transport_F",               125,    0,  75);   // Tempest Transport
KPLIB_PRST_AR_ADD("transports", "O_Truck_03_covered_F",                 125,    0,  75);   // Tempest Transport (Covered)
KPLIB_PRST_AR_PLAIN("transports", "transportsPl");

// Boats
KPLIB_PRST_AR_CREATE("boats");
KPLIB_PRST_AR_ADD("boats", "O_Boat_Transport_01_F",                     100,    0,  25);   // Assault Boat
KPLIB_PRST_AR_ADD("boats", "O_Boat_Armed_01_hmg_F",                     200,   80,  75);   // Speedboat with Minigun
KPLIB_PRST_AR_ADD("boats", "O_SDV_01_F",                                150,    0,  50);   // SDV
KPLIB_PRST_AR_PLAIN("boats", "boatsPl");

// Heavy vehicles
KPLIB_PRST_AR_CREATE("hVeh");
KPLIB_PRST_AR_ADD("hVeh", "O_APC_Wheeled_02_rcws_v2_F",                 200,   75, 125);    // MSE-3 Marid
KPLIB_PRST_AR_ADD("hVeh", "O_APC_Tracked_02_cannon_F",                  300,  100, 150);    // BTR-K Kamysh
KPLIB_PRST_AR_ADD("hVeh", "O_MBT_02_cannon_F",                          300,  250, 180);    // T-100 Varsuk
KPLIB_PRST_AR_ADD("hVeh", "O_MBT_04_cannon_F",                          400,  300, 200);    // T-140 Angara
KPLIB_PRST_AR_ADD("hVeh", "O_MBT_04_command_F",                         500,  350, 225);    // T-140K Angara
KPLIB_PRST_AR_PLAIN("hVeh", "hVehPl");

// Anti Air vehicles
KPLIB_PRST_AR_CREATE("antiAir");
KPLIB_PRST_AR_ADD("antiAir", "O_APC_Tracked_02_AA_F",                   300,  250, 175);    // ZSU-39 Tigris
KPLIB_PRST_AR_PLAIN("antiAir", "antiAirPl");

// Artillery vehicles
KPLIB_PRST_AR_CREATE("arty");
KPLIB_PRST_AR_ADD("arty", KPLIB_PRST_GETVAR("mortar"),                     80,  150,   0);    // Mk6 Mortar
KPLIB_PRST_AR_ADD("arty", "O_MBT_02_arty_F",                            600, 1250, 300);    // 2S9 Sochor
KPLIB_PRST_AR_PLAIN("arty", "artyPl");

// Transport Helicopters
KPLIB_PRST_AR_CREATE("heliTrans");
KPLIB_PRST_AR_ADD("heliTrans", "B_Heli_Light_01_F",                     200,    0, 100);    // MH-9 Hummingbird
KPLIB_PRST_AR_ADD("heliTrans", "O_Heli_Light_02_unarmed_F",             250,    0, 150);    // PO-30 Orca (unarmed)
KPLIB_PRST_AR_ADD("heliTrans", "O_Heli_Transport_04_bench_F",           300,    0, 175);    // Mi-290 Taru (Bench)
KPLIB_PRST_AR_PLAIN("heliTrans", "heliTransPl");

// Attack Helicopters
KPLIB_PRST_AR_CREATE("heliAttack");
KPLIB_PRST_AR_ADD("heliAttack", "O_Heli_Light_02_dynamicLoadout_F",     250,  100, 150);    // PO-30 Orca
KPLIB_PRST_AR_ADD("heliAttack", "O_Heli_Attack_02_dynamicLoadout_F",    500,  400, 200);    // Mi-48 Kajman
KPLIB_PRST_AR_PLAIN("heliAttack", "heliAttackPl");

// Transport Planes
KPLIB_PRST_AR_CREATE("planeTrans");
KPLIB_PRST_AR_ADD("planeTrans", "O_T_VTOL_02_infantry_dynamicLoadout_F",750, 1000, 500);    // Y-32 Xi'an (Infantry)
KPLIB_PRST_AR_ADD("planeTrans", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 750, 1000, 500);    // Y-32 Xi'an (Vehicle)
KPLIB_PRST_AR_PLAIN("planeTrans", "planeTransPl");

// Jets
KPLIB_PRST_AR_CREATE("jets");
KPLIB_PRST_AR_ADD("jets", "O_Plane_CAS_02_dynamicLoadout_F",           1000,  800, 400);    // To-199 Neophron
KPLIB_PRST_AR_ADD("jets", "O_Plane_Fighter_02_F",                      1500, 1750, 450);    // To-201 Shikra
KPLIB_PRST_AR_ADD("jets", "O_Plane_Fighter_02_Stealth_F",              1500, 1750, 450);    // To-201 Shikra (Stealth)
KPLIB_PRST_AR_PLAIN("jets", "jetsPl");

// Static Defenses
KPLIB_PRST_AR_CREATE("statics");
KPLIB_PRST_AR_ADD("statics", "O_HMG_01_F",                               25,   40,   0);    // Mk30 HMG .50
KPLIB_PRST_AR_ADD("statics", "O_HMG_01_high_F",                          25,   40,   0);    // Mk30 HMG .50 (Raised)
KPLIB_PRST_AR_ADD("statics", "O_GMG_01_F",                               35,   60,   0);    // Mk32 GMG 20mm
KPLIB_PRST_AR_ADD("statics", "O_GMG_01_high_F",                          35,   60,   0);    // Mk32 GMG 20mm (Raised)
KPLIB_PRST_AR_ADD("statics", KPLIB_PRST_GETVAR("staticAa"),                50,  100,   0);    // Static Titan Launcher (AA)
KPLIB_PRST_AR_ADD("statics", KPLIB_PRST_GETVAR("staticAaBig"),            100,  250,   0);    // S-750 Rhea
KPLIB_PRST_AR_ADD("statics", KPLIB_PRST_GETVAR("staticAt"),                50,  100,   0);    // Static Titan Launcher (AT)
KPLIB_PRST_AR_PLAIN("statics", "staticsPl");

// Logistic vehicles and objects
KPLIB_PRST_AR_CREATE("logistic");
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("arsenalBox"),           100,  200,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("respawnTruck"),         200,    0, 100);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("fobBox"),               300,  500,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("fobTruck"),             300,  500,  75);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("storageSmall"),           0,    0,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("storageLarge"),           0,    0,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("logiBuilding"),         250,    0,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("airBuilding"),         1000,    0,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("slotHeli"),             250,    0,   0);
KPLIB_PRST_AR_ADD("logistic",  KPLIB_PRST_GETVAR("slotJet"),              500,    0,   0);
KPLIB_PRST_AR_ADD("logistic", "O_Radar_System_02_F",                    250,    0,   0);    // R-750 Cronus Radar
KPLIB_PRST_AR_ADD("logistic", "O_Truck_03_repair_F",                    325,    0,  75);    // Tempest Repair
KPLIB_PRST_AR_ADD("logistic", "O_Truck_03_fuel_F",                      125,    0, 275);    // Tempest Fuel
KPLIB_PRST_AR_ADD("logistic", "O_Truck_03_ammo_F",                      125,  200,  75);    // Tempest Ammo
KPLIB_PRST_AR_ADD("logistic", "Land_Pod_Heli_Transport_04_repair_F",    275,    0,   0);    // Taru Repair Container
KPLIB_PRST_AR_ADD("logistic", "Land_Pod_Heli_Transport_04_fuel_F",       75,    0, 200);    // Taru Fuel Container
KPLIB_PRST_AR_ADD("logistic", "Land_Pod_Heli_Transport_04_ammo_F",       75,  200,   0);    // Taru Ammo Container
KPLIB_PRST_AR_PLAIN("logistic", "logisticPl");

// Decorative Objects
KPLIB_PRST_AR_CREATE("deco");
KPLIB_PRST_AR_ADD("deco", "Land_Cargo_House_V1_F",                        0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Cargo_Patrol_V1_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Cargo_Tower_V1_F",                        0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Flag_CSAT_F",                                  0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Flag_Viper_F",                                 0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Flag_White_F",                                 0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Medevac_house_V1_F",                      0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Medevac_HQ_V1_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Flag_RedCrystal_F",                            0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "CamoNet_BLUFOR_F",                             0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "CamoNet_BLUFOR_open_F",                        0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "CamoNet_BLUFOR_big_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_PortableLight_single_F",                  0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_PortableLight_double_F",                  0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_LampSolar_F",                             0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_LampHalogen_F",                           0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_LampStreet_small_F",                      0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_LampAirport_F",                           0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HelipadCircle_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HelipadRescue_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "PortableHelipadLight_01_blue_F",               0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "PortableHelipadLight_01_green_F",              0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "PortableHelipadLight_01_red_F",                0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CampingChair_V1_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CampingChair_V2_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CampingTable_F",                          0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "MapBoard_altis_F",                             0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "MapBoard_stratis_F",                           0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "MapBoard_seismic_F",                           0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Pallet_MilBoxes_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_PaperBox_open_empty_F",                   0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_PaperBox_open_full_F",                    0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_PaperBox_closed_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_DieselGroundPowerUnit_01_F",              0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_ToolTrolley_02_F",                        0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Workbench_01_F",                          0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_GasTank_01_blue_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_GasTank_01_khaki_F",                      0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_GasTank_01_yellow_F",                     0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_GasTank_02_F",                            0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BarrelWater_F",                           0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BarrelWater_grey_F",                      0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_WaterBarrel_F",                           0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_WaterTank_F",                             0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagFence_Round_F",                        0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagFence_Short_F",                        0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagFence_Long_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagFence_Corner_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagFence_End_F",                          0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagBunker_Small_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagBunker_Large_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_BagBunker_Tower_F",                       0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrier_1_F",                            0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrier_3_F",                            0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrier_5_F",                            0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrierWall4_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrierWall6_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrierWall_corner_F",                   0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrierWall_corridor_F",                 0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_HBarrierTower_F",                         0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CncBarrierMedium_F",                      0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CncBarrierMedium4_F",                     0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Concrete_SmallWall_4m_F",                 0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Concrete_SmallWall_8m_F",                 0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CncShelter_F",                            0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CncWall1_F",                              0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_CncWall4_F",                              0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Sign_WarningMilitaryArea_F",              0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Sign_WarningMilAreaSmall_F",              0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Sign_WarningMilitaryVehicles_F",          0,    0,   0);
KPLIB_PRST_AR_ADD("deco", "Land_Razorwire_F",                             0,    0,   0);
KPLIB_PRST_AR_PLAIN("deco", "decoPl");
