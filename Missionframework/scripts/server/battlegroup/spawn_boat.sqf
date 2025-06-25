//jank and mangled spawn_air implementation
params ["_first_objective"];

if (KPLIB_o_boats isEqualTo []) exitWith {false};
if (KPLIB_sectors_boatSpawn isEqualTo[]) exitWith {false};

private _boats_number = ((floor linearConversion [25, 100, KPLIB_enemyReadiness, 1, 2]) min 2) max 0;

if (_boats_number < 1) exitWith {};

private _class = selectRandom KPLIB_o_boats;
private _spawnPoint = ([KPLIB_sectors_boatSpawn, [_first_objective], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy) select 0;
private _spawnPos = [];
private _boat = objNull;
private _boats = [];
private _grp = createGroup [KPLIB_side_enemy, true];

for "_i" from 1 to _boats_number do {
    _spawnPos = markerPos _spawnPoint;
    _spawnPos = [(((_spawnPos select 0) + 5) - random 1), (((_spawnPos select 1) + 5) - random 1), 2];
    _boat = createVehicle [_class, _spawnPos, [], 0, "NONE"];
    createVehicleCrew _boat;
    _boats pushBack _boat;
    _boat addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
    [_boat] call KPLIB_fnc_addObjectInit;
    {_x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];} forEach (crew _boat);
    (crew _boat) joinSilent _grp;
    sleep 1;
};

while {!((waypoints _grp) isEqualTo [])} do {deleteWaypoint ((waypoints _grp) select 0);};
sleep 1;
{_x doFollow leader _grp} forEach (units _grp);
sleep 1;

private _boatWaypoint = [];
private _waypoint = [];

//create waypoints for boats
for "_i" from 1 to 6 do{

    _boatWaypoint = [_first_objective] call KPLIB_fnc_getBoatWaypoints;

    if(_boatWaypoint isEqualTo []) then {break};
    _waypoint = _grp addWaypoint [_boatWaypoint, 1];
    _waypoint setWayPointType "SAD";
};
//if there's no suitable waypoints for the boat, get rid of it
if (_waypoint isEqualTo []) exitWith {
    {deleteVehicle _x} forEach units _grp;
    {deleteVehicle _x} forEach _boats;
    deleteGroup _grp;
};
_waypoint = _grp addWaypoint [_boatWaypoint,1];
_waypoint setWaypointType "CYCLE";

_grp setCurrentWaypoint [_grp, 2];

// wait and check if the boat has moved yet, and delete it if not (boats won't move if their waypoint can't be reached)
// this is really only necessary on maps with sectors near lakes, which the script would interpret as good waypoints, but would be typically inaccessible
// sleep 15 since with scheduled things spawning of boats can be a bit delayed and with lower timers they could be deleted before they have a chance to move
// checks the first boat in the array since the lead boat will sit still if the waypoint is inaccesssible, but the follower boat will constantly drive around the leader
sleep 15;

if(abs(speed (_boats select 0)) < 5) exitWith{
    {deleteVehicle _x} forEach units _grp;
    {deleteVehicle _x} forEach _boats;
    deleteGroup _grp;
};