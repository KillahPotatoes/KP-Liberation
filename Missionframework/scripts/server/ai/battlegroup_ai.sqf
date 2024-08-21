params [
    ["_grp", grpNull, [grpNull]]
];

if (isNull _grp) exitWith {};

private _objPos = [getPos (leader _grp)] call KPLIB_fnc_getNearestBluforObjective;

[_objPos] remoteExec ["remote_call_incoming"];

private _startpos = getPos (leader _grp);


private _waypoint = [];
{ deleteWaypoint _x } forEachReversed waypoints _grp;
{_x doFollow leader _grp} forEach units _grp;

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
