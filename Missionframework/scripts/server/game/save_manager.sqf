scriptName "KPLIB_saveLoop";

private _start = diag_tickTime;
["----- Loading save data", "SAVE"] call KPLIB_fnc_log;

// Handle possible enabled "wipe save" mission parameters
if (GRLIB_param_wipe_savegame_1 == 1 && GRLIB_param_wipe_savegame_2 == 1) then {
    profileNamespace setVariable [GRLIB_save_key,nil];
    saveProfileNamespace;
    ["Save wiped via mission parameters", "SAVE"] call KPLIB_fnc_log;
} else {
    ["No save wipe", "SAVE"] call KPLIB_fnc_log;
};

// Auto save when last player exits
if (hasInterface) then {
    [] spawn {
        waitUntil {!isNull findDisplay 46};
        (findDisplay 46) displayAddEventHandler ["Unload", {
            if (!isServer) exitWith {};
            ["Player server exit. Saving mission data.", "SAVE"] call KPLIB_fnc_log;
            [] call KPLIB_fnc_doSave;
        }];
    };
} else {
    addMissionEventHandler ["HandleDisconnect", {
        if !(allPlayers isEqualTo []) exitWith {false};
        params ["_unit"];
        deleteVehicle _unit;
        ["Last player disconnected. Saving mission data.", "SAVE"] call KPLIB_fnc_log;
        [] call KPLIB_fnc_doSave;
    }];
};

// All classnames of objects which should be saved
KPLIB_classnamesToSave = [toLower FOB_typename, toLower huron_typename];

/*
    --- Locals ---
    Variables which are only used inside the save_manager.sqf
*/
// All AI squads
private _aiGroups = [];
// Current campaign date and time
private _dateTime = [];
// Vehicles which shouldn't be handled in the kill manager
private _noKillHandler = [toLower FOB_typename, toLower huron_typename];
// All objects which should be loaded/saved
private _objectsToSave = [];
// All storages which are handled for resource persistence
private _resourceStorages = [];
// Collection array for the statistic values
private _stats = [];
// Collection array for the enemy weights
private _weights = [];
// All mines around FOBs
private _allMines = [];
// All unclaimed crates from crate spawning sectors
private _allCrates = [];

/*
    --- Globals ---
    Initializes global variables which are used at several places in the framework
*/

// Enemy weight for anti air
air_weight = 33;
// Enemy weight for anti armor
armor_weight = 33;
// Blufor sectors
blufor_sectors = [];
// Enemy combat readiness (0-100)
combat_readiness = 0;
// All FOBs
GRLIB_all_fobs = [];
// Player permissions data
GRLIB_permissions = [];
// Vehicle unlock links
GRLIB_vehicle_to_military_base_links = [];
// Enemy weight for anti infantry
infantry_weight = 33;
// Civilian reputation value (-100 - +100)
KP_liberation_civ_rep = 0;
// Clearances
KP_liberation_clearances = [];
// Strength value of the resistance forces
KP_liberation_guerilla_strength = 0;
// Logistic handling data
KP_liberation_logistics = [];
// Production handling data
KP_liberation_production = [];
// Factory markers to display the current available facilities
KP_liberation_production_markers = [];
// Radio tower classnames per radio tower sector
KPLIB_sectorTowers = [];
// Sectors under attack
KPLIB_sectorsUnderAttack = [];
// Global Intel resource
resources_intel = 0;
// State if the save is fully loaded
save_is_loaded = false;

// Add all buildings for saving and kill manager ignore
_noKillHandler append KPLIB_b_buildings_classes;
KPLIB_classnamesToSave append KPLIB_b_buildings_classes;
KPLIB_classnamesToSave append KPLIB_b_allVeh_classes;

// Add opfor and civilian vehicles for saving
KPLIB_classnamesToSave append KPLIB_o_allVeh_classes;
KPLIB_classnamesToSave append civilian_vehicles;

// Remove duplicates
KPLIB_classnamesToSave = KPLIB_classnamesToSave arrayIntersect KPLIB_classnamesToSave;

/*
    --- Statistic Variables ---
*/

stats_ammo_produced = 0;
stats_ammo_spent = 0;
stats_blufor_soldiers_killed = 0;
stats_blufor_soldiers_recruited = 0;
stats_blufor_teamkills = 0;
stats_blufor_vehicles_built = 0;
stats_blufor_vehicles_killed = 0;
stats_civilian_buildings_destroyed = 0;
stats_civilian_vehicles_killed = 0;
stats_civilian_vehicles_killed_by_players = 0;
stats_civilian_vehicles_seized = 0;
stats_civilians_healed = 0;
stats_civilians_killed = 0;
stats_civilians_killed_by_players = 0;
stats_fobs_built = 0;
stats_fobs_lost = 0;
stats_fuel_produced = 0;
stats_fuel_spent = 0;
stats_hostile_battlegroups = 0;
stats_ieds_detonated = 0;
stats_opfor_killed_by_players = 0;
stats_opfor_soldiers_killed = 0;
stats_opfor_vehicles_killed = 0;
stats_opfor_vehicles_killed_by_players = 0;
stats_player_deaths = 0;
stats_playtime = 0;
stats_prisoners_captured = 0;
stats_readiness_earned = 0;
stats_reinforcements_called = 0;
stats_resistance_killed = 0;
stats_resistance_teamkills = 0;
stats_resistance_teamkills_by_players = 0;
stats_secondary_objectives = 0;
stats_sectors_liberated = 0;
stats_sectors_lost = 0;
stats_spartan_respawns = 0;
stats_supplies_produced = 0;
stats_supplies_spent = 0;
stats_vehicles_recycled = 0;

// Prevent saving/duplication of objects placed in Eden
{
    _x setVariable ["KP_liberation_edenObject", true];
} forEach (allMissionObjects "");

// Get possible save data
private _saveData = profileNamespace getVariable GRLIB_save_key;

// Load save data, when retrieved
if (!isNil "_saveData") then {

    // Convert from string to array
    if (_saveData isEqualType "") then {
        _saveData = parseSimpleArray _saveData;
    };

    if (((_saveData select 0) select 0) isEqualType 0) then {
        [format ["Save data from version: %1", (_saveData select 0) joinstring "."], "SAVE"] call KPLIB_fnc_log;

        _dateTime                                   = _saveData select  1;
        _objectsToSave                              = _saveData select  2;
        _resourceStorages                           = _saveData select  3;
        _stats                                      = _saveData select  4;
        _weights                                    = _saveData select  5;
        _aiGroups                                   = _saveData select  6;
        blufor_sectors                              = _saveData select  7;
        combat_readiness                            = _saveData select  8;
        GRLIB_all_fobs                              = _saveData select  9;
        GRLIB_permissions                           = _saveData select 10;
        GRLIB_vehicle_to_military_base_links        = _saveData select 11;
        KP_liberation_civ_rep                       = _saveData select 12;
        KP_liberation_clearances                    = _saveData select 13;
        KP_liberation_guerilla_strength             = _saveData select 14;
        KP_liberation_logistics                     = _saveData select 15;
        KP_liberation_production                    = _saveData select 16;
        KP_liberation_production_markers            = _saveData select 17;
        resources_intel                             = _saveData select 18;
        _allMines                                   = _saveData param [19, []];
        _allCrates                                  = _saveData param [20, []];
        KPLIB_sectorTowers                          = _saveData param [21, []];

        stats_ammo_produced                         = _stats select  0;
        stats_ammo_spent                            = _stats select  1;
        stats_blufor_soldiers_killed                = _stats select  2;
        stats_blufor_soldiers_recruited             = _stats select  3;
        stats_blufor_teamkills                      = _stats select  4;
        stats_blufor_vehicles_built                 = _stats select  5;
        stats_blufor_vehicles_killed                = _stats select  6;
        stats_civilian_buildings_destroyed          = _stats select  7;
        stats_civilian_vehicles_killed              = _stats select  8;
        stats_civilian_vehicles_killed_by_players   = _stats select  9;
        stats_civilian_vehicles_seized              = _stats select 10;
        stats_civilians_healed                      = _stats select 11;
        stats_civilians_killed                      = _stats select 12;
        stats_civilians_killed_by_players           = _stats select 13;
        stats_fobs_built                            = _stats select 14;
        stats_fobs_lost                             = _stats select 15;
        stats_fuel_produced                         = _stats select 16;
        stats_fuel_spent                            = _stats select 17;
        stats_hostile_battlegroups                  = _stats select 18;
        stats_ieds_detonated                        = _stats select 19;
        stats_opfor_killed_by_players               = _stats select 20;
        stats_opfor_soldiers_killed                 = _stats select 21;
        stats_opfor_vehicles_killed                 = _stats select 22;
        stats_opfor_vehicles_killed_by_players      = _stats select 23;
        stats_player_deaths                         = _stats select 24;
        stats_playtime                              = _stats select 25;
        stats_prisoners_captured                    = _stats select 26;
        stats_readiness_earned                      = _stats select 27;
        stats_reinforcements_called                 = _stats select 28;
        stats_resistance_killed                     = _stats select 29;
        stats_resistance_teamkills                  = _stats select 30;
        stats_resistance_teamkills_by_players       = _stats select 31;
        stats_secondary_objectives                  = _stats select 32;
        stats_sectors_liberated                     = _stats select 33;
        stats_sectors_lost                          = _stats select 34;
        stats_spartan_respawns                      = _stats select 35;
        stats_supplies_produced                     = _stats select 36;
        stats_supplies_spent                        = _stats select 37;
        stats_vehicles_recycled                     = _stats select 38;
    } else {
        // --- Compatibility for older save data ---
        ["Save data from version: pre 0.96.5", "SAVE"] call KPLIB_fnc_log;

        blufor_sectors                              = _saveData select  0;
        GRLIB_all_fobs                              = _saveData select  1;
        _objectsToSave                              = _saveData select  2;
        _dateTime                                   = _saveData select  3;
        combat_readiness                            = _saveData select  4;
        _resourceStorages                           = _saveData select  5;
        KP_liberation_production                    = _saveData select  6;
        KP_liberation_logistics                     = _saveData select  7;
        _stats                                      = _saveData select  8;
        _weights                                    = _saveData select  9;
        GRLIB_vehicle_to_military_base_links        = _saveData select 10;
        GRLIB_permissions                           = _saveData select 11;
        _aiGroups                                   = _saveData select 12;
        resources_intel                             = _saveData select 13;
        KP_liberation_civ_rep                       = _saveData select 15;
        KP_liberation_production_markers            = _saveData select 16;
        KP_liberation_guerilla_strength             = _saveData select 17;

        stats_opfor_soldiers_killed                 = _stats select  0;
        stats_opfor_killed_by_players               = _stats select  1;
        stats_blufor_soldiers_killed                = _stats select  2;
        stats_player_deaths                         = _stats select  3;
        stats_opfor_vehicles_killed                 = _stats select  4;
        stats_opfor_vehicles_killed_by_players      = _stats select  5;
        stats_blufor_vehicles_killed                = _stats select  6;
        stats_blufor_soldiers_recruited             = _stats select  7;
        stats_blufor_vehicles_built                 = _stats select  8;
        stats_civilians_killed                      = _stats select  9;
        stats_civilians_killed_by_players           = _stats select 10;
        stats_sectors_liberated                     = _stats select 11;
        stats_playtime                              = _stats select 12;
        stats_spartan_respawns                      = _stats select 13;
        stats_secondary_objectives                  = _stats select 14;
        stats_hostile_battlegroups                  = _stats select 15;
        stats_ieds_detonated                        = _stats select 16;
        stats_reinforcements_called                 = _stats select 19;
        stats_prisoners_captured                    = _stats select 20;
        stats_blufor_teamkills                      = _stats select 21;
        stats_vehicles_recycled                     = _stats select 22;
        stats_ammo_spent                            = _stats select 23;
        stats_sectors_lost                          = _stats select 24;
        stats_fobs_built                            = _stats select 25;
        stats_fobs_lost                             = _stats select 26;
        stats_readiness_earned                      = _stats select 27;
    };

    // Extract weigths from collection array
    infantry_weight = _weights select 0;
    armor_weight = _weights select 1;
    air_weight = _weights select 2;

    // Set correct resistance standing
    private _resistanceEnemy = [0, 1] select (KP_liberation_civ_rep < 25);
    private _resistanceFriendly = [0, 1] select (KP_liberation_civ_rep >= -25);

    GRLIB_side_resistance setFriend [GRLIB_side_enemy, _resistanceEnemy];
    GRLIB_side_enemy setFriend [GRLIB_side_resistance, _resistanceEnemy];
    GRLIB_side_resistance setFriend [GRLIB_side_friendly, _resistanceFriendly];
    GRLIB_side_friendly setFriend [GRLIB_side_resistance, _resistanceFriendly];

    if (KP_liberation_civrep_debug > 0) then {[format ["%1 getFriend %2: %3 - %1 getFriend %4: %5", GRLIB_side_resistance, GRLIB_side_enemy, (GRLIB_side_resistance getFriend GRLIB_side_enemy), GRLIB_side_friendly, (GRLIB_side_resistance getFriend GRLIB_side_friendly)], "CIVREP"] call KPLIB_fnc_log;};

    // Apply current date and time
    if (_dateTime isEqualType []) then {
        setDate _dateTime;
    } else {
        setDate [2045, 6, 6, _dateTime, 0]; // Compatibility for older save data
    };

    // Create clearances
    {
        [_x select 0, _x select 1] call KPLIB_fnc_createClearance;
    } forEach KP_liberation_clearances;

    // Collection array for all objects which are loaded
    private _spawnedObjects = [];

    // Spawn all saved objects
    private _object = objNull;
    {
        // Fetch data of saved object
        _x params ["_class", "_pos", "_vecDir", "_vecUp", ["_hasCrew", false]];

        // This will be removed if we reach a 0.96.7 due to more released Arma 3 DLCs until we finish 0.97.0
        if !(((_saveData select 0) select 0) isEqualType 0) then {
            // Pre 0.96.5 compatibility with repair building, as it was replaced by default with a different classname
            if ((KP_liberation_recycle_building != "Land_CarService_F") && (_class == "Land_CarService_F")) then {
                _class = KP_liberation_recycle_building;
            };

            // Pre 0.96.5 compatibility with air building, as it was replaced by default with a different classname
            if ((KP_liberation_air_vehicle_building != "Land_Radar_Small_F") && (_class == "Land_Radar_Small_F")) then {
                _class = KP_liberation_air_vehicle_building;
            };
        };

        // Only spawn, if the classname is still in the presets
        if ((toLower _class) in KPLIB_classnamesToSave) then {

            // Create object without damage handling and simulation
            _object = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
            _object allowdamage false;
            _object enableSimulation false;

            // Add object to spawned objects collection
            _spawnedObjects pushBack _object;

            // Reposition spawned object
            _object setPosWorld _pos;
            _object setVectorDirAndUp [_vecDir, _vecUp];

            // Process KP object init
            [_object] call KPLIB_fnc_addObjectInit;

            // Apply kill manager handling, if not excluded
            if !((toLower _class) in _noKillHandler) then {
                _object addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
            };

            // Set enemy vehicle as captured
            if ((toLower _class) in KPLIB_o_allVeh_classes) then {
                _object setVariable ["KPLIB_captured", true, true];
            };

            // Set civilian vehicle as seized
            if (_class in civilian_vehicles) then {
                _object setVariable ["KPLIB_seized", true, true];
            };

            // Determine if cargo should be cleared
            [_object] call KPLIB_fnc_clearCargo;

            // Add blufor crew, if it had crew or is a UAV
            if ((unitIsUAV _object) || _hascrew) then {
                [_object] call KPLIB_fnc_forceBluforCrew;
            };
        };
    } forEach _objectsToSave;

    // Re-enable physics on the spawned objects
    {
        _x enableSimulation true;
        _x setdamage 0;
        _x allowdamage true;
    } forEach _spawnedObjects;
    ["Saved buildings and vehicles placed", "SAVE"] call KPLIB_fnc_log;

    // Spawn all saved mines
    private _mine = objNull;
    {
        _x params ["_minePos", "_dirAndUp", "_class", "_known"];

        _mine = createVehicle [_class, _minePos, [], 0];
        _mine setPosWorld _minePos;
        _mine setVectorDirAndUp _dirAndUp;

        // reveal mine to player side if it was detected
        if (_known) then {
            GRLIB_side_friendly revealMine _mine;
        };

    } forEach _allMines;
    ["Saved mines placed", "SAVE"] call KPLIB_fnc_log;

    // Spawn saved resource storages and their content
    {
        _x params ["_class", "_pos", "_vecDir", "_vecUp", "_supply", "_ammo", "_fuel"];

        // Only spawn, if the classname is still in the presets
        if ((toLower _class) in KPLIB_classnamesToSave) then {

            // Create object without damage handling and simulation
            _object = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
            _object allowdamage false;
            _object enableSimulation false;

            // Reposition spawned object
            _object setPosWorld _pos;
            _object setVectorDirAndUp [_vecDir, _vecUp];

            // Re-enable physics on spawned object
            _object setdamage 0;
            _object enableSimulation true;
            _object allowdamage true;

            // Mark it as FOB storage
            _object setVariable ["KP_liberation_storage_type", 0, true];

            // Fill storage with saved resources
            [floor _supply, floor _ammo, floor _fuel, _object] call KPLIB_fnc_fillStorage;
        };
    } forEach _resourceStorages;
    ["Saved FOB storages placed and filled", "SAVE"] call KPLIB_fnc_log;

    // Spawn saved sector storages and their content
    private _storage = [];
    {
        _storage = _x select 3;

        // Spawn storage, if sector has valid storage
        if ((count _storage) == 3) then {
            _storage params ["_pos", "_dir", "_vecUp"];

            // Create object without damage handling and simulation
            _object = createVehicle [KP_liberation_small_storage_building, _pos, [], 0, "CAN_COLLIDE"];
            _object enableSimulationGlobal false;
            _object allowdamage false;

            // Reposition spawned object
            _object setdir _dir;
            _object setVectorUp _vecUp;
            _object setPosATL _pos;

            // Re-enable physics on spawned object
            _object setdamage 0;
            _object enableSimulation true;
            _object allowdamage true;

            // Mark it as sector storage
            _object setVariable ["KP_liberation_storage_type", 1, true];

            // Fill storage
            [floor (_x select 9), floor (_x select 10), floor (_x select 11), _object] call KPLIB_fnc_fillStorage;
        };
    } forEach KP_liberation_production;
    ["Saved sector storages placed and filled", "SAVE"] call KPLIB_fnc_log;

    // Spawn BLUFOR AI groups
    // This will be removed if we reach a 0.96.7 due to more released Arma 3 DLCs until we finish 0.97.0
    private _grp = grpNull;
    if (((_saveData select 0) select 0) isEqualType 0) then {
        {
            _x params ["_spawnPos", "_units"];
            _grp = createGroup [GRLIB_side_friendly, true];
            {
                [_x, [_spawnPos, _grp] select (_forEachIndex > 0), _grp] call KPLIB_fnc_createManagedUnit;
            } forEach _units;
        } forEach _aiGroups;
    } else {
        // Pre 0.96.5 compatibility
        private _pos = [];
        private _dir = 0;
        private _unit = objNull;
        {
            _grp = createGroup [GRLIB_side_friendly, true];
            {
                _pos = [(_x select 1) select 0, (_x select 1) select 1, ((_x select 1) select 2) + 0.2];
                _dir = _x select 2;
                _unit = [(_x select 0), _pos, _grp] call KPLIB_fnc_createManagedUnit;
                _unit setDir _dir;
                _unit setPosATL _pos;
            } forEach _x;
        } forEach _aiGroups;
    };
    ["Saved AI units placed", "SAVE"] call KPLIB_fnc_log;

    // Spawn all saved sector crates
    {
        _x call KPLIB_fnc_createCrate;
    } forEach _allCrates;
    ["Saved crates placed", "SAVE"] call KPLIB_fnc_log;
} else {
    ["Save nil", "SAVE"] call KPLIB_fnc_log;
};

publicVariable "stats_civilian_vehicles_seized";
publicVariable "stats_ieds_detonated";
publicVariable "blufor_sectors";
publicVariable "GRLIB_all_fobs";
publicVariable "KPLIB_sectorsUnderAttack";
publicVariable "KP_liberation_clearances";

// Check for deleted military sectors or deleted classnames in the locked vehicles array
GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links select {((_x select 0) in elite_vehicles) && ((_x select 1) in sectors_military)};

// Remove links for vehicles of possibly removed mods
GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links select {[_x select 0] call KPLIB_fnc_checkClass};

// Check for additions in the locked vehicles array
private _lockedVehCount = count GRLIB_vehicle_to_military_base_links;
if ((_lockedVehCount < (count sectors_military)) && (_lockedVehCount < (count elite_vehicles))) then {
    private _assignedVehicles = [];
    private _assignedBases = [];
    private _nextVehicle = "";
    private _nextBase = "";

    {
        _assignedVehicles pushBack (_x select 0);
        _assignedBases pushBack (_x select 1);
    } forEach GRLIB_vehicle_to_military_base_links;

    // Add new entries, when there are elite vehicles and military sectors are not yet assigned
    while {((count _assignedVehicles) < (count elite_vehicles)) && ((count _assignedBases) < (count sectors_military))} do {
        _nextVehicle = selectRandom (elite_vehicles - _assignedVehicles);
        _nextBase = selectRandom (sectors_military - _assignedBases);
        _assignedVehicles pushBack _nextVehicle;
        _assignedBases pushBack _nextBase;
        GRLIB_vehicle_to_military_base_links pushBack [_nextVehicle, _nextBase];
    };
    ["Additional military sectors or unlockable vehicles detected and assigned", "SAVE"] call KPLIB_fnc_log;
};

publicVariable "GRLIB_vehicle_to_military_base_links";
publicVariable "GRLIB_permissions";
save_is_loaded = true; publicVariable "save_is_loaded";

[format ["----- Saved data loaded - Time needed: %1 seconds", diag_tickTime - _start], "SAVE"] call KPLIB_fnc_log;

// Start the save loop
private _saveTime = time + KP_liberation_save_interval;
while {true} do {
    waitUntil {
        sleep 0.5;
        (time > _saveTime) || {GRLIB_endgame == 1};
    };
    _start = diag_tickTime;

    // Exit the while and wipe save, if campaign ended
    if (GRLIB_endgame == 1) exitWith {
        profileNamespace setVariable [GRLIB_save_key, nil];
        saveProfileNamespace;
    };

    [] call KPLIB_fnc_doSave;

    if (KP_liberation_savegame_debug > 0) then {[format ["Campaign saved - Time needed: %1 seconds", diag_tickTime - _start], "SAVE"] call KPLIB_fnc_log;};

    _saveTime = time + KP_liberation_save_interval;
};

["Left saving loop", "SAVE"] call KPLIB_fnc_log;

true
