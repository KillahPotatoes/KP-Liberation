/*
    KP LIBERATION CONFIG FILE

    File: KPLIB_config.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Contains all settings which are meant to be adjustable by players but aren't implemented in the mission parameters (and won't be).
*/

/*------------------------------------------------------------
    --- PRESET SETTINGS ---
    Select here the provided premade presets you would like to use for each faction.
    If you want to edit or adjust a preset, it's recommended to set the specific presets to 0 and edit the appropriate custom.sqf file in the preset folder.
------------------------------------------------------------



/*------------------------------------------------------------
    --- BLACKLIST SETTINGS ---
    Array for the general blacklist and for items which are blocked and shouldn't be blocked (mostly generated classnames).
    Useless if you're using anything other than "KPLIB_preset_arsenal = 0;" above.
    A whitelisted arsenal is always more performance friendly then a blacklisted arsenal.
    REMEMBER: All static turret and UAV bags should be defined here, to stop players from exploiting free resources via the virtual arsenal.
------------------------------------------------------------



/*------------------------------------------------------------
    --- SAVE SETTINGS ---
    Settings concerning the internal save system.
------------------------------------------------------------



/*------------------------------------------------------------
    --- RANGES AND HEIGHTS ---
    All values in meters.
------------------------------------------------------------

// Radio Tower scanning radius.
KPLIB_range_radiotower = 2500;
// Altitude in metres for the HALO jump.
KPLIB_halo_altitude = 2500;

/*------------------------------------------------------------
    --- SECONDARY MISSION SETTINGS ---
    Settings which are connected to the available secondary missions which can be started by players via the secondary mission dialog.
------------------------------------------------------------

// Intel price for the secondary missions [FOB hunting, Convoy ambush, SAR].
KPLIB_secondary_costs = [15,10,8];
// The percentage impact against enemy combat readiness for a successful FOB hunt (1.0 = 100%).
KPLIB_secondary_impact = 0.6;

/*------------------------------------------------------------
    --- FUEL CONSUMPTION SETTINGS ---
    Values for the KP Fuel Consumption Script.
------------------------------------------------------------

//Time in minutes till a full tank depletes whilst the vehicle is standing still with a running engine.
KPLIB_fuel_neutral = 180;
// Time in minutes till a full tank depletes whilst the vehicle is driving below max speed.
KPLIB_fuel_normal = 90;
// Time in minutes till a full tank depletes whilst the vehicle is driving at max speed.
KPLIB_fuel_max = 45;

/*------------------------------------------------------------
    --- CAP SETTINGS ---
    Caps for different groups/mechanics.
------------------------------------------------------------


/*------------------------------------------------------------
    --- CIVIL REPUTATION SETTINGS ---
    Values connected to the civil reputation system.
------------------------------------------------------------

// Civil Reputation penalty for killing a civilian.
KPLIB_civrep_killPenalty = 5;
// Civil Reputation penalty for destroying/damaging a building.
KPLIB_civrep_buildingPenalty = 3;
// Civil Reputation penalty for stealing a civilian vehicle.
KPLIB_civrep_vehiclePenalty = 2;
// Civil Reputation penalty for killing a friendly resistance soldier.
KPLIB_civrep_resistancePenalty = 3;
// Civil Reputation gain for liberating a sector.
KPLIB_civrep_sectorGain = 5;
// Chance (0-100) that there are wounded civilians right after capturing a sector.
KPLIB_civrep_woundedChance = 35;
// Civil Reputation gain for providing medical assistance for wounded civilians.
KPLIB_civrep_woundedGain = 2;

// Civil Informant minimum spawn time (seconds).
KPLIB_civinfo_min = 5400;
// Civil Informant maximum spawn time (seconds).
KPLIB_civinfo_max = 10800;
// Civil Informant spawn chance (0-100).
KPLIB_civinfo_chance = 75;
// Civil Informant intel gain amount.
KPLIB_civinfo_intel = 5;
// Civil Informant staytime until despawning (seconds).
KPLIB_civinfo_duration = 1200;
// Chance (0-100) that the delivered informant will spawn a time critical task.
KPLIB_civinfo_taskChance = 40;
// Duration until the task will despawn if no player is near (seconds).
KPLIB_civinfo_taskDuration = 900;

// Building classnames which should be ignored for the destroyed/damaged buildings check for the civil reputation.
KPLIB_civrep_ignoredBuildings = [
    "Land_LampStreet_small_F",
    "Land_PowerPoleWooden_L_F",
    "Land_LampShabby_F",
    "Land_SlideCastle_F",
    "Land_Carousel_01_F",
    "Land_LampDecor_F",
    "Land_LampStreet_F",
    "Land_LampHalogen_F",
    "Land_LampSolar_F",
    "Land_LampHarbour_F",
    "Land_HighVoltageColumnWire_F",
    "Land_HighVoltageColumn_F",
    "Land_fs_feed_F",
    "Land_PowerWireBig_left_F",
    "Land_runway_edgelight_blue_F",
    "Land_LampAirport_off_F",
    "Land_Flush_Light_green_F",
    "Land_LampAirport_F",
    "Land_PierLadder_F"
];

/*------------------------------------------------------------
    --- ASYMMETRIC WARFARE SETTINGS ---
    Values connected to the asymmetric warfare / resistance system.
------------------------------------------------------------

// At which strength (0-100) the resistance forces will be at tier 2.
KPLIB_resistance_tier2 = 30;
// At which strength (0-100) the resistance forces will be at tier 3.
KPLIB_resistance_tier3 = 70;
// Chance that a resistance unit has a RPG (tier 2 and 3).
KPLIB_resistance_atChance = 20;
// Chance that a logistic convoy will be ambushed, when civil reputation is low.
KPLIB_resistance_convoyAmbushChance = 2;
// Duration of the convoy ambush event (seconds).
KPLIB_resistance_convoyAmbushDuration = 1200;
// Chance that a resistance squad will join an ongoing sector attack.
KPLIB_resistance_sectorChance = 35;
// Chance that some resistance units will spawn in Blufor sectors for an ambush, if reputation is low.
KPLIB_resistance_ambushChance = 30;

/*------------------------------------------------------------
    --- ACE RELATED SETTINGS ---
    Special settings which are only affect the game if you run ACE.
------------------------------------------------------------

// Vehicle classnames which also function as ACE medical vehicles.
KPLIB_ace_medVehicles = [
    "B_Truck_01_medical_F",
    "B_T_Truck_01_medical_F",
    "rhsusf_m113_usarmy_medical",
    "rhsusf_m113d_usarmy_medical",
    "RHS_UH60M_MEV2",
    "RHS_UH60M_MEV2_d",
    "rhsusf_M1230a1_usarmy_d",
    "rhsusf_M1230a1_usarmy_wd"
];

// Classnames of ACE3 crates (which have to be in the unit preset as well).
KPLIB_ace_crates = [
    "ACE_Box_82mm_Mo_HE",
    "ACE_Box_82mm_Mo_Smoke",
    "ACE_Box_82mm_Mo_Illum",
    "ACE_medicalSupplyCrate_advanced"
];

/*------------------------------------------------------------
    --- TRANSPORT AND STORAGE SETTINGS ---
    Transport vehicle and storage area offset configurations.
------------------------------------------------------------


/*------------------------------------------------------------
    --- RESUPPLY SETTINGS ---
    Arrays with classnames for the Liberation resupply script.
------------------------------------------------------------



/*------------------------------------------------------------
    --- MISC SETTINGS ---
    Single values, so they aren't grouped in a category.
------------------------------------------------------------

// Percentage of resources you get back from recycling.
KPLIB_recycle_percentage = 0.5;
// Time in minutes until a production process is finished, when resources multiplier is set to 1. Value is affected by resource multiplier afterwards.
KPLIB_prod_interval = 30;
// Multiplier for defenders in buildings.
KPLIB_defended_buildingpos_part = 0.4;
// Size of enemy battlegroups.
KPLIB_battlegroup_size = 6;
// Time in seconds how long a captured sector is vulnerable to enemy troops.
KPLIB_vulnerability_timer = 1200;
// Chance that enemy infantry will surrender after heavy losses are encountered.
KPLIB_surrender_chance = 80;
// Civilian count multiplier.
KPLIB_civilians_amount = 10;
// Time in seconds until an enemy sector will be deactivated after there are no blufor units near.
KPLIB_sectors_stayActiveTime = 300;

// Classnames of objects which should be ignored when building.
KPLIB_build_ignored_classnames = [
    "Land_HelipadSquare_F",
    "Land_TentHangar_V1_F",
    "Land_runway_edgelight",
    "Land_runway_edgelight_blue_F",
    "Land_Flush_Light_green_F",
    "Land_Flush_Light_red_F",
    "Land_Flush_Light_yellow_F",
    "TMR_Autorest_Georef",
    "Flag_NATO_F",
    "Flag_White_F",
    "Flag_RedCrystal_F",
    "CamoNet_BLUFOR_F",
    "CamoNet_BLUFOR_open_F",
    "CamoNet_BLUFOR_big_F",
    "Land_PortableLight_single_F",
    "Land_PortableLight_double_F",
    "Land_HelipadCircle_F",
    "Land_HelipadRescue_F",
    "PortableHelipadLight_01_blue_F",
    "PortableHelipadLight_01_green_F",
    "PortableHelipadLight_01_red_F",
    "Land_BagFence_Round_F",
    "Land_BagFence_Short_F",
    "Land_BagFence_Long_F",
    "Land_BagFence_Corner_F",
    "Land_BagFence_End_F",
    "Land_Sign_WarningMilitaryArea_F",
    "Land_Sign_WarningMilAreaSmall_F",
    "Land_Sign_WarningMilitaryVehicles_F",
    "Land_Razorwire_F",
    "Sign_Sphere100cm_F",
    "Land_ClutterCutter_large_F",
    "Land_HighVoltageColumnWire_F",
    "Land_PowerWireBig_left_F",
    "B_HMG_01_F",                                       //Mk30A HMG .50
    "B_HMG_01_high_F",                                  //Mk30 HMG .50 (Raised)
    "B_HMG_01_A_F",                                     //Mk30 HMG .50 (Autonomous)
    "B_GMG_01_F",                                       //Mk32A GMG 20mm
    "B_GMG_01_high_F",                                  //Mk32 GMG 20mm (Raised)
    "B_GMG_01_A_F",                                     //Mk32 GMG 20mm (Autonomous)
    "B_static_AT_F",                                    //Static Titan Launcher (AT)
    "B_static_AA_F",                                    //Static Titan Launcher (AA)
    "B_Mortar_01_F",                                    //Mk6 Mortar
    "ACE_friesAnchorBar",                               //ACE FRIES
    "ACE_friesGantryReverse",                           //ACE FRIES
    "ACE_friesGantry"                                   //ACE FRIES
];

// Classnames of boats, so they can be built on water.
KPLIB_build_boats = [
    "B_Boat_Transport_01_F",
    "B_Boat_Armed_01_minigun_F",
    "B_T_Boat_Transport_01_F",
    "B_T_Boat_Armed_01_minigun_F",
    "B_SDV_01_F",
    "O_Boat_Transport_01_F",
    "O_Boat_Armed_01_hmg_F",
    "O_T_Boat_Transport_01_F",
    "O_T_Boat_Armed_01_hmg_F",
    "rhsusf_mkvsoc"
];

-------------------------------
    !!! DO NOT EDIT BELOW !!!
-------------------------------

// Value adjustments
if (KPLIB_cap_blufor > 100) then {KPLIB_cap_blufor = 100};
KPLIB_prod_interval = ceil (KPLIB_prod_interval / KPLIB_param_resMulti);
KPLIB_battlegroup_size = KPLIB_battlegroup_size * (sqrt KPLIB_param_unitcap) * (sqrt KPLIB_param_aggressivity);
KPLIB_civilians_amount = KPLIB_civilians_amount    * KPLIB_param_civilians;
KPLIB_cap_blufor = KPLIB_cap_blufor * KPLIB_param_unitcap;
KPLIB_cap_sector = KPLIB_cap_sector * KPLIB_param_unitcap;
KPLIB_cap_battlegroup = KPLIB_cap_battlegroup * KPLIB_param_unitcap;
KPLIB_cap_patrol = KPLIB_cap_patrol * KPLIB_param_unitcap;
*/
