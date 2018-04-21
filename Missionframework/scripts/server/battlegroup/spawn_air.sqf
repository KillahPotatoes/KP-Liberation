_planes_number = 0;
_first_objective = _this select 0;
if ( combat_readiness >= 75 ) then { _planes_number = (floor (random 2)) };

_plane_type = selectRandom opfor_air;
_air_spawnpoint = ( [ sectors_airspawn , [ _first_objective ] , { (markerpos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
_air_grp = createGroup [GRLIB_side_enemy, true];

for [ {_idx=0},{_idx < _planes_number},{_idx=_idx+1}] do {

	_air_spawnpos = markerpos _air_spawnpoint;
	_air_spawnpos = [(((_air_spawnpos select 0) + 500) - random 1000),(((_air_spawnpos select 1) + 500) - random 1000),120];

	_newvehicle = createVehicle [_plane_type, _air_spawnpos, [], 0, "FLY"];
	_newvehicle flyInHeight (120 + (random 180));
	createVehicleCrew _newvehicle;
	_newvehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
	{ _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}]; } foreach (crew _newvehicle);

	(crew _newvehicle) joinSilent _air_grp;
};

while {(count (waypoints _air_grp)) != 0} do {deleteWaypoint ((waypoints _air_grp) select 0);};
sleep 1;
{_x doFollow leader _air_grp} foreach units _air_grp;
sleep 1;

_waypoint = _air_grp addWaypoint [ _first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";
_waypoint = _air_grp addWaypoint [ _first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";
_waypoint = _air_grp addWaypoint [ _first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";
_waypoint = _air_grp addWaypoint [ _first_objective, 500];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [ _first_objective, 1000];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [ _first_objective, 2000];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [ _first_objective, 3000];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [ _first_objective, 4000];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [ _first_objective, 5000];
_waypoint setWaypointType "SAD";
_waypoint = _air_grp addWaypoint [ _first_objective, 500];
_waypoint setWaypointType "CYCLE";

_air_grp setCurrentWaypoint [ _air_grp, 2];


