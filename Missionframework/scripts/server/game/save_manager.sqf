diag_log format ["[KP LIBERATION] [SAVE] save_manager.sqf started - time: %1", diag_tickTime];

// Handle possible enabled "wipe save" mission parameters
if (GRLIB_param_wipe_savegame_1 == 1 && GRLIB_param_wipe_savegame_2 == 1) then {
    profileNamespace setVariable [GRLIB_save_key,nil];
    saveProfileNamespace;
    diag_log "[KP LIBERATION] [SAVE] Save wiped via mission parameters";
} else {
    diag_log "[KP LIBERATION] [SAVE] No save wipe";
};

/*
    --- Locals ---
    Variables which are only used inside the save_manager.sqf
*/

// Version of the KP Liberation framework
private _version = [0, 96, 6];
// All AI squads
private _aiGroups = [];
// Classnames of blufor vehicles
private _bluforClassnames = [];
// Current campaign date and time
private _dateTime = [];
// All classnames of objects which should be saved
private _classnamesToSave = [FOB_typename, huron_typename];
// Vehicles which shouldn't be handled in the kill manager
private _noKillHandler = [FOB_typename, huron_typename];
// All objects which should be loaded/saved
private _objectsToSave = [];
// All storages which are handled for resource persistence
private _resourceStorages = [];
// Collection array for the statistic values
private _stats = [];
// Collection array for the enemy weights
private _weights = [];

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
// Captured civilian vehicles
KP_liberation_cr_vehicles = [];
// Strength value of the resistance forces
KP_liberation_guerilla_strength = 0;
// Logistic handling data
KP_liberation_logistics = [];
// Production handling data
KP_liberation_production = [];
// Factory markers to display the current available facilities
KP_liberation_production_markers = [];
// Global Intel resource
resources_intel = 0;
// State if the save is fully loaded
save_is_loaded = false;

// Trigger to start a saving process
doSaveTrigger = false;

// Add all buildings for saving and kill manager ignore
{
    _noKillHandler pushBack (_x select 0);
    _classnamesToSave pushBack (_x select 0);
} foreach buildings;

// Fetch all blufor vehicle classnames
{
    _bluforClassnames pushBack (_x select 0);
    _classnamesToSave pushBack (_x select 0);
} foreach (static_vehicles + air_vehicles + heavy_vehicles + light_vehicles + support_vehicles);

// Add opfor and civilian vehicles for saving
_classnamesToSave = _classnamesToSave + all_hostile_classnames + civilian_vehicles;

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
greuh_liberation_savegame = profileNamespace getVariable GRLIB_save_key;

// Load save data, when retrieved
if (!isNil "greuh_liberation_savegame") then {
    if (((greuh_liberation_savegame select 0) select 0) isEqualType 0) then {
        diag_log format ["[KP LIBERATION] [SAVE] Save data from version: %1", (greuh_liberation_savegame select 0) joinstring "."];

        _dateTime                                   = greuh_liberation_savegame select  1;
        _objectsToSave                              = greuh_liberation_savegame select  2;
        _resourceStorages                           = greuh_liberation_savegame select  3;
        _stats                                      = greuh_liberation_savegame select  4;
        _weights                                    = greuh_liberation_savegame select  5;
        _aiGroups                                   = greuh_liberation_savegame select  6;
        blufor_sectors                              = greuh_liberation_savegame select  7;
        combat_readiness                            = greuh_liberation_savegame select  8;
        GRLIB_all_fobs                              = greuh_liberation_savegame select  9;
        GRLIB_permissions                           = greuh_liberation_savegame select 10;
        GRLIB_vehicle_to_military_base_links        = greuh_liberation_savegame select 11;
        KP_liberation_civ_rep                       = greuh_liberation_savegame select 12;
        KP_liberation_clearances                    = greuh_liberation_savegame select 13;
        KP_liberation_guerilla_strength             = greuh_liberation_savegame select 14;
        KP_liberation_logistics                     = greuh_liberation_savegame select 15;
        KP_liberation_production                    = greuh_liberation_savegame select 16;
        KP_liberation_production_markers            = greuh_liberation_savegame select 17;
        resources_intel                             = greuh_liberation_savegame select 18;

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
        /*
            --- Compatibility for older save data ---
            This will be removed if we reach a 0.96.7 due to more released Arma 3 DLCs until we finish 0.97.0
        */
        diag_log "[KP LIBERATION] [SAVE] Save data from version: pre 0.96.5";

        blufor_sectors                              = greuh_liberation_savegame select  0;
        GRLIB_all_fobs                              = greuh_liberation_savegame select  1;
        _objectsToSave                              = greuh_liberation_savegame select  2;
        _dateTime                                   = greuh_liberation_savegame select  3;
        combat_readiness                            = greuh_liberation_savegame select  4;
        _resourceStorages                           = greuh_liberation_savegame select  5;
        KP_liberation_production                    = greuh_liberation_savegame select  6;
        KP_liberation_logistics                     = greuh_liberation_savegame select  7;
        _stats                                      = greuh_liberation_savegame select  8;
        _weights                                    = greuh_liberation_savegame select  9;
        GRLIB_vehicle_to_military_base_links        = greuh_liberation_savegame select 10;
        GRLIB_permissions                           = greuh_liberation_savegame select 11;
        _aiGroups                                   = greuh_liberation_savegame select 12;
        resources_intel                             = greuh_liberation_savegame select 13;
        KP_liberation_civ_rep                       = greuh_liberation_savegame select 15;
        KP_liberation_production_markers            = greuh_liberation_savegame select 16;
        KP_liberation_guerilla_strength             = greuh_liberation_savegame select 17;

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

    if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] %1 getFriend %2: %3 - %1 getFriend %4: %5", GRLIB_side_resistance, GRLIB_side_enemy, (GRLIB_side_resistance getFriend GRLIB_side_enemy), GRLIB_side_friendly, (GRLIB_side_resistance getFriend GRLIB_side_friendly)];};

    // Apply current date and time
    if (_dateTime isEqualType []) then {
        setDate _dateTime;
    } else {
        setDate [2045, 6, 6, _dateTime, 0]; // Compatibility for older save data
    };

    // Create clearances
    {
        [_x select 0, _x select 1] call F_createClearance;
    } forEach KP_liberation_clearances;

    // Collection array for all objects which are loaded
    private _spawnedObjects = [];

    // Spawn all saved objects
    {
        // Fetch data of saved object
        _x params ["_class", "_pos", "_vecDir", "_vecUp", ["_hasCrew", false]];

        // This will be removed if we reach a 0.96.7 due to more released Arma 3 DLCs until we finish 0.97.0
        if !(((greuh_liberation_savegame select 0) select 0) isEqualType 0) then {
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
        if (_class in _classnamesToSave) then {

            // Create object without damage handling and simulation
            private _object = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
            _object allowdamage false;
            _object enableSimulation false;

            // Add object to spawned objects collection
            _spawnedObjects pushBack _object;

            // Reposition spawned object
            _object setPosWorld _pos;
            _object setVectorDirAndUp [_vecDir, _vecUp];

            // Add blufor crew, if it had crew or is a UAV
            if ((unitIsUAV _object) || _hascrew) then {
                [_object] call F_forceBluforCrew;
            };

            // Apply kill manager handling, if not excluded
            if !(_class in _noKillHandler) then {
                _object addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
            };

            // Set captured variable, if it's an OPFOR vehicle
            if (_class in all_hostile_classnames) then {
                _object setVariable ["GRLIB_captured", 1, true];
            };

            // Prevent damage for the FOB building
            if (_class == FOB_typename) then {
                _object addEventHandler ["HandleDamage", {0}];
            };

            // Process KP object init
            [_object] call F_addObjectInit;

            // Determine if cargo should be cleared
            if (KP_liberation_clear_cargo || {!(_class in KP_liberation_ace_crates)} || {!(_class isKindOf "AllVehicles")}) then {
                clearWeaponCargoGlobal _object;
                clearMagazineCargoGlobal _object;
                clearBackpackCargoGlobal _object;
                clearItemCargoGlobal _object;
            };

            // Mark civilian vehicle as "already seized"
            if (_class in civilian_vehicles) then {
                KP_liberation_cr_vehicles pushBack _object;
            };
        };
    } forEach _objectsToSave;

    // Re-enable physics on the spawned objects
    {
        _x enableSimulation true;
        _x setdamage 0;
        _x allowdamage true;
    } forEach _spawnedObjects;

    if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Saved buildings placed";};

    // Spawn saved resource storages and their content
    {
        _x params ["_class", "_pos", "_vecDir", "_vecUp", "_supply", "_ammo", "_fuel"];

        // Only spawn, if the classname is still in the presets
        if (_class in _classnamesToSave) then {

            // Create object without damage handling and simulation
            private _object = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];;
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
            [floor _supply, floor _ammo, floor _fuel, _object] call F_fillStorage;
        };
    } forEach _resourceStorages;

    if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Saved storages placed"};

    // Spawn saved sector storages and their content
    {
        private _storage = _x select 3;

        // Spawn storage, if sector has valid storage
        if ((count _storage) == 3) then {
            _storage params ["_pos", "_dir", "_vecUp"];

            // Create object without damage handling and simulation
            private _object = createVehicle [KP_liberation_small_storage_building, _pos, [], 0, "CAN_COLLIDE"];
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
            [floor (_x select 9), floor (_x select 10), floor (_x select 11), _object] call F_fillStorage;
        };
    } forEach KP_liberation_production;

    if (KP_liberation_savegame_debug > 0) then {diag_log "[KP LIBERATION] [SAVE] Saved sector storages placed";};

    // Spawn BLUFOR AI groups
    // This will be removed if we reach a 0.96.7 due to more released Arma 3 DLCs until we finish 0.97.0
    if (((greuh_liberation_savegame select 0) select 0) isEqualType 0) then {
        {
            _x params ["_spawnPos", "_units"];
            private _grp = createGroup [GRLIB_side_friendly, true];
            {
                _x createUnit [[_spawnPos, _grp] select (_forEachIndex > 0), _grp, 'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
            } forEach _units;
        } forEach _aiGroups;
    } else {
        // Pre 0.96.5 compatibility
        {
            private _savedGroup = _x;
            private _grp = createGroup [GRLIB_side_friendly, true];
            {
                private _unit = _x;
                private _pos = [(_unit select 1) select 0, (_unit select 1) select 1, ((_unit select 1) select 2) + 0.2];
                private _dir = _unit select 2;
                (_unit select 0) createUnit [ _pos, _grp, 'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
                private _nextobj = ((units _grp) select ((count (units _grp)) - 1));
                _nextobj setDir _dir;
                _nextobj setPosATL _pos;
            } forEach _savedGroup;
        } forEach _aiGroups;
    };
    diag_log "[KP LIBERATION] [SAVE] Save loading finished";
} else {
    diag_log "[KP LIBERATION] [SAVE] Save nil";
};

publicVariable "stats_civilian_vehicles_seized";
publicVariable "stats_ieds_detonated";
publicVariable "blufor_sectors";
publicVariable "GRLIB_all_fobs";
publicVariable "KP_liberation_clearances";

// Check for deleted military sectors or deleted classnames in the locked vehicles array
GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links select {((_x select 0) in elite_vehicles) && ((_x select 1) in sectors_military)};

// Remove links for vehicles of possibly removed mods
GRLIB_vehicle_to_military_base_links = GRLIB_vehicle_to_military_base_links select {[_x select 0] call F_checkClass};

// Check for additions in the locked vehicles array
private _lockedVehCount = count GRLIB_vehicle_to_military_base_links;
if ((_lockedVehCount < (count sectors_military)) && (_lockedVehCount < (count elite_vehicles))) then {
    diag_log "[KP LIBERATION] [SAVE] Additional military sectors or unlockable vehicles detected and assigned";
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
};

publicVariable "GRLIB_vehicle_to_military_base_links";
publicVariable "GRLIB_permissions";
publicVariable "KP_liberation_cr_vehicles";
save_is_loaded = true; publicVariable "save_is_loaded";

diag_log format ["[KP LIBERATION] [SAVE] save_manager.sqf done - time: %1", diag_tickTime];

// Start the save loop
while {true} do {
    waitUntil {
        sleep 0.5;
        doSaveTrigger || GRLIB_endgame == 1;
    };

    if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Save interval started - time: %1", time];};

    // Exit the while and wipe save, if campaign ended
    if (GRLIB_endgame == 1) exitWith {
        profileNamespace setVariable [GRLIB_save_key, nil];
        saveProfileNamespace;
    };

    doSaveTrigger = false;
    _objectsToSave = [];
    _resourceStorages = [];
    _aiGroups = [];

    private _allObjects = [];
    private _allStorages = [];

    // Get all blufor groups
    private _allBlueGroups = allGroups select {
        (side _x == GRLIB_side_friendly) &&                 // Only blufor groups
        {isNull objectParent (leader _x)} &&                // Make sure it's an infantry group
        {!(((units _x) select {alive _x}) isEqualTo [])}    // At least one unit has to be alive
    };

    // Fetch all objects and AI groups near each FOB
    {
        private _fobPos = _x;
        private _fobObjects = (_fobPos nearobjects (GRLIB_fob_range * 2)) select {
            ((typeof _x) in _classnamesToSave) &&                       // Exclude classnames which are not in the presets
            {alive _x} &&                                               // Exclude dead or broken objects
            {getObjectType _x >= 8} &&                                  // Exclude preplaced terrain objects
            {speed _x < 5} &&                                           // Exclude moving objects (like civilians driving through)
            {isNull attachedTo _x} &&                                   // Exclude attachTo'd objects
            {((getpos _x) select 2) < 10} &&                            // Exclude hovering helicopters and the like
            {!(_x getVariable ["KP_liberation_edenObject", false])} &&  // Exclude all objects placed via editor in mission.sqm
            {!(_x getVariable ["KP_liberation_preplaced", false])} &&   // Exclude preplaced (e.g. little birds from carrier)
            {!((typeOf _x) in KP_liberation_crates)}                    // Exclude storage crates (those are handled separately)
        };

        _allObjects = _allObjects + (_fobObjects select {!((typeOf _x) in KP_liberation_storage_buildings)});
        _allStorages = _allStorages + (_fobObjects select {(_x getVariable ["KP_liberation_storage_type",-1]) == 0});

        // Process all groups near this FOB
        {
            // Get only living AI units of the group
            private _grpUnits = (units _x) select {!(isPlayer _x) && (alive _x)};
            // Add to save array
            _aiGroups pushBack [getPosATL (leader _x), (_grpUnits apply {typeOf _x})];
        } forEach (_allBlueGroups select {(_fobPos distance2D (leader _x)) < (GRLIB_fob_range * 2)});
    } forEach GRLIB_all_fobs;

    // Save all fetched objects
    {
        // Position data
        private _savedpos = getPosWorld _x;
        private _savedvecdir = vectorDirVisual _x;
        private _savedvecup = vectorUpVisual _x;;
        private _class = typeOf _x;
        private _hascrew = false;

        // Determine if vehicle is crewed
        if (_class in _bluforClassnames) then {
            if (({!isPlayer _x} count (crew _x) ) > 0) then {
                _hascrew = true;
            };
        };

        // Add to saving when not a civilian vehicle or listed in the seized civilian vehicles array
        if (!(_class in civilian_vehicles) || {_x in KP_liberation_cr_vehicles}) then {
            _objectsToSave pushBack [_class,_savedpos,_savedvecdir,_savedvecup,_hascrew];
        };
    } forEach _allObjects;

    // Save all storages and resources
    {
        // Position data
        private _savedpos = getPosWorld _x;;
        private _savedvecdir = vectorDirVisual _x;
        private _savedvecup = vectorUpVisual _x;;
        private _class = typeof _x;

        // Resource variables
        private _supplyValue = 0;
        private _ammoValue = 0;
        private _fuelValue = 0;

        // Sum all stored resources of current storage
        {
            switch ((typeOf _x)) do {
                case KP_liberation_supply_crate: {_supplyValue = _supplyValue + (_x getVariable ["KP_liberation_crate_value",0]);};
                case KP_liberation_ammo_crate: {_ammoValue = _ammoValue + (_x getVariable ["KP_liberation_crate_value",0]);};
                case KP_liberation_fuel_crate: {_fuelValue = _fuelValue + (_x getVariable ["KP_liberation_crate_value",0]);};
                default {diag_log format ["[KP LIBERATION] [ERROR] Invalid object (%1) at storage area", (typeOf _x)];};
            };
        } forEach (attachedObjects _x);

        // Add to saving with corresponding resource values
        _resourceStorages pushBack [_class,_savedpos,_savedvecdir,_savedvecup,_supplyValue,_ammoValue,_fuelValue];
    } forEach _allStorages;

    // Pack all stats in one array
    _stats = [
        stats_ammo_produced,
        stats_ammo_spent,
        stats_blufor_soldiers_killed,
        stats_blufor_soldiers_recruited,
        stats_blufor_teamkills,
        stats_blufor_vehicles_built,
        stats_blufor_vehicles_killed,
        stats_civilian_buildings_destroyed,
        stats_civilian_vehicles_killed,
        stats_civilian_vehicles_killed_by_players,
        stats_civilian_vehicles_seized,
        stats_civilians_healed,
        stats_civilians_killed,
        stats_civilians_killed_by_players,
        stats_fobs_built,
        stats_fobs_lost,
        stats_fuel_produced,
        stats_fuel_spent,
        stats_hostile_battlegroups,
        stats_ieds_detonated,
        stats_opfor_killed_by_players,
        stats_opfor_soldiers_killed,
        stats_opfor_vehicles_killed,
        stats_opfor_vehicles_killed_by_players,
        stats_player_deaths,
        stats_playtime,
        stats_prisoners_captured,
        stats_readiness_earned,
        stats_reinforcements_called,
        stats_resistance_killed,
        stats_resistance_teamkills,
        stats_resistance_teamkills_by_players,
        stats_secondary_objectives,
        stats_sectors_liberated,
        stats_sectors_lost,
        stats_spartan_respawns,
        stats_supplies_produced,
        stats_supplies_spent,
        stats_vehicles_recycled
    ];

    // Pack the weights in one array
    _weights = [
        infantry_weight,
        armor_weight,
        air_weight
    ];

    // Pack the save data in the save array
    greuh_liberation_savegame = [
        _version,
        date,
        _objectsToSave,
        _resourceStorages,
        _stats,
        _weights,
        _aiGroups,
        blufor_sectors,
        combat_readiness,
        GRLIB_all_fobs,
        GRLIB_permissions,
        GRLIB_vehicle_to_military_base_links,
        KP_liberation_civ_rep,
        KP_liberation_clearances,
        KP_liberation_guerilla_strength,
        KP_liberation_logistics,
        KP_liberation_production,
        KP_liberation_production_markers,
        resources_intel
    ];

    // Write data in the severs profileNamespace
    profileNamespace setVariable [GRLIB_save_key, greuh_liberation_savegame];
    saveProfileNamespace;

    if (KP_liberation_savegame_debug > 0) then {diag_log format ["[KP LIBERATION] [SAVE] Save interval finished - time: %1", time];};
};

diag_log "[KP LIBERATION] [SAVE] Left saving loop in save_manager.sqf";

true
