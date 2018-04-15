[] call compileFinal preprocessFileLineNumbers "scripts\client\misc\init_markers.sqf";
switch (KP_liberation_arsenal) do {
	case 1: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\custom.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\killahpotatoes.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf_ace.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf_ace_acre.sqf";};
	case 6: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\3cbBAF.sqf";};
	default {GRLIB_arsenal_weapons = [];GRLIB_arsenal_magazines = [];GRLIB_arsenal_items = [];GRLIB_arsenal_backpacks = [];};
};

if ( typeOf player == "VirtualSpectator_F" ) exitWith {
	execVM "scripts\client\markers\empty_vehicles_marker.sqf";
	execVM "scripts\client\markers\fob_markers.sqf";
	execVM "scripts\client\markers\group_icons.sqf";
	execVM "scripts\client\markers\hostile_groups.sqf";
	execVM "scripts\client\markers\sector_manager.sqf";
	execVM "scripts\client\markers\spot_timer.sqf";
	execVM "scripts\client\misc\synchronise_vars.sqf";
	execVM "scripts\client\ui\ui_manager.sqf";
};

// This causes the script error with not defined variable _display in File A3\functions_f_bootcamp\Inventory\fn_arsenal.sqf [BIS_fnc_arsenal], line 2122
// ["Preload"] call BIS_fnc_arsenal;
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";
do_load_box = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";
kp_fuel_consumption = compileFinal preprocessFileLineNumbers "scripts\client\misc\kp_fuel_consumption.sqf";
kp_cr_checkVehicle = compileFinal preprocessFileLineNumbers "scripts\client\civrep\kp_cr_checkVehicle.sqf";

execVM "scripts\client\actions\action_manager.sqf";
execVM "scripts\client\actions\intel_manager.sqf";
execVM "scripts\client\actions\recycle_manager.sqf";
execVM "scripts\client\actions\unflip_manager.sqf";
execVM "scripts\client\ammoboxes\ammobox_action_manager.sqf";
execVM "scripts\client\build\build_overlay.sqf";
execVM "scripts\client\build\do_build.sqf";
execVM "scripts\client\commander\enforce_whitelist.sqf";
if (KP_liberation_mapmarkers) then {execVM "scripts\client\markers\empty_vehicles_marker.sqf";};
execVM "scripts\client\markers\fob_markers.sqf";
if (KP_liberation_mapmarkers) then {execVM "scripts\client\markers\group_icons.sqf";};
execVM "scripts\client\markers\hostile_groups.sqf";
if (KP_liberation_mapmarkers) then {execVM "scripts\client\markers\huron_marker.sqf";} else {deleteMarker "huronmarker"};
execVM "scripts\client\markers\sector_manager.sqf";
execVM "scripts\client\markers\spot_timer.sqf";
execVM "scripts\client\misc\broadcast_squad_colors.sqf";
execVM "scripts\client\misc\disable_remote_sensors.sqf";
execVM "scripts\client\misc\init_arsenal.sqf";
execVM "scripts\client\misc\offload_diag.sqf";
execVM "scripts\client\misc\permissions_warning.sqf";
if (!KP_liberation_ace) then {execVM "scripts\client\misc\resupply_manager.sqf";};
execVM "scripts\client\misc\secondary_jip.sqf";
execVM "scripts\client\misc\stop_renegade.sqf";
execVM "scripts\client\misc\synchronise_vars.sqf";
execVM "scripts\client\misc\synchronise_eco.sqf";
execVM "scripts\client\misc\vehicle_permissions.sqf";
execVM "scripts\client\spawn\redeploy_manager.sqf";
execVM "scripts\client\ui\ui_manager.sqf";
execVM "scripts\client\ui\tutorial_manager.sqf";
execVM "scripts\client\markers\update_production_sites.sqf";

player addMPEventHandler ["MPKilled", {_this spawn kill_manager;}];
player addEventHandler ["GetInMan", {[_this select 2] spawn kp_fuel_consumption;}];
player addEventHandler ["GetInMan", {[_this select 2] spawn kp_cr_checkVehicle;}];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

execVM "scripts\client\ui\intro.sqf";

[] execVM "onPlayerRespawn.sqf";

[player] joinSilent (createGroup [GRLIB_side_friendly, true]);
