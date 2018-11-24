/*
    KP Liberation Custom West Side Preset

    File: customWest.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-24
    Last Update: 2018-11-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Custom west side preset file for individual adjustments.
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
KPLIBPRSTSETVAR("color", "ColorWest");
// Color for this side (active)
KPLIBPRSTSETVAR("colorAct", "ColorBlue");
// Name of the used/created army in this preset
KPLIBPRSTSETVAR("name", "Custom West Army");
// Side for this preset
KPLIBPRSTSETVAR("side", west);
// Military alphabet
KPLIBPRSTARCREATE("alphabet");
(KPLIBPRSTGETVAR("alphabet")) pushBack "Alpha";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Bravo";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Charlie";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Delta";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Echo";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Foxtrot";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Golf";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Hotel";
(KPLIBPRSTGETVAR("alphabet")) pushBack "India";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Juliet";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Kilo";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Lima";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Mike";
(KPLIBPRSTGETVAR("alphabet")) pushBack "November";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Oscar";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Papa";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Quebec";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Romeo";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Sierra";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Tango";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Uniform";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Victor";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Whiskey";
(KPLIBPRSTGETVAR("alphabet")) pushBack "X-Ray";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Yankee";
(KPLIBPRSTGETVAR("alphabet")) pushBack "Zulu";


/*------------------------------------------------------------
    --- IMPORTANT UNIQUE CLASSNAMES ---
    Each of these has to be unique.
    Don't use any of the entered classnames anywhere else in the preset.
------------------------------------------------------------*/

// The building defined to unlock FOB air vehicle availability.
KPLIBPRSTSETVAR("airBuilding", "Land_Radar_Small_F");
// This is the virtual arsenal as portable supply crate.
KPLIBPRSTSETVAR("arsenalBox", "B_supplyCrate_F");
// This defines the ammunition resource crates.
KPLIBPRSTSETVAR("crateAmmo", "B_CargoNet_01_ammo_F");
// This defines the fuel resource crates.
KPLIBPRSTSETVAR("crateFuel", "CargoNet_01_barrels_F");
// This defines the supply resource crates.
KPLIBPRSTSETVAR("crateSupply", "CargoNet_01_box_F");
// This is the FOB as a container.
KPLIBPRSTSETVAR("fobBox", "B_Slingload_01_Cargo_F");
// This is the main FOB HQ building.
KPLIBPRSTSETVAR("fobBuilding", "Land_Cargo_HQ_V1_F");
// This is the FOB as a vehicle..
KPLIBPRSTSETVAR("fobTruck", "B_Truck_01_box_F");
// The building defined to unlock FOB logistic functionalities.
KPLIBPRSTSETVAR("logiBuilding", "Land_RepairDepot_01_tan_F");
// This is Potato 01, a multipurpose mobile respawn as a helicopter.
KPLIBPRSTSETVAR("potato", "B_Heli_Transport_03_unarmed_F");
// This is the mobile respawn (and medical) truck.
KPLIBPRSTSETVAR("respawnTruck", "B_Truck_01_medical_F");
// The helipad used to increase the GLOBAL rotary-wing cap.
KPLIBPRSTSETVAR("slotHeli", "Land_HelipadSquare_F");
// The hangar used to increase the GLOBAL fixed-wing cap.
KPLIBPRSTSETVAR("slotJet", "Land_TentHangar_V1_F");
// The large storage area for resources.
KPLIBPRSTSETVAR("storageLarge", "ContainmentArea_01_sand_F");
// The small storage area for resources.
KPLIBPRSTSETVAR("storageSmall", "ContainmentArea_02_sand_F");


/*------------------------------------------------------------
    --- ADDITIONAL MECHANICS CLASSNAMES ---
    Classnames of additional mechanics/functionalities in the mission.
    The entered classnames can be reused somewhere else in the preset.
------------------------------------------------------------*/

// These are the boats which spawn in the boat racks of the Liberty.
KPLIBPRSTSETVAR("addBoat", "B_Boat_Transport_01_F");
// These are the additional helicopter which spawns at the Operation Base.
KPLIBPRSTSETVAR("addHeli", "B_Heli_Light_01_F");
// These are the trucks which are used in the logistic convoy system.
KPLIBPRSTSETVAR("logiTruck", "B_Truck_01_transport_F");
// Static Mortar Classname
KPLIBPRSTSETVAR("mortar", "B_Mortar_01_F");
// Static AA Classname
KPLIBPRSTSETVAR("staticAa", "B_static_AA_F");
// Static Big AA Classname
KPLIBPRSTSETVAR("staticAaBig", "B_SAM_System_03_F");
// Static AT Classname
KPLIBPRSTSETVAR("staticAt", "B_static_AT_F");

/*------------------------------------------------------------
    --- REGULAR SOLDIER CLASSNAMES ---
    Classnames of the different regular soldier types.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// AA Specialist
KPLIBPRSTSETVAR("rsAntiAir", "B_soldier_AA_F");
// AT Specialist
KPLIBPRSTSETVAR("rsAntiTank", "B_soldier_AT_F");
// Autorifleman
KPLIBPRSTSETVAR("rsAutorifleMan", "B_soldier_AR_F");
// Helicopter crew
KPLIBPRSTSETVAR("rsCrewmanHeli", "B_helicrew_F");
// Vehicle crew
KPLIBPRSTSETVAR("rsCrewmanVeh", "B_crew_F");
// Engineer
KPLIBPRSTSETVAR("rsEngineer", "B_engineer_F");
// Grenadier
KPLIBPRSTSETVAR("rsGrenadier", "B_Soldier_GL_F");
// Heavy Gunner
KPLIBPRSTSETVAR("rsHeavyGunner", "B_HeavyGunner_F");
// Helicopter pilot
KPLIBPRSTSETVAR("rsPilotHeli", "B_Helipilot_F");
// Jet pilot
KPLIBPRSTSETVAR("rsPilotJet", "B_Fighter_Pilot_F");
// Light Anti Tank
KPLIBPRSTSETVAR("rsLightAt", "B_soldier_LAT_F");
// Marksman
KPLIBPRSTSETVAR("rsMarksman", "B_soldier_M_F");
// Medic
KPLIBPRSTSETVAR("rsMedic", "B_medic_F");
// Officer
KPLIBPRSTSETVAR("rsOfficer", "B_officer_F");
// Paratrooper
KPLIBPRSTSETVAR("rsParatrooper", "B_soldier_PG_F");
// Rifleman
KPLIBPRSTSETVAR("rsRifleman", "B_Soldier_F");
// Sharpshooter
KPLIBPRSTSETVAR("rsSharpshooter", "B_Sharpshooter_F");
// Squad Leader
KPLIBPRSTSETVAR("rsSquadLeader", "B_Soldier_SL_F");
// Survivor (no weapons, etc.)
KPLIBPRSTSETVAR("rsSurvivor", "B_Survivor_F");
// Team Leader
KPLIBPRSTSETVAR("rsTeamLeader", "B_Soldier_TL_F");


/*------------------------------------------------------------
    --- SPECIAL FORCES CLASSNAMES ---
    Classnames of the different special forces soldiers.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// Special Forces Diver
KPLIBPRSTSETVAR("sfDiver", "B_diver_F");
// Special Forces Explosive Specialist
KPLIBPRSTSETVAR("sfExplosive", "B_recon_exp_F");
// Special Forces Light Anti Tank
KPLIBPRSTSETVAR("sfLightAt", "B_recon_LAT_F");
// Special Forces Marksman
KPLIBPRSTSETVAR("sfMarksman", "B_recon_M_F");
// Special Forces Medic
KPLIBPRSTSETVAR("sfMedic", "B_recon_medic_F");
// Special Forces Rifleman
KPLIBPRSTSETVAR("sfRifleman", "B_recon_F");
// Special Forces Sharpshooter
KPLIBPRSTSETVAR("sfSharpshooter", "B_Recon_Sharpshooter_F");
// Special Forces Sniper
KPLIBPRSTSETVAR("sfSniper", "B_sniper_F");
// Special Forces Spotter
KPLIBPRSTSETVAR("sfSpotter", "B_spotter_F");
// Special Forces Teamleader
KPLIBPRSTSETVAR("sfTeamLeader", "B_recon_TL_F");


/*------------------------------------------------------------
    --- BUILDABLE OBJECTS ARRAYS ---
    The arrays below are used to determine what can be build.
    Format: "classname", supplies, ammunition, fuel
    Example: KPLIBPRSTARADD("lVeh", "B_MRAP_01_F", 100, 0, 50);
    The above example adds the NATO Hunter MRAP to the light vehicles list
    with the costs of 100 supplies, 0 ammunition and 50 fuel.
------------------------------------------------------------*/

// Infantry units
KPLIBPRSTARCREATE("soldiers");
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsRifleman"),             20,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsLightAt"),              30,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsGrenadier"),            25,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsAutorifleMan"),         25,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsHeavyGunner"),          35,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsMarksman"),             30,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsAntiTank"),             50,   10,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsAntiAir"),              50,   10,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsMedic"),                30,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsEngineer"),             30,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsParatrooper"),          20,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsCrewmanVeh"),           10,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsCrewmanHeli"),          10,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsPilotHeli"),            10,    0,   0);
KPLIBPRSTARADD("soldiers", KPLIBPRSTGETVAR("rsPilotJet"),             10,    0,   0);
KPLIBPRSTARPLAIN("soldiers", "soldiersPl");

// Special Forces units
KPLIBPRSTARCREATE("specOps");
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfRifleman"),              50,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfLightAt"),               80,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfMarksman"),              80,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfMedic"),                 80,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfExplosive"),             80,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfSpotter"),               80,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfSharpshooter"),          85,    0,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfSniper"),               100,   10,   0);
KPLIBPRSTARADD("specOps", KPLIBPRSTGETVAR("sfDiver"),                100,    0,   0);
KPLIBPRSTARPLAIN("specOps", "specOpsPl");

// Light vehicles
KPLIBPRSTARCREATE("lVeh");
KPLIBPRSTARADD("lVeh", "B_Quadbike_01_F",                             50,    0,  25);   // Quadbike
KPLIBPRSTARADD("lVeh", "B_LSV_01_unarmed_F",                          75,    0,  50);   // Prowler
KPLIBPRSTARADD("lVeh", "B_LSV_01_armed_F",                            75,   40,  50);   // Prowler (HMG)
KPLIBPRSTARADD("lVeh", "B_MRAP_01_F",                                100,    0,  50);   // Hunter
KPLIBPRSTARADD("lVeh", "B_MRAP_01_hmg_F",                            100,   40,  50);   // Hunter (HMG)
KPLIBPRSTARADD("lVeh", "B_MRAP_01_gmg_F",                            100,   60,  50);   // Hunter (GMG)
KPLIBPRSTARADD("lVeh", "B_Truck_01_transport_F",                     125,    0,  75);   // HEMTT Transport
KPLIBPRSTARADD("lVeh", "B_Truck_01_covered_F",                       125,    0,  75);   // HEMTT Transport (Covered)
KPLIBPRSTARADD("lVeh", "B_Boat_Transport_01_F",                      100,    0,  25);   // Assault Boat
KPLIBPRSTARADD("lVeh", "B_Boat_Armed_01_minigun_F",                  200,   80,  75);   // Speedboat with Minigun
KPLIBPRSTARADD("lVeh", "B_SDV_01_F",                                 150,    0,  50);   // SDV
KPLIBPRSTARPLAIN("lVeh", "lVehPl");

// Heavy vehicles
KPLIBPRSTARCREATE("hVeh");
KPLIBPRSTARADD("hVeh", "B_APC_Wheeled_01_cannon_F",                  200,   75, 125);    // AMV-7 Marshall
KPLIBPRSTARADD("hVeh", "B_APC_Tracked_01_rcws_F",                    300,  100, 150);    // IFV-6c Panther
KPLIBPRSTARADD("hVeh", "B_AFV_Wheeled_01_cannon_F",                  300,  250, 180);    // Rhino MGS
KPLIBPRSTARADD("hVeh", "B_AFV_Wheeled_01_up_cannon_F",               400,  300, 200);    // Rhino MGS UP
KPLIBPRSTARADD("hVeh", "B_MBT_01_cannon_F",                          400,  300, 200);    // M2A1 Slammer
KPLIBPRSTARADD("hVeh", "B_MBT_01_TUSK_F",                            500,  350, 225);    // M2A4 Slammer UP
KPLIBPRSTARPLAIN("hVeh", "hVehPl");

// Anti Air vehicles
KPLIBPRSTARCREATE("antiAir");
KPLIBPRSTARADD("antiAir", "B_APC_Tracked_01_AA_F",                   300,  250, 175);    // IFV-6a Cheetah
KPLIBPRSTARPLAIN("antiAir", "antiAirPl");

// Artillery vehicles
KPLIBPRSTARCREATE("arty");
KPLIBPRSTARADD("arty", KPLIBPRSTGETVAR("mortar"),                     80,  150,   0);    // Mk6 Mortar
KPLIBPRSTARADD("arty", "B_MBT_01_arty_F",                            600, 1250, 300);    // M4 Scorcher
KPLIBPRSTARADD("arty", "B_MBT_01_mlrs_F",                            800, 1750, 400);    // M5 Sandstorm MLRS
KPLIBPRSTARPLAIN("arty", "artyPl");

// Transport Helicopters
KPLIBPRSTARCREATE("heliTrans");
KPLIBPRSTARADD("heliTrans", "B_Heli_Light_01_F",                     200,    0, 100);    // MH-9 Hummingbird
KPLIBPRSTARADD("heliTrans", "B_Heli_Transport_01_F",                 250,   80, 150);    // UH-80 Ghost Hawk
KPLIBPRSTARADD("heliTrans", "B_Heli_Transport_01_camo_F",            250,   80, 150);    // UH-80 Ghost Hawk (Camo)
KPLIBPRSTARADD("heliTrans", "B_Heli_Transport_03_F",                 300,   80, 175);    // CH-67 Huron (Armed)
KPLIBPRSTARPLAIN("heliTrans", "heliTransPl");

// Attack Helicopters
KPLIBPRSTARCREATE("heliAttack");
KPLIBPRSTARADD("heliAttack", "B_Heli_Light_01_dynamicLoadout_F",     200,  100, 100);    // AH-9 Pawnee
KPLIBPRSTARADD("heliAttack", "B_Heli_Attack_01_dynamicLoadout_F",    500,  400, 200);    // AH-99 Blackfoot
KPLIBPRSTARPLAIN("heliAttack", "heliAttackPl");

// Transport Planes
KPLIBPRSTARCREATE("planeTrans");
KPLIBPRSTARADD("planeTrans", "B_T_VTOL_01_armed_F",                  750, 1500, 500);    // V-44 X Blackfish (Armed)
KPLIBPRSTARADD("planeTrans", "B_T_VTOL_01_infantry_F",               750,    0, 500);    // V-44 X Blackfish (Infantry)
KPLIBPRSTARADD("planeTrans", "B_T_VTOL_01_vehicle_F",                750,    0, 500);    // V-44 X Blackfish (Vehicle)
KPLIBPRSTARPLAIN("planeTrans", "planeTransPl");

// Jets
KPLIBPRSTARCREATE("jets");
KPLIBPRSTARADD("jets", "B_Plane_CAS_01_dynamicLoadout_F",           1000,  800, 400);    // A-164 Wipeout (CAS)
KPLIBPRSTARADD("jets", "B_Plane_Fighter_01_F",                      1500, 1750, 450);    // F/A-181 Black Wasp II
KPLIBPRSTARADD("jets", "B_Plane_Fighter_01_Stealth_F",              1500, 1750, 450);    // F/A-181 Black Wasp II (Stealth)
KPLIBPRSTARPLAIN("jets", "jetsPl");

// Static Defenses
KPLIBPRSTARCREATE("statics");
KPLIBPRSTARADD("statics", "B_HMG_01_F",                               25,   40,   0);    // Mk30A HMG .50
KPLIBPRSTARADD("statics", "B_HMG_01_high_F",                          25,   40,   0);    // Mk30 HMG .50 (Raised)
KPLIBPRSTARADD("statics", "B_GMG_01_F",                               35,   60,   0);    // Mk32A GMG 20mm
KPLIBPRSTARADD("statics", "B_GMG_01_high_F",                          35,   60,   0);    // Mk32 GMG 20mm (Raised)
KPLIBPRSTARADD("statics", KPLIBPRSTGETVAR("staticAa"),                50,  100,   0);    // Static Titan Launcher (AA)
KPLIBPRSTARADD("statics", KPLIBPRSTGETVAR("staticAaBig"),            100,  250,   0);    // MIM-145 Defender
KPLIBPRSTARADD("statics", KPLIBPRSTGETVAR("staticAt"),                50,  100,   0);    // Static Titan Launcher (AT)
KPLIBPRSTARPLAIN("statics", "staticsPl");

// Logistic vehicles and objects
KPLIBPRSTARCREATE("logistic");
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("arsenalBox"),           100,  200,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("respawnTruck"),         200,    0, 100);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("fobBox"),               300,  500,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("fobTruck"),             300,  500,  75);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("storageSmall"),           0,    0,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("storageLarge"),           0,    0,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("logiBuilding"),         250,    0,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("airBuilding"),         1000,    0,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("slotHeli"),             250,    0,   0);
KPLIBPRSTARADD("logistic",  KPLIBPRSTGETVAR("slotJet"),              500,    0,   0);
KPLIBPRSTARADD("logistic", "B_Radar_System_01_F",                    250,    0,   0);    // AN/MPQ-105 Radar
KPLIBPRSTARADD("logistic", "B_Truck_01_Repair_F",                    325,    0,  75);    // HEMTT Repair
KPLIBPRSTARADD("logistic", "B_Truck_01_fuel_F",                      125,    0, 275);    // HEMTT Fuel
KPLIBPRSTARADD("logistic", "B_Truck_01_ammo_F",                      125,  200,  75);    // HEMTT Ammo
KPLIBPRSTARADD("logistic", "B_Slingload_01_Repair_F",                275,    0,   0);    // Huron Repair Container
KPLIBPRSTARADD("logistic", "B_Slingload_01_Fuel_F",                   75,    0, 200);    // Huron Fuel Container
KPLIBPRSTARADD("logistic", "B_Slingload_01_Ammo_F",                   75,  200,   0);    // Huron Ammo Container
KPLIBPRSTARPLAIN("logistic", "logisticPl");

// Decorative Objects
KPLIBPRSTARCREATE("deco");
KPLIBPRSTARADD("deco", "Land_Cargo_House_V1_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Cargo_Patrol_V1_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Cargo_Tower_V1_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_NATO_F",                                  0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_US_F",                                    0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_UK_F",                                    0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_White_F",                                 0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Medevac_house_V1_F",                      0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Medevac_HQ_V1_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_RedCrystal_F",                            0,    0,   0);
KPLIBPRSTARADD("deco", "CamoNet_BLUFOR_F",                             0,    0,   0);
KPLIBPRSTARADD("deco", "CamoNet_BLUFOR_open_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "CamoNet_BLUFOR_big_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Land_PortableLight_single_F",                  0,    0,   0);
KPLIBPRSTARADD("deco", "Land_PortableLight_double_F",                  0,    0,   0);
KPLIBPRSTARADD("deco", "Land_LampSolar_F",                             0,    0,   0);
KPLIBPRSTARADD("deco", "Land_LampHalogen_F",                           0,    0,   0);
KPLIBPRSTARADD("deco", "Land_LampStreet_small_F",                      0,    0,   0);
KPLIBPRSTARADD("deco", "Land_LampAirport_F",                           0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HelipadCircle_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HelipadRescue_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "PortableHelipadLight_01_blue_F",               0,    0,   0);
KPLIBPRSTARADD("deco", "PortableHelipadLight_01_green_F",              0,    0,   0);
KPLIBPRSTARADD("deco", "PortableHelipadLight_01_red_F",                0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CampingChair_V1_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CampingChair_V2_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CampingTable_F",                          0,    0,   0);
KPLIBPRSTARADD("deco", "MapBoard_altis_F",                             0,    0,   0);
KPLIBPRSTARADD("deco", "MapBoard_stratis_F",                           0,    0,   0);
KPLIBPRSTARADD("deco", "MapBoard_seismic_F",                           0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Pallet_MilBoxes_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_PaperBox_open_empty_F",                   0,    0,   0);
KPLIBPRSTARADD("deco", "Land_PaperBox_open_full_F",                    0,    0,   0);
KPLIBPRSTARADD("deco", "Land_PaperBox_closed_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_DieselGroundPowerUnit_01_F",              0,    0,   0);
KPLIBPRSTARADD("deco", "Land_ToolTrolley_02_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Workbench_01_F",                          0,    0,   0);
KPLIBPRSTARADD("deco", "Land_GasTank_01_blue_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_GasTank_01_khaki_F",                      0,    0,   0);
KPLIBPRSTARADD("deco", "Land_GasTank_01_yellow_F",                     0,    0,   0);
KPLIBPRSTARADD("deco", "Land_GasTank_02_F",                            0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BarrelWater_F",                           0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BarrelWater_grey_F",                      0,    0,   0);
KPLIBPRSTARADD("deco", "Land_WaterBarrel_F",                           0,    0,   0);
KPLIBPRSTARADD("deco", "Land_WaterTank_F",                             0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagFence_Round_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagFence_Short_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagFence_Long_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagFence_Corner_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagFence_End_F",                          0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagBunker_Small_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagBunker_Large_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_BagBunker_Tower_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrier_1_F",                            0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrier_3_F",                            0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrier_5_F",                            0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrierWall4_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrierWall6_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrierWall_corner_F",                   0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrierWall_corridor_F",                 0,    0,   0);
KPLIBPRSTARADD("deco", "Land_HBarrierTower_F",                         0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CncBarrierMedium_F",                      0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CncBarrierMedium4_F",                     0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Concrete_SmallWall_4m_F",                 0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Concrete_SmallWall_8m_F",                 0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CncShelter_F",                            0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CncWall1_F",                              0,    0,   0);
KPLIBPRSTARADD("deco", "Land_CncWall4_F",                              0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Sign_WarningMilitaryArea_F",              0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Sign_WarningMilAreaSmall_F",              0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Sign_WarningMilitaryVehicles_F",          0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Razorwire_F",                             0,    0,   0);
KPLIBPRSTARPLAIN("deco", "decoPl");
