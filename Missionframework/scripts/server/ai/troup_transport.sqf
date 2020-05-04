params [
    ["_transVeh", objNull, [objNull]]
];

if (isNull _transVeh) exitWith {};
sleep 1;

private _transGrp = (group (driver _transVeh));
private _start_pos = getpos _transVeh;
private _objPos =  [getpos _transVeh] call KPLIB_fnc_getNearestBluforObjective;
private _unload_distance = 500;
private _crewcount = count crew _transVeh;

waitUntil {
    sleep 0.2;
    !(alive _transVeh) ||
    !(alive (driver _transVeh)) ||
    (((_transVeh distance _objPos) < _unload_distance) && !(surfaceIsWater (getpos _transVeh)))
};

if ((alive _transVeh) && (alive (driver _transVeh))) then {
    _infGrp = createGroup [GRLIB_side_enemy, true];

    {
        [_x, _start_pos, _infGrp, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
    } foreach ([] call KPLIB_fnc_getSquadComp);

    {_x moveInCargo _transVeh} forEach (units _infGrp);

    while {(count (waypoints _infGrp)) != 0} do {deleteWaypoint ((waypoints _infGrp) select 0);};

    sleep 3;

    private _transVehWp =  _transGrp addWaypoint [getpos _transVeh, 0,0];
    _transVehWp setWaypointType "TR UNLOAD";
    _transVehWp setWaypointCompletionRadius 200;

    private _infWp = _infGrp addWaypoint [getpos _transVeh, 0];
    _infWp setWaypointType "GETOUT";
    _infWp setWaypointCompletionRadius 200;

    _infWp synchronizeWaypoint [_transVehWp];

    {unassignVehicle _transVeh} forEach (units _infGrp);
    _infGrp leaveVehicle _transVeh;
    (units _infGrp) allowGetIn false;

    private _infWp_2 = _infGrp addWaypoint [getpos _transVeh, 250];
    _infWp_2 setWaypointType "MOVE";
    _infWp_2 setWaypointCompletionRadius 5;

    waitUntil {sleep 0.5; _crewcount >= count crew _transVeh};

    sleep 5;

    while {(count (waypoints _transGrp)) != 0} do {deleteWaypoint ((waypoints _transGrp) select 0);};

    _transVehWp = _transGrp addWaypoint [_objPos, 100];
    _transVehWp setWaypointType "SAD";
    _transVehWp setWaypointSpeed "NORMAL";
    _transVehWp setWaypointBehaviour "COMBAT";
    _transVehWp setWaypointCombatMode "RED";
    _transVehWp setWaypointCompletionRadius 30;

    _transVehWp = _transGrp addWaypoint [_objPos, 100];
    _transVehWp setWaypointType "SAD";

    _transVehWp = _transGrp addWaypoint [_objPos, 100];
    _transVehWp setWaypointType "CYCLE";

    sleep 10;

    [_infGrp] spawn battlegroup_ai;
};
