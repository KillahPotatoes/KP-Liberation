// AI
add_civ_waypoints = compileScript ["scripts\server\ai\add_civ_waypoints.sqf", true];
add_defense_waypoints = compileScript ["scripts\server\ai\add_defense_waypoints.sqf", true];
battlegroup_ai = compileScript ["scripts\server\ai\battlegroup_ai.sqf", true];
building_defence_ai = compileScript ["scripts\server\ai\building_defence_ai.sqf", true];
patrol_ai = compileScript ["scripts\server\ai\patrol_ai.sqf", true];
prisonner_ai = compileScript ["scripts\server\ai\prisonner_ai.sqf", true];
troup_transport = compileScript ["scripts\server\ai\troup_transport.sqf", true];

// Battlegroup
spawn_air = compileScript ["scripts\server\battlegroup\spawn_air.sqf", true];
spawn_battlegroup = compileScript ["scripts\server\battlegroup\spawn_battlegroup.sqf", true];

// Game
check_victory_conditions = compileScript ["scripts\server\game\check_victory_conditions.sqf", true];

// Patrol
manage_one_civilian_patrol = compileScript ["scripts\server\patrols\manage_one_civilian_patrol.sqf", true];
manage_one_patrol = compileScript ["scripts\server\patrols\manage_one_patrol.sqf", true];
reinforcements_manager = compileScript ["scripts\server\patrols\reinforcements_manager.sqf", true];
send_paratroopers = compileScript ["scripts\server\patrols\send_paratroopers.sqf", true];

// Secondary objectives
fob_hunting = compileScript ["scripts\server\secondary\fob_hunting.sqf", true];
convoy_hijack = compileScript ["scripts\server\secondary\convoy_hijack.sqf", true];
search_and_rescue = compileScript ["scripts\server\secondary\search_and_rescue.sqf", true];
civ_supplies = compileScript ["scripts\server\secondary\civ_supplies.sqf", true];
bingo_fuel = compileScript ["scripts\server\secondary\bingo_fuel.sqf", true];
rearm_outpost = compileScript ["scripts\server\secondary\rearm_outpost.sqf", true];

// Sector
attack_in_progress_fob = compileScript ["scripts\server\sector\attack_in_progress_fob.sqf", true];
attack_in_progress_sector = compileScript ["scripts\server\sector\attack_in_progress_sector.sqf", true];
ied_manager = compileScript ["scripts\server\sector\ied_manager.sqf", true];
manage_one_sector = compileScript ["scripts\server\sector\manage_one_sector.sqf", true];
wait_to_spawn_sector = compileScript ["scripts\server\sector\wait_to_spawn_sector.sqf", true];

// Globals
KPLIB_sectors_active = []; publicVariable "KPLIB_sectors_active";

execVM "scripts\server\base\startgame.sqf";
execVM "scripts\server\base\huron_manager.sqf";
execVM "scripts\server\base\startvehicle_spawn.sqf";
[] call KPLIB_fnc_createSuppModules;
execVM "scripts\server\battlegroup\counter_battlegroup.sqf";
execVM "scripts\server\battlegroup\random_battlegroups.sqf";
execVM "scripts\server\battlegroup\readiness_increase.sqf";
execVM "scripts\server\game\apply_default_permissions.sqf";
execVM "scripts\server\game\cleanup_vehicles.sqf";
if (!KPLIB_param_vanillaFog) then {execVM "scripts\server\game\fucking_set_fog.sqf";};
execVM "scripts\server\game\manage_time.sqf";
execVM "scripts\server\game\manage_weather.sqf";
execVM "scripts\server\game\playtime.sqf";
execVM "scripts\server\game\save_manager.sqf";
execVM "scripts\server\game\spawn_radio_towers.sqf";
execVM "scripts\server\game\synchronise_vars.sqf";
execVM "scripts\server\game\synchronise_eco.sqf";
execVM "scripts\server\game\zeus_synchro.sqf";
execVM "scripts\server\offloading\show_fps.sqf";
execVM "scripts\server\patrols\civilian_patrols.sqf";
execVM "scripts\server\patrols\manage_patrols.sqf";
execVM "scripts\server\patrols\reinforcements_resetter.sqf";
// AA turret manager
execVM "scripts\server\ai\AA_turret_manager.sqf";
if (KPLIB_param_logistic) then {execVM "scripts\server\resources\manage_logistics.sqf";};
execVM "scripts\server\resources\manage_resources.sqf";
execVM "scripts\server\resources\recalculate_resources.sqf";
execVM "scripts\server\resources\recalculate_timer.sqf";
execVM "scripts\server\resources\recalculate_timer_sector.sqf";
execVM "scripts\server\resources\unit_cap.sqf";
execVM "scripts\server\sector\lose_sectors.sqf";

KPLIB_fsm_sectorMonitor = [] call KPLIB_fnc_sectorMonitor;
if (KPLIB_param_highCommand) then {KPLIB_fsm_highcommand = [] call KPLIB_fnc_highcommand;};

// Select FOB templates
switch (KPLIB_presetEnemy) do {
    case 1: {
        KPLIB_fob_templates = [
            "fobhunt_templates\apex\template1.sqf",
            "fobhunt_templates\apex\template2.sqf",
            "fobhunt_templates\apex\template3.sqf",
            "fobhunt_templates\apex\template4.sqf",
            "fobhunt_templates\apex\template5.sqf"
        ];
    };
    case 12: {
        KPLIB_fob_templates = [
            "fobhunt_templates\unsung\template1.sqf",
            "fobhunt_templates\unsung\template2.sqf",
            "fobhunt_templates\unsung\template3.sqf",
            "fobhunt_templates\unsung\template4.sqf",
            "fobhunt_templates\unsung\template5.sqf"
        ];
    };
    default {
        KPLIB_fob_templates = [
            "fobhunt_templates\default\template1.sqf",
            "fobhunt_templates\default\template2.sqf",
            "fobhunt_templates\default\template3.sqf",
            "fobhunt_templates\default\template4.sqf",
            "fobhunt_templates\default\template5.sqf",
            "fobhunt_templates\default\template6.sqf",
            "fobhunt_templates\default\template7.sqf",
            "fobhunt_templates\default\template8.sqf",
            "fobhunt_templates\default\template9.sqf",
            "fobhunt_templates\default\template10.sqf"
        ];
    };
};

// Civil Reputation
execVM "scripts\server\civrep\init_module.sqf";

// Civil Informant
execVM "scripts\server\civinformant\init_module.sqf";

// Asymmetric Threats
execVM "scripts\server\asymmetric\init_module.sqf";

// Groupcheck for deletion when empty
execVM "scripts\server\offloading\group_diag.sqf";

{
    if ((_x != player) && (_x distance (markerPos KPLIB_respawn_marker) < 200 )) then {
        if (isNull objectParent _x) then {deleteVehicle _x} else {(objectParent _x) deleteVehicleCrew _x};
    };
} forEach allUnits;

// Server Restart Script from K4s0
if (KPLIB_param_restart > 0) then {
    execVM "scripts\server\game\server_restart.sqf";
};
