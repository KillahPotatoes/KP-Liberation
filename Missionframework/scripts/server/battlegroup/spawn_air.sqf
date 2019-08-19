params ["_first_objective"];
private _planes_number = ((floor linearConversion [40, 100, combat_readiness, 1, 3]) min 3) max 0;

if (_planes_number < 1) exitWith {};

private _plane_type = selectRandom opfor_air;
private _air_spawnpoint = ([sectors_airspawn, [_first_objective], {(markerpos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _air_grp = createGroup [GRLIB_side_enemy, true];

for "_i" from 1 to _planes_number do {
    private _air_spawnpos = markerpos _air_spawnpoint;
    _air_spawnpos = [(((_air_spawnpos select 0) + 500) - random 1000), (((_air_spawnpos select 1) + 500) - random 1000), 120];

    private _newvehicle = createVehicle [_plane_type, _air_spawnpos, [], 0, "FLY"];
    createVehicleCrew _newvehicle;
    _newvehicle flyInHeight (120 + (random 180));
    _newvehicle addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
    {_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _newvehicle);

    (crew _newvehicle) joinSilent _air_grp;
};

while {(count (waypoints _air_grp)) != 0} do {deleteWaypoint ((waypoints _air_grp) select 0);};
sleep 1;

{_x doFollow leader _air_grp} forEach (units _air_grp);
sleep 1;

private _waypoint = _air_grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _air_grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _air_grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointSpeed "FULL";
_waypoint setWaypointBehaviour "AWARE";
_waypoint setWaypointCombatMode "RED";

_waypoint = _air_grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "SAD";

_waypoint = _air_grp addWaypoint [_first_objective, 1000];
_waypoint setWaypointType "SAD";

_waypoint = _air_grp addWaypoint [_first_objective, 2000];
_waypoint setWaypointType "SAD";

_waypoint = _air_grp addWaypoint [_first_objective, 3000];
_waypoint setWaypointType "SAD";

_waypoint = _air_grp addWaypoint [_first_objective, 4000];
_waypoint setWaypointType "SAD";

_waypoint = _air_grp addWaypoint [_first_objective, 5000];
_waypoint setWaypointType "SAD";

_waypoint = _air_grp addWaypoint [_first_objective, 500];
_waypoint setWaypointType "CYCLE";

_air_grp setCurrentWaypoint [_air_grp, 2];
