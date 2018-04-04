private _convoy_destinations_markers = [];
private _load_box_fnc = compileFinal preprocessFileLineNumbers "scripts\client\ammoboxes\do_load_box.sqf";

while { count _convoy_destinations_markers < 3 } do { _convoy_destinations_markers pushback ([2000,999999,false] call F_findOpforSpawnPoint); };

private _couldnt_spawn = false;
{ if ( _x == "" ) exitWith { _couldnt_spawn = true; }; } foreach _convoy_destinations_markers;
if ( _couldnt_spawn ) exitWith { diag_log "[KP LIBERATION] [ERROR] Could not find enough map positions for convoy hijack mission"; };

private _convoy_destinations = [];
{ _convoy_destinations pushback (getMarkerPos _x); } foreach _convoy_destinations_markers;

private _spawnpos = _convoy_destinations select 0;
[4, _spawnpos] remoteExec ["remote_call_intel"];

private _scout_vehicle = [_spawnpos getPos [30, 0], opfor_mrap, true, false] call F_libSpawnVehicle;
private _escort_vehicle = [_spawnpos getPos [10, 0], selectRandom opfor_vehicles_low_intensity, true, false] call F_libSpawnVehicle;
private _transport_vehicle = [_spawnpos getPos [10, 180], opfor_ammobox_transport, true, false] call F_libSpawnVehicle;

private _boxes_amount = 0;
{
	if ( _x select 0 == opfor_ammobox_transport ) exitWith { _boxes_amount = (count _x) - 2 };
} foreach box_transport_config;

if ( _boxes_amount == 0 ) exitWith { diag_log "[KP LIBERATION] [ERROR] Opfor ammobox truck classname doesn't allow for ammobox transport, correct your classnames.sqf"; };

GRLIB_secondary_in_progress = 1; publicVariable "GRLIB_secondary_in_progress";

private _boxes_loaded = 0;

while { _boxes_loaded < _boxes_amount } do {
	_boxes_loaded = _boxes_loaded + 1;
	sleep 0.5;
	private _next_box = [KP_liberation_ammo_crate, 100, _spawnpos getPos [15, 135]] call F_createCrate;
	sleep 0.5;
	[_next_box, 50] call _load_box_fnc;
};

sleep 0.5;

private _troop_vehicle = [_spawnpos getPos [30, 180], opfor_transport_truck, true, true, false ] call F_libSpawnVehicle;

sleep 0.5;

private _convoy_group = group driver _scout_vehicle;
( crew _escort_vehicle + crew _transport_vehicle + crew _troop_vehicle ) joinSilent _convoy_group;

sleep 0.5;

{
	_x addEventHandler ["HandleDamage", { private [ "_damage" ]; if ( side (_this select 3) != GRLIB_side_friendly ) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ];
} foreach [ _scout_vehicle, _escort_vehicle, _transport_vehicle, _troop_vehicle ];

_convoy_group setFormation "FILE";
_convoy_group setBehaviour "SAFE";
_convoy_group setCombatMode "GREEN";
_convoy_group setSpeedMode "LIMITED";

while {(count (waypoints _convoy_group)) != 0} do {deleteWaypoint ((waypoints _convoy_group) select 0);};
{_x doFollow leader _convoy_group} foreach units _convoy_group;

_waypoint = _convoy_group addWaypoint [_convoy_destinations select 1, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [_convoy_destinations select 2, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [_convoy_destinations select 0, 0];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;

_waypoint = _convoy_group addWaypoint [_convoy_destinations select 0, 0];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointCompletionRadius 50;

private _troops_group = createGroup [GRLIB_side_enemy, true];
{_x createUnit [_spawnpos, _troops_group,"this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]", 0.5, "private"];} foreach (["army"] call F_getAdaptiveSquadComp);
{_x moveInCargo _troop_vehicle} foreach (units _troops_group);

private _convoy_marker = createMarkerLocal [ format [ "convoymarker%1", round time], getpos _transport_vehicle ];
_convoy_marker setMarkerText (localize "STR_SECONDARY_CSAT_CONVOY");
_convoy_marker setMarkerType "o_armor";
_convoy_marker setMarkerColor GRLIB_color_enemy_bright;

private _convoy_marker_wp1 = createMarkerLocal [ format [ "convoymarkerwp1%1", round time], _convoy_destinations select 0];
private _convoy_marker_wp2 = createMarkerLocal [ format [ "convoymarkerwp2%1", round time], _convoy_destinations select 1];
private _convoy_marker_wp3 = createMarkerLocal [ format [ "convoymarkerwp3%1", round time], _convoy_destinations select 2];

{
	_x setMarkerText (localize "STR_SECONDARY_CSAT_CONVOY_WP");
	_x setMarkerType "o_armor";
	_x setMarkerColor GRLIB_color_enemy_bright;
	_x setMarkerSize [0.6, 0.6];
} foreach [_convoy_marker_wp1, _convoy_marker_wp2, _convoy_marker_wp3];

private _mission_in_progress = true;
private _convoy_attacked = false;
private _convoy_flee = false;
private _disembark_troops = false;

while { _mission_in_progress } do {

	if ( !(alive _transport_vehicle) || !(alive driver _transport_vehicle) ) then {
		_mission_in_progress = false;
	};

	_convoy_marker setMarkerPos (getpos _transport_vehicle);

	if ( !_convoy_attacked ) then {
		{
			if ( !(alive _x) || (damage _x > 0.3) || !(alive driver _x)) exitWith { _convoy_attacked = true; };
		} foreach [_scout_vehicle, _escort_vehicle, _transport_vehicle, _troop_vehicle];
	};

	if ( _convoy_attacked && !_disembark_troops) then {

		_disembark_troops = true;

		if (alive (driver _troop_vehicle)) then {
			private _troop_driver_group = createGroup [GRLIB_side_enemy, true];
			[ driver _troop_vehicle ] joinSilent _troop_driver_group;
			sleep 1;
			while {(count (waypoints _troop_driver_group)) != 0} do {deleteWaypoint ((waypoints _troop_driver_group) select 0);};
			_waypoint = _troop_driver_group addWaypoint [getpos _troop_vehicle, 0];
			_waypoint setWaypointType "MOVE";
			sleep 3;
		};

		{
			unAssignVehicle _x;
			_x action ["eject", vehicle _x];
			_x action ["getout", vehicle _x];
			unAssignVehicle _x;
			sleep 0.7;
		} foreach (units _troops_group);

		_troops_group setBehaviour "COMBAT";
		_troops_group setCombatMode "RED";
	};

	if ( _convoy_attacked && !_convoy_flee) then {
		_convoy_flee = true;
		_convoy_group setBehaviour "COMBAT";
		_convoy_group setSpeedMode "FULL";
	};

	sleep 5;
};

sleep 20;

deleteMarker _convoy_marker;
{ deleteMarker _x } foreach [_convoy_marker_wp1, _convoy_marker_wp2, _convoy_marker_wp3 ];

combat_readiness = round (combat_readiness * 0.85);
stats_secondary_objectives = stats_secondary_objectives + 1;
[5] remoteExec ["remote_call_intel"];
GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress";
sleep 1;
trigger_server_save = true;
