add_civ_waypoints = compile preprocessFileLineNumbers "scripts\server\ai\add_civ_waypoints.sqf";
add_defense_waypoints = compile preprocessFileLineNumbers "scripts\server\ai\add_defense_waypoints.sqf";
battlegroup_ai = compile preprocessFileLineNumbers "scripts\server\ai\battlegroup_ai.sqf";
building_defence_ai = compile preprocessFileLineNumbers "scripts\server\ai\building_defence_ai.sqf";
patrol_ai = compile preprocessFileLineNumbers "scripts\server\ai\patrol_ai.sqf";
prisonner_ai = compile preprocessFileLineNumbers "scripts\server\ai\prisonner_ai.sqf";
troup_transport = compile preprocessFileLineNumbers "scripts\server\ai\troup_transport.sqf";

ied_manager = compile preprocessFileLineNumbers "scripts\server\sector\ied_manager.sqf";
manage_one_sector = compile preprocessFileLineNumbers "scripts\server\sector\manage_one_sector.sqf";
wait_to_spawn_sector = compile preprocessFileLineNumbers "scripts\server\sector\wait_to_spawn_sector.sqf";
manage_asymIED = compile preprocessFileLineNumbers "scripts\server\asymmetric\ied\manage_asymIED.sqf";
sector_guerilla = compile preprocessFileLineNumbers "scripts\server\asymmetric\random\sector_guerilla.sqf";
asym_sector_ambush = compile preprocessFileLineNumbers "scripts\server\asymmetric\random\asym_sector_ambush.sqf";
civinfo_task = compile preprocessFileLineNumbers "scripts\server\civinformant\tasks\civinfo_task.sqf";

execVM "scripts\client\misc\synchronise_vars.sqf";
execVM "scripts\client\misc\synchronise_eco.sqf";
execVM "scripts\server\offloading\show_fps.sqf";
