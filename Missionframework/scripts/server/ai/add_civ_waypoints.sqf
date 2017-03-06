_grp = _this select 0;
_basepos = getpos (leader _grp);

while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
{_x doFollow leader _grp} foreach units _grp;
_waypoint = _grp addWaypoint [_basepos, 150];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_basepos, 150];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_basepos, 150];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_basepos, 150];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;

_waypoint = _grp addWaypoint [_basepos, 150];
_waypoint setWaypointType "CYCLE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCombatMode "BLUE";
_waypoint setWaypointCompletionRadius 5;