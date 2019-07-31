if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_task.sqf spawned on: %1", debug_source];_text remoteExec ["diag_log",2];};

private _spawn_marker = [2000,999999,false] call F_findOpforSpawnPoint;
private _roadObj = [markerPos _spawn_marker, 400, []] call BIS_fnc_nearestRoad;

if (isNull _roadObj) exitWith {if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] civinfo_task.sqf -> no road found";_text remoteExec ["diag_log",2];};};

private _veh = createVehicle [opfor_mrap, getPos _roadObj, [], 0, "NONE"];
_veh setDir (getDir _roadObj);
{
	if ((_x find "FWheel") != -1) then {
		_veh setHitPointDamage [_x, 1];
	};
} forEach ((getAllHitPointsDamage _veh) select 0);

private _grp = createGroup [GRLIB_side_enemy, true];
private _hvt = _grp createUnit [opfor_officer, getPos _roadObj, [], 30, "NONE"];
for "_i" from 1 to 4 do {
	(selectRandom militia_squad) createUnit [_grp, _grp, "this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]"];
	sleep 0.1;
};

private _waypoint = _grp addWaypoint [getPos _roadObj, 100];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointBehaviour "SAFE";
_waypoint setWaypointCombatMode "YELLOW";
_waypoint setWaypointSpeed "LIMITED";
_waypoint setWaypointCompletionRadius 10;

_waypoint = _grp addWaypoint [getPos _roadObj, 100];
_waypoint setWaypointType "MOVE";
_waypoint = _grp addWaypoint [getPos _roadObj, 100];
_waypoint setWaypointType "MOVE";
_waypoint = _grp addWaypoint [getPos _roadObj, 100];
_waypoint setWaypointType "MOVE";

_waypoint = _grp addWaypoint [getPos _roadObj, 100];
_waypoint setWaypointType "CYCLE";

if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_task.sqf -> vehicle and group created on: %1", debug_source];_text remoteExec ["diag_log",2];};

private _marker_pos = [((((getPos _roadObj) select 0) + 200) - random 400),((((getPos _roadObj) select 1) + 200) - random 400),0];

[4, _marker_pos] remoteExec ["civinfo_notifications"];

private _time_remaining = KP_liberation_civinfo_task_duration;

while {(alive _hvt) && _time_remaining > 0} do {
	uiSleep 1;			
	private _player_near = false;
	{
		if (((_x distance _veh) < 1000) && (alive _x)) exitWith {_player_near = true};
	} foreach allPlayers;

	if !(_player_near) then {
		_time_remaining = _time_remaining - 1;
	};
	if ((KP_liberation_civinfo_debug > 0) && ((_time_remaining % 60) == 0)) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_task.sqf -> Task will despawn in %1 minutes", round (_time_remaining / 60)];_text remoteExec ["diag_log",2];};
};

if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_task.sqf -> loop exited on: %1", debug_source];_text remoteExec ["diag_log",2];};

if (alive _hvt) then {
	deleteVehicle _veh;
	{deleteVehicle _x} forEach (units _grp);
	[6] remoteExec ["civinfo_notifications"];
	if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] civinfo_task.sqf -> Task despawned";_text remoteExec ["diag_log",2];};
} else {
	combat_readiness = round (combat_readiness * 0.8);
	if (!isServer) then {
		publicVariableServer "combat_readiness";
	};
	[5] remoteExec ["civinfo_notifications"];
	if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] civinfo_task.sqf -> Task ended with success";_text remoteExec ["diag_log",2];};
};
