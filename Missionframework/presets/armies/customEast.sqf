/*
    KP Liberation Custom East Side Preset

    File: customEast.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-24
    Last Update: 2018-11-24
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
KPLIBPRSTSETVAR("color", "ColorEast");
// Color for this side (active)
KPLIBPRSTSETVAR("colorAct", "ColorRed");
// Name of the used/created army in this preset
KPLIBPRSTSETVAR("name", "Custom East Army");
// Side for this preset
KPLIBPRSTSETVAR("side", east);
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
KPLIBPRSTSETVAR("arsenalBox", "O_supplyCrate_F");
// This defines the ammunition resource crates.
KPLIBPRSTSETVAR("crateAmmo", "O_CargoNet_01_ammo_F");
// This defines the fuel resource crates.
KPLIBPRSTSETVAR("crateFuel", "CargoNet_01_barrels_F");
// This defines the supply resource crates.
KPLIBPRSTSETVAR("crateSupply", "CargoNet_01_box_F");
// This is the FOB as a container.
KPLIBPRSTSETVAR("fobBox", "Land_Pod_Heli_Transport_04_box_F");
// This is the main FOB HQ building.
KPLIBPRSTSETVAR("fobBuilding", "Land_Cargo_HQ_V1_F");
// This is the FOB as a vehicle..
KPLIBPRSTSETVAR("fobTruck", "O_Truck_03_device_F");
// The building defined to unlock FOB logistic functionalities.
KPLIBPRSTSETVAR("logiBuilding", "Land_RepairDepot_01_tan_F");
// This is Potato 01, a multipurpose mobile respawn as a helicopter.
KPLIBPRSTSETVAR("potato", "O_Heli_Transport_04_covered_F");
// This is the mobile respawn (and medical) truck.
KPLIBPRSTSETVAR("respawnTruck", "O_Truck_03_medical_F");
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
KPLIBPRSTSETVAR("addBoat", "O_Boat_Transport_01_F");
// These are the additional helicopter which spawns at the Operation Base.
KPLIBPRSTSETVAR("addHeli", "B_Heli_Light_01_F");
// These are the trucks which are used in the logistic convoy system.
KPLIBPRSTSETVAR("logiTruck", "O_Truck_03_transport_F");
// Static Mortar Classname
KPLIBPRSTSETVAR("mortar", "O_Mortar_01_F");
// Static AA Classname
KPLIBPRSTSETVAR("staticAa", "O_static_AA_F");
// Static Big AA Classname
KPLIBPRSTSETVAR("staticAaBig", "O_SAM_System_04_F");
// Static AT Classname
KPLIBPRSTSETVAR("staticAt", "O_static_AT_F");

/*------------------------------------------------------------
    --- REGULAR SOLDIER CLASSNAMES ---
    Classnames of the different regular soldier types.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// AA Specialist
KPLIBPRSTSETVAR("rsAntiAir", "O_Soldier_AA_F");
// AT Specialist
KPLIBPRSTSETVAR("rsAntiTank", "O_Soldier_AT_F");
// Autorifleman
KPLIBPRSTSETVAR("rsAutorifleMan", "O_Soldier_AR_F");
// Helicopter crew
KPLIBPRSTSETVAR("rsCrewmanHeli", "O_helicrew_F");
// Vehicle crew
KPLIBPRSTSETVAR("rsCrewmanVeh", "O_crew_F");
// Engineer
KPLIBPRSTSETVAR("rsEngineer", "O_engineer_F");
// Grenadier
KPLIBPRSTSETVAR("rsGrenadier", "O_Soldier_GL_F");
// Heavy Gunner
KPLIBPRSTSETVAR("rsHeavyGunner", "O_HeavyGunner_F");
// Helicopter pilot
KPLIBPRSTSETVAR("rsPilotHeli", "O_helipilot_F");
// Jet pilot
KPLIBPRSTSETVAR("rsPilotJet", "O_Fighter_Pilot_F");
// Light Anti Tank
KPLIBPRSTSETVAR("rsLightAt", "O_Soldier_LAT_F");
// Marksman
KPLIBPRSTSETVAR("rsMarksman", "O_soldier_M_F");
// Medic
KPLIBPRSTSETVAR("rsMedic", "O_medic_F");
// Officer
KPLIBPRSTSETVAR("rsOfficer", "O_officer_F");
// Paratrooper
KPLIBPRSTSETVAR("rsParatrooper", "O_soldier_PG_F");
// Rifleman
KPLIBPRSTSETVAR("rsRifleman", "O_Soldier_F");
// Sharpshooter
KPLIBPRSTSETVAR("rsSharpshooter", "O_Sharpshooter_F");
// Squad Leader
KPLIBPRSTSETVAR("rsSquadLeader", "O_Soldier_SL_F");
// Survivor (no weapons, etc.)
KPLIBPRSTSETVAR("rsSurvivor", "O_Survivor_F");
// Team Leader
KPLIBPRSTSETVAR("rsTeamLeader", "O_Soldier_TL_F");


/*------------------------------------------------------------
    --- SPECIAL FORCES CLASSNAMES ---
    Classnames of the different special forces soldiers.
    Every variable needs a valid classname. Duplicates are fine.
------------------------------------------------------------*/

// Special Forces Diver
KPLIBPRSTSETVAR("sfDiver", "O_diver_F");
// Special Forces Explosive Specialist
KPLIBPRSTSETVAR("sfExplosive", "O_V_Soldier_Exp_hex_F");
// Special Forces Light Anti Tank
KPLIBPRSTSETVAR("sfLightAt", "O_V_Soldier_LAT_hex_F");
// Special Forces Marksman
KPLIBPRSTSETVAR("sfMarksman", "O_V_Soldier_M_hex_F");
// Special Forces Medic
KPLIBPRSTSETVAR("sfMedic", "O_V_Soldier_Medic_hex_F");
// Special Forces Rifleman
KPLIBPRSTSETVAR("sfRifleman", "O_V_Soldier_hex_F");
// Special Forces Sharpshooter
KPLIBPRSTSETVAR("sfSharpshooter", "O_Pathfinder_F");
// Special Forces Sniper
KPLIBPRSTSETVAR("sfSniper", "O_sniper_F");
// Special Forces Spotter
KPLIBPRSTSETVAR("sfSpotter", "O_spotter_F");
// Special Forces Teamleader
KPLIBPRSTSETVAR("sfTeamLeader", "O_V_Soldier_TL_hex_F");


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
KPLIBPRSTARADD("lVeh", "O_Quadbike_01_F",                             50,    0,  25);   // Quadbike
KPLIBPRSTARADD("lVeh", "O_LSV_02_unarmed_F",                          75,    0,  50);   // Qilin
KPLIBPRSTARADD("lVeh", "O_LSV_02_armed_F",                            75,   40,  50);   // Qilin (HMG)
KPLIBPRSTARADD("lVeh", "O_LSV_02_AT_F",                               75,   50,  50);   // Qilin (AT)
KPLIBPRSTARADD("lVeh", "O_MRAP_02_F",                                100,    0,  50);   // Ifrit
KPLIBPRSTARADD("lVeh", "O_MRAP_02_hmg_F",                            100,   40,  50);   // Ifrit (HMG)
KPLIBPRSTARADD("lVeh", "O_MRAP_02_gmg_F",                            100,   60,  50);   // Ifrit (GMG)
KPLIBPRSTARPLAIN("lVeh", "lVehPl");

// Transport trucks
KPLIBPRSTARCREATE("transports");
KPLIBPRSTARADD("transports", "O_Truck_03_transport_F",               125,    0,  75);   // Tempest Transport
KPLIBPRSTARADD("transports", "O_Truck_03_covered_F",                 125,    0,  75);   // Tempest Transport (Covered)
KPLIBPRSTARPLAIN("transports", "transportsPl");

// Boats
KPLIBPRSTARCREATE("boats");
KPLIBPRSTARADD("boats", "O_Boat_Transport_01_F",                     100,    0,  25);   // Assault Boat
KPLIBPRSTARADD("boats", "O_Boat_Armed_01_hmg_F",                     200,   80,  75);   // Speedboat with Minigun
KPLIBPRSTARADD("boats", "O_SDV_01_F",                                150,    0,  50);   // SDV
KPLIBPRSTARPLAIN("boats", "boatsPl");

// Heavy vehicles
KPLIBPRSTARCREATE("hVeh");
KPLIBPRSTARADD("hVeh", "O_APC_Wheeled_02_rcws_v2_F",                 200,   75, 125);    // MSE-3 Marid
KPLIBPRSTARADD("hVeh", "O_APC_Tracked_02_cannon_F",                  300,  100, 150);    // BTR-K Kamysh
KPLIBPRSTARADD("hVeh", "O_MBT_02_cannon_F",                          300,  250, 180);    // T-100 Varsuk
KPLIBPRSTARADD("hVeh", "O_MBT_04_cannon_F",                          400,  300, 200);    // T-140 Angara
KPLIBPRSTARADD("hVeh", "O_MBT_04_command_F",                         500,  350, 225);    // T-140K Angara
KPLIBPRSTARPLAIN("hVeh", "hVehPl");

// Anti Air vehicles
KPLIBPRSTARCREATE("antiAir");
KPLIBPRSTARADD("antiAir", "O_APC_Tracked_02_AA_F",                   300,  250, 175);    // ZSU-39 Tigris
KPLIBPRSTARPLAIN("antiAir", "antiAirPl");

// Artillery vehicles
KPLIBPRSTARCREATE("arty");
KPLIBPRSTARADD("arty", KPLIBPRSTGETVAR("mortar"),                     80,  150,   0);    // Mk6 Mortar
KPLIBPRSTARADD("arty", "O_MBT_02_arty_F",                            600, 1250, 300);    // 2S9 Sochor
KPLIBPRSTARPLAIN("arty", "artyPl");

// Transport Helicopters
KPLIBPRSTARCREATE("heliTrans");
KPLIBPRSTARADD("heliTrans", "B_Heli_Light_01_F",                     200,    0, 100);    // MH-9 Hummingbird
KPLIBPRSTARADD("heliTrans", "O_Heli_Light_02_unarmed_F",             250,    0, 150);    // PO-30 Orca (unarmed)
KPLIBPRSTARADD("heliTrans", "O_Heli_Transport_04_bench_F",           300,    0, 175);    // Mi-290 Taru (Bench)
KPLIBPRSTARPLAIN("heliTrans", "heliTransPl");

// Attack Helicopters
KPLIBPRSTARCREATE("heliAttack");
KPLIBPRSTARADD("heliAttack", "O_Heli_Light_02_dynamicLoadout_F",     250,  100, 150);    // PO-30 Orca
KPLIBPRSTARADD("heliAttack", "O_Heli_Attack_02_dynamicLoadout_F",    500,  400, 200);    // Mi-48 Kajman
KPLIBPRSTARPLAIN("heliAttack", "heliAttackPl");

// Transport Planes
KPLIBPRSTARCREATE("planeTrans");
KPLIBPRSTARADD("planeTrans", "O_T_VTOL_02_infantry_dynamicLoadout_F",750, 1000, 500);    // Y-32 Xi'an (Infantry)
KPLIBPRSTARADD("planeTrans", "O_T_VTOL_02_vehicle_dynamicLoadout_F", 750, 1000, 500);    // Y-32 Xi'an (Vehicle)
KPLIBPRSTARPLAIN("planeTrans", "planeTransPl");

// Jets
KPLIBPRSTARCREATE("jets");
KPLIBPRSTARADD("jets", "O_Plane_CAS_02_dynamicLoadout_F",           1000,  800, 400);    // To-199 Neophron
KPLIBPRSTARADD("jets", "O_Plane_Fighter_02_F",                      1500, 1750, 450);    // To-201 Shikra
KPLIBPRSTARADD("jets", "O_Plane_Fighter_02_Stealth_F",              1500, 1750, 450);    // To-201 Shikra (Stealth)
KPLIBPRSTARPLAIN("jets", "jetsPl");

// Static Defenses
KPLIBPRSTARCREATE("statics");
KPLIBPRSTARADD("statics", "O_HMG_01_F",                               25,   40,   0);    // Mk30 HMG .50
KPLIBPRSTARADD("statics", "O_HMG_01_high_F",                          25,   40,   0);    // Mk30 HMG .50 (Raised)
KPLIBPRSTARADD("statics", "O_GMG_01_F",                               35,   60,   0);    // Mk32 GMG 20mm
KPLIBPRSTARADD("statics", "O_GMG_01_high_F",                          35,   60,   0);    // Mk32 GMG 20mm (Raised)
KPLIBPRSTARADD("statics", KPLIBPRSTGETVAR("staticAa"),                50,  100,   0);    // Static Titan Launcher (AA)
KPLIBPRSTARADD("statics", KPLIBPRSTGETVAR("staticAaBig"),            100,  250,   0);    // S-750 Rhea
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
KPLIBPRSTARADD("logistic", "O_Radar_System_02_F",                    250,    0,   0);    // R-750 Cronus Radar
KPLIBPRSTARADD("logistic", "O_Truck_03_repair_F",                    325,    0,  75);    // Tempest Repair
KPLIBPRSTARADD("logistic", "O_Truck_03_fuel_F",                      125,    0, 275);    // Tempest Fuel
KPLIBPRSTARADD("logistic", "O_Truck_03_ammo_F",                      125,  200,  75);    // Tempest Ammo
KPLIBPRSTARADD("logistic", "Land_Pod_Heli_Transport_04_repair_F",    275,    0,   0);    // Taru Repair Container
KPLIBPRSTARADD("logistic", "Land_Pod_Heli_Transport_04_fuel_F",       75,    0, 200);    // Taru Fuel Container
KPLIBPRSTARADD("logistic", "Land_Pod_Heli_Transport_04_ammo_F",       75,  200,   0);    // Taru Ammo Container
KPLIBPRSTARPLAIN("logistic", "logisticPl");

// Decorative Objects
KPLIBPRSTARCREATE("deco");
KPLIBPRSTARADD("deco", "Land_Cargo_House_V1_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Cargo_Patrol_V1_F",                       0,    0,   0);
KPLIBPRSTARADD("deco", "Land_Cargo_Tower_V1_F",                        0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_CSAT_F",                                  0,    0,   0);
KPLIBPRSTARADD("deco", "Flag_Viper_F",                                 0,    0,   0);
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
