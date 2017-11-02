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
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\sector_manager.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\spot_timer.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_vars.sqf";
	[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
};

// This causes the script error with not defined variable _display in File A3\functions_f_bootcamp\Inventory\fn_arsenal.sqf [BIS_fnc_arsenal], line 2122
// ["Preload"] call BIS_fnc_arsenal;
spawn_camera = compileFinal preprocessFileLineNumbers "scripts\client\spawn\spawn_camera.sqf";
cinematic_camera = compileFinal preprocessFileLineNumbers "scripts\client\ui\cinematic_camera.sqf";
write_credit_line = compileFinal preprocessFileLineNumbers "scripts\client\ui\write_credit_line.sqf";
do_load_box = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";
kp_fuel_consumption = compileFinal preprocessFileLineNumbers "scripts\client\misc\kp_fuel_consumption.sqf";
kp_cr_checkVehicle = compileFinal preprocessFileLineNumbers "scripts\client\civrep\kp_cr_checkVehicle.sqf";

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\intel_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\recycle_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\actions\unflip_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\ammobox_action_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\build_overlay.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\build\do_build.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\commander\enforce_whitelist.sqf";
if (KP_liberation_mapmarkers) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\empty_vehicles_marker.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\fob_markers.sqf";
if (KP_liberation_mapmarkers) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\group_icons.sqf";};
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\hostile_groups.sqf";
if (KP_liberation_mapmarkers) then {[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\huron_marker.sqf";} else {deleteMarker "huronmarker"};
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
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\synchronise_eco.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\misc\vehicle_permissions.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\spawn\redeploy_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\ui_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\tutorial_manager.sqf";
[] spawn compileFinal preprocessFileLineNumbers "scripts\client\markers\update_production_sites.sqf";

player addMPEventHandler ["MPKilled", {_this spawn kill_manager;}];
player addEventHandler ["GetInMan", {[_this select 2] spawn kp_fuel_consumption;}];
player addEventHandler ["GetInMan", {[_this select 2] spawn kp_cr_checkVehicle;}];
player addEventHandler ["fired", {_this execvm "scripts\shared\RHS_disposables.sqf"}]; //necr was here
//LUL WHAT DLC???
if !(288520 in getDLCs 1) then
{
	[player addAction ["<t color='#00FFFF'>Get in as Driver</t>", "scripts\shared\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'Kart_01_Base_F' && player distance cursorTarget < 3.4 && isNull driver cursorTarget"]] ;
};
if !(304380 in getDLCs 1) then
{
	[player addAction ["<t color='#00FFFF'>Get in as Driver</t>", "scripts\shared\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'O_Heli_Transport_04_F'||'B_Heli_Transport_03_unarmed_F' && player distance cursorTarget < 10 && isNull driver cursorTarget"]] ;
};
if !(571710 in getDLCs 1) then
{
	[player addAction ["<t color='#00FFFF'>Get in as Driver</t>", "scripts\shared\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'C_Van_02_medevac_F'||'C_Van_02_vehicle_F'||'C_Van_02_service_F'||'C_Van_02_transport_F' && player distance cursorTarget < 10 && isNull driver cursorTarget"]] ;
};
if !(601670 in getDLCs 1) then
{
	[player addAction ["<t color='#00FFFF'>Get in as Driver</t>", "scripts\shared\moveInDriver.sqf", [], 6, true, true, "", "cursorTarget isKindOf 'I_Plane_Fighter_04_F'||'B_Plane_Fighter_01_F'||'B_Plane_Fighter_01_Stealth_F'||'O_Plane_Fighter_02_F' && player distance cursorTarget < 10 && isNull driver cursorTarget"]] ;
};
player addAction ["<t color='#2E9AFE'>Parachute</t>", "scripts\shared\para.sqf", nil, 2, true, true, "", "vehicle player == player && getpos player select 2 >30;"];
player addAction ["<t color='#FF0000'>Emergency eject</t>", "scripts\shared\forceEject.sqf", nil, 19, false, true, "", "(vehicle player) isKindOf 'Air'"];
player addAction ["<t color='#FF0000'>Holster</t>", "player action ['SwitchWeapon', player, player, 100];", nil, -11, false, false, "", "currentWeapon player != '' && vehicle player == player"];
player addAction ["<t color='#FF0000'>UnHolster</t>", "player action ['SwitchWeapon', player, player, 0];", nil, -11, false, false, "", "currentWeapon player == '' && vehicle player == player"];
player addAction ["<t color='#FF0000'>Clean up</t>", "scripts\shared\removeRuins.sqf", nil, 2, false, false, "", "count nearestObjects [player, ['Ruins', 'CraterLong', 'CraterLong_small'], 5] > 0"];
[] spawn compileFinal preprocessFileLineNumbers GOM_fnc_addAircraftLoadout;

{
	[_x] call BIS_fnc_drawCuratorLocations;
} foreach allCurators;

[] spawn compileFinal preprocessFileLineNumbers "scripts\client\ui\intro.sqf";

[] execVM "onPlayerRespawn.sqf";

[player] joinSilent (createGroup GRLIB_side_friendly);
