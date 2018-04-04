params ["_targetsector"];
private _targetpos = getMarkerPos _targetsector;
private _spawnsector = ([sectors_airspawn, [_targetpos], {(markerpos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;

private _chopper_type = selectRandom opfor_choppers;

while {!(_chopper_type in opfor_troup_transports)} do {
	_chopper_type = selectRandom opfor_choppers;
};

private _newvehicle = createVehicle [_chopper_type, markerpos _spawnsector, [], 0, "FLY"];
createVehicleCrew _newvehicle;
sleep 0.1;

private _pilot_group = createGroup [GRLIB_side_enemy, true];
(crew _newvehicle) joinSilent _pilot_group;

private _para_group = createGroup [GRLIB_side_enemy, true];

_newvehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
{_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _newvehicle);

while {(count (units _para_group)) < 8} do {
	opfor_paratrooper createUnit [getmarkerpos _spawnsector, _para_group, "this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]"];
};

{removeBackpack _x; _x addBackPack "B_parachute"; _x moveInCargo _newvehicle;} forEach (units _para_group);

while {(count (waypoints _pilot_group)) != 0} do {deleteWaypoint ((waypoints _pilot_group) select 0);};
while {(count (waypoints _para_group)) != 0} do {deleteWaypoint ((waypoints _para_group) select 0);};
sleep 0.2;
{_x doFollow leader _pilot_group} forEach units _pilot_group;
{_x doFollow leader _para_group} forEach units _para_group;
sleep 0.2;

_newvehicle flyInHeight 100;

_waypoint = _pilot_group addWaypoint [_targetpos, 25];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _pilot_group addWaypoint [_targetpos, 25];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "CARELESS";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _pilot_group addWaypoint [_targetpos, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _pilot_group addWaypoint [_targetpos, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_waypoint = _pilot_group addWaypoint [_targetpos, 700];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 100;
_pilot_group setCurrentWaypoint [_pilot_group, 1];

_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "NORMAL";
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointCompletionRadius 50;
_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointCompletionRadius 50;
_pilot_group setCurrentWaypoint [_para_group, 1];

_newvehicle flyInHeight 100;

waitUntil {sleep 1;
	!(alive _newvehicle) || (damage _newvehicle > 0.2 ) || (_newvehicle distance _targetpos < 400 )
};

_newvehicle flyInHeight 100;

{
	unassignVehicle _x;
	moveout _x;
	sleep 0.5;
} forEach (units _para_group);

_newvehicle flyInHeight 100;

sleep 0.2;
while {(count (waypoints _pilot_group)) != 0} do {deleteWaypoint ((waypoints _pilot_group) select 0);};
while {(count (waypoints _para_group)) != 0} do {deleteWaypoint ((waypoints _para_group) select 0);};
sleep 0.2;
{_x doFollow leader _pilot_group} foreach units _pilot_group;
{_x doFollow leader _para_group} foreach units _para_group;
sleep 0.2;

_newvehicle flyInHeight 100;

_waypoint = _pilot_group addWaypoint [_targetpos, 200];
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "RED";
_waypoint setWaypointType "SAD";
_waypoint = _pilot_group addWaypoint [_targetpos, 200];
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "RED";
_waypoint setWaypointType "SAD";
_waypoint = _pilot_group addWaypoint [_targetpos, 200];
_waypoint setWaypointBehaviour "COMBAT";
_waypoint setWaypointCombatMode "RED";
_waypoint setWaypointType "SAD";
_waypoint = _pilot_group addWaypoint [_targetpos, 200];
_waypoint setWaypointType "SAD";
_waypoint = _pilot_group addWaypoint [_targetpos, 200];
_waypoint setWaypointType "SAD";
_pilot_group setCurrentWaypoint [_pilot_group, 1];
_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "SAD";
_waypoint = _para_group addWaypoint [_targetpos, 100];
_waypoint setWaypointType "SAD";
_pilot_group setCurrentWaypoint [_para_group, 1];
