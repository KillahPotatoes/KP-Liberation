params [
    ["_grp", grpNull, [grpNull]]
];

if (isNull _grp) exitWith {};
if (isNil "reset_battlegroups_ai") then {reset_battlegroups_ai = false};

sleep (5 + (random 5));

private _objPos = [getPos (leader _grp)] call KPLIB_fnc_getNearestBluforObjective;

[_objPos] remoteExec ["remote_call_incoming"];

private _startpos = getPos (leader _grp);

private _waypoint = [];
while {((getPos (leader _grp)) distance _startpos) < 100} do {

    while {!((waypoints _grp) isEqualTo [])} do {deleteWaypoint ((waypoints _grp) select 0);};
    {_x doFollow leader _grp} forEach units _grp;

    _startpos = getPos (leader _grp);

    _waypoint = _grp addWaypoint [_objPos, 100];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointSpeed "NORMAL";
    _waypoint setWaypointBehaviour "AWARE";
    _waypoint setWaypointCombatMode "YELLOW";
    _waypoint setWaypointCompletionRadius 30;

    _waypoint = _grp addWaypoint [_objPos, 100];
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [_objPos, 100];
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [_objPos, 100];
    _waypoint setWaypointType "SAD";
    _waypoint = _grp addWaypoint [_objPos, 100];
    _waypoint setWaypointType "CYCLE";

    sleep 90;
};

waitUntil {
    sleep 5;
    (((units _grp) select {alive _x}) isEqualTo []) || reset_battlegroups_ai
};

sleep (5 + (random 5));
reset_battlegroups_ai = false;

if (!((units _grp) isEqualTo []) && (GRLIB_endgame == 0)) then {
    [_grp] spawn battlegroup_ai;
};
