// AI
add_civ_waypoints = compileFinal preprocessFileLineNumbers "scripts\server\ai\add_civ_waypoints.sqf";
add_defense_waypoints = compileFinal preprocessFileLineNumbers "scripts\server\ai\add_defense_waypoints.sqf";
battlegroup_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\battlegroup_ai.sqf";
building_defence_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\building_defence_ai.sqf";
patrol_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\patrol_ai.sqf";
prisonner_ai = compileFinal preprocessFileLineNumbers "scripts\server\ai\prisonner_ai.sqf";
troup_transport = compileFinal preprocessFileLineNumbers "scripts\server\ai\troup_transport.sqf";

// Battlegroup
spawn_air = compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\spawn_air.sqf";
spawn_battlegroup = compileFinal preprocessFileLineNumbers "scripts\server\battlegroup\spawn_battlegroup.sqf";

// Game
check_victory_conditions = compileFinal preprocessFileLineNumbers "scripts\server\game\check_victory_conditions.sqf";

// Patrol
manage_one_civilian_patrol = compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_one_civilian_patrol.sqf";
manage_one_patrol = compileFinal preprocessFileLineNumbers "scripts\server\patrols\manage_one_patrol.sqf";
reinforcements_manager = compileFinal preprocessFileLineNumbers "scripts\server\patrols\reinforcements_manager.sqf";
send_paratroopers = compileFinal preprocessFileLineNumbers "scripts\server\patrols\send_paratroopers.sqf";

// Secondary objectives
fob_hunting = compileFinal preprocessFileLineNumbers "scripts\server\secondary\fob_hunting.sqf";
convoy_hijack = compileFinal preprocessFileLineNumbers "scripts\server\secondary\convoy_hijack.sqf";
search_and_rescue = compileFinal preprocessFileLineNumbers "scripts\server\secondary\search_and_rescue.sqf";

// Sector
attack_in_progress_fob = compileFinal preprocessFileLineNumbers "scripts\server\sector\attack_in_progress_fob.sqf";
attack_in_progress_sector = compileFinal preprocessFileLineNumbers "scripts\server\sector\attack_in_progress_sector.sqf";
destroy_fob = compileFinal preprocessFileLineNumbers "scripts\server\sector\destroy_fob.sqf";
ied_manager = compileFinal preprocessFileLineNumbers "scripts\server\sector\ied_manager.sqf";
manage_captureboxes = compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_captureboxes.sqf";
manage_intel = compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_intel.sqf";
manage_one_sector = compileFinal preprocessFileLineNumbers "scripts\server\sector\manage_one_sector.sqf";
wait_to_spawn_sector = compileFinal preprocessFileLineNumbers "scripts\server\sector\wait_to_spawn_sector.sqf";

execVM "scripts\server\base\startgame.sqf";
execVM "scripts\server\base\huron_manager.sqf";
execVM "scripts\server\base\startvehicle_spawn.sqf";
execVM "scripts\server\battlegroup\counter_battlegroup.sqf";
execVM "scripts\server\battlegroup\random_battlegroups.sqf";
execVM "scripts\server\battlegroup\readiness_increase.sqf";
execVM "scripts\server\game\apply_default_permissions.sqf";
execVM "scripts\server\game\apply_saved_scores.sqf";
execVM "scripts\server\game\capture_vehicles.sqf";
execVM "scripts\server\game\clean.sqf";
execVM "scripts\server\game\cleanup_vehicles.sqf";
execVM "scripts\server\game\manage_time.sqf";
if (!KP_liberation_ace) then {execVM "scripts\server\game\manage_weather.sqf";};
execVM "scripts\server\game\periodic_save.sqf";
execVM "scripts\server\game\playtime.sqf";
execVM "scripts\server\game\save_manager.sqf";
execVM "scripts\server\game\spawn_radio_towers.sqf";
execVM "scripts\server\game\synchronise_vars.sqf";
execVM "scripts\server\game\synchronise_eco.sqf";
execVM "scripts\server\game\zeus_synchro.sqf";
execVM "scripts\server\offloading\offload_calculation.sqf";
execVM "scripts\server\offloading\offload_manager.sqf";
execVM "scripts\server\offloading\show_fps.sqf";
execVM "scripts\server\patrols\civilian_patrols.sqf";
execVM "scripts\server\patrols\manage_patrols.sqf";
execVM "scripts\server\patrols\reinforcements_resetter.sqf";
if (KP_liberation_ailogistics) then {execVM "scripts\server\resources\manage_logistics.sqf";};
execVM "scripts\server\resources\manage_resources.sqf";
execVM "scripts\server\resources\recalculate_resources.sqf";
execVM "scripts\server\resources\recalculate_timer.sqf";
execVM "scripts\server\resources\recalculate_timer_sector.sqf";
execVM "scripts\server\resources\unit_cap.sqf";
execVM "scripts\server\sector\lose_sectors.sqf";
execVM "scripts\server\sector\manage_sectors.sqf";

// Civil Reputation
execVM "scripts\server\civrep\init_module.sqf";

// Civil Informant
execVM "scripts\server\civinformant\init_module.sqf";

// Asymmetric Threats
execVM "scripts\server\asymmetric\init_module.sqf";

// Groupcheck for deletion when empty
execVM "scripts\server\offloading\group_diag.sqf";

{
	if ( (_x != player) && (_x distance (getmarkerpos GRLIB_respawn_marker) < 200 ) ) then {
		deleteVehicle _x;
	};
} foreach allUnits;

// Server Restart Script from K4s0
if (KP_liberation_restart > 0) then {
	execVM "scripts\server\game\server_restart.sqf";
};
