/*
    File: KPLIB_config.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2020-05-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Contains all settings which are meant to be adjustable by players.
*/


/*
------------------------------------------------------------
    --- PRESET SETTINGS ---
    If you want to change a preset, it's recommended to
    set all four presets to 0 and edit the appropriate
    custom.sqf files in the preset folders.
------------------------------------------------------------
*/

/*
    ----- Playerside preset -----
    0  = Custom (default vanilla with many optional mods supported)
    1  = Apex Tanoa (apex vanilla with many optional mods supported)
    2  = 3cb BAF (MTP)
    3  = 3cb BAF (Desert)
    4  = BWMod Bundeswehr (Flecktarn)
    5  = BWMod Bundeswehr (Tropentarn)
    6  = RHS USAF (Woodland)
    7  = RHS USAF (Desert)
    8  = RHS AFRF (VDV/MSV)
    9  = Germany West (Global Mobilization)
    10 = Germany West Winter (Global Mobilization)
    11 = Germany East (Global Mobilization)
    12 = Germany East Winter (Global Mobilization)
    13 = CSAT Brown
    14 = CSAT Green
    15 = Unsung US
    16 = CUP British Armed Forces (Desert)
    17 = CUP British Armed Forces (Woodland)
    18 = CUP US Marine Corps (Desert)
    19 = CUP US Marine Corps (Woodland)
    20 = CUP US Army (Desert)
    21 = CUP US Army (Woodland)
    22 = CUP Chernarus Defense Force
    23 = CUP Army of the Czech Republic (Desert)
    24 = CUP Army of the Czech Republic (Woodland)
    25 = CUP Chernarussian Movement of the Red Star
    26 = CUP Sahrani Liberation Army
    27 = CUP Takistani Army
    28 = SFP (Woodland)
    29 = SFP (Desert)
    30 = LDF (Contact DLC)
*/
KP_liberation_preset_blufor = 0;

/*
    ----- Enemy preset -----
    0  = Custom (default vanilla CSAT)
    1  = Apex Tanoa (apex vanilla CSAT)
    2  = RHS AFRF (EMR/MSV)
    3  = Project OPFOR (Takistan)
    4  = Project OPFOR (Islamic State)
    5  = Project OPFOR (Sahrani)
    6  = AAF
    7  = NATO
    8  = Germany West (Global Mobilization)
    9  = Germany West Winter (Global Mobilization)
    10 = Germany East (Global Mobilization)
    11 = Germany East Winter (Global Mobilization)
    12 = Unsung NVA
    13 = CUP Sahrani Liberation Army
    14 = CUP Takistani Army
    15 = CUP Chernarussian Movement of the Red Star
    16 = CUP Armed Forces of the Russian Federation (MSV - EMR)
    17 = CUP Armed Forces of the Russian Federation (Modern MSV)
    18 = CUP Chernarus Defense Force
    19 = CUP British Armed Forces (Desert)
    20 = CUP British Armed Forces (Woodland)
*/
KP_liberation_preset_opfor = 0;

/*
    ----- Resistance preset -----
    0  = Custom (default vanilla FIA)
    1  = Apex Tanoa (apex vanilla Syndikat)
    2  = RHS GREF
    3  = Project OPFOR (Middle Eastern)
    4  = Project OPFOR (Sahrani)
    5  = Germany (Global Mobilization)
    6  = Unsung
    7  = CUP Takistani Locals
    8  = CUP National Party of Chernarus
*/
KP_liberation_preset_resistance = 0;

/*
    ----- Civilians preset -----
    0  = Custom (default vanilla)
    1  = Apex Tanoa (apex vanilla)
    2  = Project OPFOR (Middle Eastern)
    3  = RDS Civilians
    4  = Germany (Global Mobilization)
    5  = Unsung
    6  = CUP Takistani Civilians
    7  = CUP Chernarussian Civilians
*/
KP_liberation_preset_civilians = 0;

/*
    ----- Arsenal preset -----
    0  = Use the default blacklist method (defined below)
    1  = Custom arsenal preset (custom.sqf in the arsenal_presets\ folder)
    2  = RHS USAF arsenal preset
    3  = 3cbBAF and RHS USAF arsenal preset
    4  = GM West arsenal preset
    5  = GM East arsenal preset
    6  = CSAT arsenal preset
    7  = Unsung US arsenal preset
    8  = SFP arsenal preset
    9  = BWMod arsenal preset
*/
KP_liberation_arsenal = 0;


/*
------------------------------------------------------------
    --- SIDE SETTINGS ---
    Sides of each faction. In basically any cases this
    doesn't need to be tweaked, even if using e.g. the
    CSAT preset for the players.
------------------------------------------------------------
*/

// Player side.
GRLIB_side_friendly = WEST;

// Enemy side.
GRLIB_side_enemy = EAST;

// Resistance side.
GRLIB_side_resistance = RESISTANCE;

// Civilian side.
GRLIB_side_civilian = CIVILIAN;

// Friendly sector marker color.
GRLIB_color_friendly = "ColorBLUFOR";

// Enemy sector marker color.
GRLIB_color_enemy = "ColorOPFOR";

// Enemy sector marker color. (activated)
GRLIB_color_enemy_bright = "ColorRED";


/*
------------------------------------------------------------
    --- SAVE SETTINGS ---
    Settings concerning the internal save system.
------------------------------------------------------------
*/

// Name of the save data variable inside of the [ServerProfileName].vars.Arma3Profile file.
GRLIB_save_key = "KP_LIBERATION_" + (toUpper worldName) + "_SAVEGAME";

// Name of the parameter save data variable inside of the [ServerProfileName].vars.Arma3Profile file.
KPLIB_paramSaveKey = "KP_LIBERATION_" + (toUpper worldName) + "_SAVE_PARAMS";

// Interval in seconds for automatic save.
KP_liberation_save_interval = 60;


/*
------------------------------------------------------------
    --- RANGES AND HEIGHTS ---
    All values in meters.
------------------------------------------------------------
*/

// Build range around the main FOB building.
GRLIB_fob_range = 125;

// Altitude in metres for the HALO jump.
GRLIB_halo_altitude = 2500;

// Range to activate a sector.
GRLIB_sector_size = 1000;

// Range to capture a sector.
GRLIB_capture_size = 175;

// Radio Tower scanning range.
GRLIB_radiotower_size = 2500;


/*
------------------------------------------------------------
    --- CAP SETTINGS ---
    Maximum amounts/values for different mechanics.
------------------------------------------------------------
*/

// Cap for BLUFOR.
GRLIB_blufor_cap = 100;

// Cap for sector defenders.
GRLIB_sector_cap = 180;

// Cap for enemy battlegroups.
GRLIB_battlegroup_cap = 150;

// Cap for enemy patrols.
GRLIB_patrol_cap = 150;

// Size of enemy battlegroups.
GRLIB_battlegroup_size = 6;

// Cap for civilian vehicles traveling between sectors.
GRLIB_civilians_amount = 10;


/*
------------------------------------------------------------
    --- CIVIL REPUTATION SETTINGS ---
    Values connected to the civil reputation system.
------------------------------------------------------------
*/

// Civil Reputation penalty for killing a civilian.
KP_liberation_cr_kill_penalty = 5;

// Civil Reputation penalty for destroying/damaging a building.
KP_liberation_cr_building_penalty = 3;

// Civil Reputation penalty for stealing a civilian vehicle.
KP_liberation_cr_vehicle_penalty = 2;

// Civil Reputation penalty for killing a friendly resistance soldier.
KP_liberation_cr_resistance_penalty = 3;

// Civil Reputation gain for liberate a sector.
KP_liberation_cr_sector_gain = 5;

// Chance (0-100) that there are wounded civilians right after capturing a sector.
KP_liberation_cr_wounded_chance = 35;

// Civil Reputation gain for providing medical assistance for wounded civilians.
KP_liberation_cr_wounded_gain = 2;


/*
------------------------------------------------------------
    --- SECONDARY MISSION SETTINGS ---
    Settings which are connected to the available
    secondary missions which can be started by players
    via the secondary mission dialog or happen
    randomly.
------------------------------------------------------------
*/

// Intel price for the secondary missions. [FOB hunting, Convoy ambush, SAR]
GRLIB_secondary_missions_costs = [15, 10, 8];

// Proportionate reduction of the actual (!) enemy combat readiness for a successful FOB hunt. (e.g. 0.4 -> reduction of 24 by an actual value of 60)
GRLIB_secondary_objective_impact = 0.4;

// Minimum time until a civil Informant can spawn. (seconds)
KP_liberation_civinfo_min = 5400;

// Maximum time until a civil Informant spawns. (seconds)
KP_liberation_civinfo_max = 10800;

// Civil Informant spawn chance. (0-100)
KP_liberation_civinfo_chance = 75;

// Intel gain for talking to a civil informant.
KP_liberation_civinfo_intel = 5;

// Time until a civil informant will despawn after spawning. (seconds)
KP_liberation_civinfo_duration = 1200;

// Chance (0-100) that the delivered informant will spawn a time critical task
KP_liberation_civinfo_task_chance = 40;

// Time until the task will despawn if no player is near. (seconds)
KP_liberation_civinfo_task_duration = 900;


/*
------------------------------------------------------------
    --- FUEL CONSUMPTION SETTINGS ---
    Values for the KP Fuel Consumption Script.
------------------------------------------------------------
*/

// Time in minutes till a full tank depletes whilst the vehicle is standing still with a running engine.
KP_liberation_fuel_neutral = 180;

// Time in minutes till a full tank depletes whilst the vehicle is driving below max speed.
KP_liberation_fuel_normal = 90;

// Time in minutes till a full tank depletes whilst the vehicle is driving at max speed.
KP_liberation_fuel_max = 45;


/*
------------------------------------------------------------
    --- RESISTANCE SETTINGS ---
    Values connected to the resistance faction.
------------------------------------------------------------
*/

// Chance (0-100) that a logistic convoy will be ambushed, when civil reputation is low. (Checked every minute)
KP_liberation_convoy_ambush_chance = 2;

// Duration of the convoy ambush event until nothing can be retrieved. (seconds)
KP_liberation_convoy_ambush_duration = 1200;

// Resistance strength (0-100) needed for tier 2 equipment.
KP_liberation_resistance_tier2 = 30;

// Resistance strength (0-100) needed for tier 3 equipment.
KP_liberation_resistance_tier3 = 70;

// Chance (0-100) that a resistance unit has a RPG. (tier 2 and 3)
KP_liberation_resistance_at_chance = 20;

// Chance (0-100) that a resistance squad will join an ongoing sector attack.
KP_liberation_resistance_sector_chance = 35;

// Chance that some resistance units will spawn in blufor sectors for an ambush, if reputation is low.
KP_liberation_resistance_ambush_chance = 25;


/*
------------------------------------------------------------
    --- MISC SETTINGS ---
    Values or arrays of misc mechanics.
------------------------------------------------------------
*/

// Time in minutes until a resource crate is produced, when resources multiplier is set to 1.
KP_liberation_production_interval = 30;

// Percentage of resources you get back from recycling.
GRLIB_recycling_percentage = 0.5;

// Multiplier for defenders in buildings.
GRLIB_defended_buildingpos_part = 0.4;

// Time in seconds how long a captured sector is vulnerable to enemy troops.
GRLIB_vulnerability_timer = 1200;

// Chance that enemy infantry will surrender after heavy losses are encountered.
GRLIB_surrender_chance = 80;

// When playing on this map, it'll create a clearance (remove terrain objects) in a 15m radius around the battlegroup/reinforcements spawnpoint.
KP_liberation_battlegroup_clearance = [
    "song_bin_tanh"
];

/* Slot independent commander action access.
The Steam UIDs entered in this array will allow corresponding players to access the commander actions (rights, production, etc.),
even if they are not in the commander slot. */
KP_liberation_commander_actions = [
    /*
    Example:
    "1324678",
    "5468711",
    "2156347"
    */
];

/* Whitelist for BI support framework access.
Same format as for the commander actions. */
KP_liberation_suppMod_whitelist = [

];


// Adjustments calculation depending on selected mission parameters (shouldn't be edited)
GRLIB_endgame                       = 0;
GRLIB_respawn_marker                = "respawn";
KP_liberation_production_interval   = ceil (KP_liberation_production_interval / GRLIB_resources_multiplier);
GRLIB_battlegroup_size              = GRLIB_battlegroup_size * (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
GRLIB_civilians_amount              = GRLIB_civilians_amount * GRLIB_civilian_activity;
GRLIB_blufor_cap                    = (GRLIB_blufor_cap * GRLIB_unitcap) min 100;
GRLIB_sector_cap                    = GRLIB_sector_cap * GRLIB_unitcap;
GRLIB_battlegroup_cap               = GRLIB_battlegroup_cap * GRLIB_unitcap;
GRLIB_patrol_cap                    = GRLIB_patrol_cap * GRLIB_unitcap;
