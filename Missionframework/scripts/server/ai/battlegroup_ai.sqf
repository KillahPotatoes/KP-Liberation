_grp = _this select 0;
_infantry = false;

if ( count _this == 2 ) then {
	_infantry = true;
};

if (isNil "reset_battlegroups_ai" ) then { reset_battlegroups_ai = false };

sleep (3 + (random 3));

while { ( count units _grp != 0 ) && ( GRLIB_endgame == 0 ) } do {

	sleep (5 + (random 5));

	private _objectivepos = ([getpos (leader _grp)] call F_getNearestBluforObjective) select 0;

	[ [ _objectivepos ] , "remote_call_incoming" ] call BIS_fnc_MP;

	private _startpos = getpos (leader _grp);

	while { ((getpos (leader _grp)) distance _startpos) < 100 } do {

		while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
		{_x doFollow leader _grp} foreach units _grp;

		_startpos = getpos (leader _grp);

		private _waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointSpeed "NORMAL";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointCompletionRadius 30;

		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "SAD";
		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "SAD";
		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "SAD";
		_waypoint = _grp addWaypoint [_objectivepos, 100];
		_waypoint setWaypointType "CYCLE";

		sleep 180;
	};

	waitUntil {
		sleep 5;
		( { alive _x } count (units _grp) == 0) || reset_battlegroups_ai;
	};
	sleep (5 + (random 5));
	reset_battlegroups_ai = false;
};