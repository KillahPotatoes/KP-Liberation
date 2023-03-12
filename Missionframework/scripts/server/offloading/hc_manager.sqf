add_civ_waypoints = compileScript ["scripts\server\ai\add_civ_waypoints.sqf", true];
add_defense_waypoints = compileScript ["scripts\server\ai\add_defense_waypoints.sqf", true];
battlegroup_ai = compileScript ["scripts\server\ai\battlegroup_ai.sqf", true];
building_defence_ai = compileScript ["scripts\server\ai\building_defence_ai.sqf", true];
patrol_ai = compileScript ["scripts\server\ai\patrol_ai.sqf", true];
prisonner_ai = compileScript ["scripts\server\ai\prisonner_ai.sqf", true];
troup_transport = compileScript ["scripts\server\ai\troup_transport.sqf", true];

ied_manager = compileScript ["scripts\server\sector\ied_manager.sqf", true];
manage_one_sector = compileScript ["scripts\server\sector\manage_one_sector.sqf", true];
wait_to_spawn_sector = compileScript ["scripts\server\sector\wait_to_spawn_sector.sqf", true];
manage_asymIED = compileScript ["scripts\server\asymmetric\ied\manage_asymIED.sqf", true];
sector_guerilla = compileScript ["scripts\server\asymmetric\random\sector_guerilla.sqf", true];
asym_sector_ambush = compileScript ["scripts\server\asymmetric\random\asym_sector_ambush.sqf", true];
civinfo_task = compileScript ["scripts\server\civinformant\tasks\civinfo_task.sqf", true];

execVM "scripts\client\misc\synchronise_vars.sqf";
execVM "scripts\client\misc\synchronise_eco.sqf";
execVM "scripts\server\offloading\show_fps.sqf";
