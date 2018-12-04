_grp = _this select 0;
_flagpos = _this select 1;
_basepos = getpos (leader _grp);
_is_infantry = false;
if ( vehicle (leader _grp) == (leader _grp) ) then { _is_infantry = true };

sleep 5;
while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
sleep 1;
{_x doFollow leader _grp} foreach units _grp;
sleep 1;

if ( _is_infantry ) then {
	_waypoint = _grp addWaypoint [_flagpos, 150];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "SAFE";
	_waypoint setWaypointCombatMode "YELLOW";
	_waypoint setWaypointSpeed "LIMITED";
	_waypoint setWaypointCompletionRadius 10;

	_waypoint = _grp addWaypoint [_flagpos,150];
	_waypoint setWaypointType "MOVE";
	_waypoint = _grp addWaypoint [_flagpos, 150];
	_waypoint setWaypointType "MOVE";
	_waypoint = _grp addWaypoint [_flagpos, 150];
	_waypoint setWaypointType "MOVE";

	_waypoint = _grp addWaypoint [_flagpos, 150];
	_waypoint setWaypointType "CYCLE";
} else {
	_waypoint = _grp addWaypoint [_basepos, 1];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "SAFE";
	_waypoint setWaypointCombatMode "YELLOW";
	_waypoint setWaypointSpeed "LIMITED";
	_waypoint setWaypointCompletionRadius 30;
};

_grp setCurrentWaypoint [_grp, 0];

waitUntil {
	sleep 10;
	( { alive _x } count (units _grp) == 0 ) || !(isNull ((leader _grp) findNearestEnemy (leader _grp)))
};

if ( { alive _x } count (units _grp) > 0 ) then {
	while {(count (waypoints _grp)) != 0} do { deleteWaypoint ((waypoints _grp) select 0) };
	sleep 1;
	{_x doFollow leader _grp} foreach units _grp;
	sleep 1;
	_waypoint = _grp addWaypoint [_basepos, 150];
	_waypoint setWaypointType "SAD";
	_waypoint setWaypointBehaviour "COMBAT";
	_waypoint setWaypointCombatMode "YELLOW";
	_waypoint setWaypointSpeed "LIMITED";
	_waypoint = _grp addWaypoint [_basepos, 150];
	_waypoint setWaypointType "SAD";
	_waypoint = _grp addWaypoint [_basepos, 150];
	_waypoint setWaypointType "SAD";
	_waypoint = _grp addWaypoint [_basepos, 150];
	_waypoint setWaypointType "SAD";
	_waypoint = _grp addWaypoint [_basepos, 150];
	_waypoint setWaypointType "CYCLE";
	_grp setCurrentWaypoint [_grp, 0];
};