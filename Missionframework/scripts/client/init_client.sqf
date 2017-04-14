[] call compileFinal preprocessFileLineNumbers "scripts\client\misc\init_markers.sqf";
switch (KP_liberation_arsenal) do {
	case 0: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\useBlacklist.sqf";};
	case 1: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\custom.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\killahpotatoes.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf_ace.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\rhsusaf_ace_acre.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "arsenal_presets\useBlacklist.sqf";};
};

if ( typeOf player == "VirtualSpectator_F" ) exitWith {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
};

["Preload"] call BIS_fnc_arsenal;
respawn_lhd = compileFinal preprocessFileLineNumbers "scripts\client\spawn\respawn_lhd.sqf";
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";
do_load_box = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\intel_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\recycle_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\ammobox_action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\build_overlay.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\commander\enforce_whitelist.sqf";
if (KP_liberation_mapmarkers == 1) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
if (KP_liberation_mapmarkers == 1) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
if (KP_liberation_mapmarkers == 1) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\huron_marker.sqf";} else {deleteMarker "huronmarker"};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\broadcast_squad_colors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\disable_remote_sensors.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\init_arsenal.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\offload_diag.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\permissions_warning.sqf";
if (!KP_liberation_ace) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\resupply_manager.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\secondary_jip.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stay_leader.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\stop_renegade.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_permissions.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\spawn\redeploy_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\tutorial_manager.sqf";

player addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
player addEventHandler ["GetInMan", {[_this select 2] execVM "scripts\client\misc\kp_fuel_consumption.sqf";}];

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";

[] execVM "onPlayerRespawn.sqf";

[player] joinSilent (createGroup GRLIB_side_friendly);
