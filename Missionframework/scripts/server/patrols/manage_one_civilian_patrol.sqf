scriptName "manage_one_civilian_patrol";

private [ "_spawnsector", "_grp", "_usable_sectors", "_spawntype", "_civnumber", "_vehdriver", "_spawnpos", "_civveh", "_sectors_patrol",
        "_patrol_startpos", "_waypoint", "_grpspeed", "_sectors_patrol_random", "_sectorcount", "_nextsector", "_nearestroad" ];

_civveh = objNull;

sleep (150 + (random 150));
_spawnsector = "";

if ( isNil "KPLIB_sectors_active" ) then { KPLIB_sectors_active = [] };

while { KPLIB_endgame == 0 } do {

    _spawnsector = "";
    _usable_sectors = [];
    {
        if ((([markerPos _x, 1000, KPLIB_side_player] call KPLIB_fnc_getUnitsCount) == 0) && (count ([markerPos _x, 3500] call KPLIB_fnc_getNearbyPlayers) > 0)) then {
            _usable_sectors pushback _x;
        }

    } foreach ((KPLIB_sectors_capital + KPLIB_sectors_city + KPLIB_sectors_factory) - (KPLIB_sectors_active));

    if ( count _usable_sectors > 0 ) then {
        _spawnsector = selectRandom _usable_sectors;

        _grp = createGroup [KPLIB_side_civilian, true];
        if ( random 100 < 33) then {
            _civnumber = 1 + (floor (random 2));
            while { count units _grp < _civnumber } do {
                [selectRandom KPLIB_c_units, markerPos _spawnsector, _grp, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
            };
            _grpspeed = "LIMITED";
        } else {

            _nearestroad = objNull;
            while { isNull _nearestroad } do {
                _nearestroad = [(markerPos (_spawnsector)) getPos [random (100), random (360)], 200, []] call BIS_fnc_nearestRoad;
                sleep 1;
            };

            _spawnpos = getpos _nearestroad;

            [selectRandom KPLIB_c_units, _spawnpos, _grp, "PRIVATE", 0.5] call KPLIB_fnc_createManagedUnit;
            _civveh = (selectRandom KPLIB_c_vehicles) createVehicle _spawnpos;
            _civveh setpos _spawnpos;
            _civveh addMPEventHandler ["MPKilled", {
                params ["_unit", "_killer"];
                ["KPLIB_manageKills", [_unit, _killer]] call CBA_fnc_localEvent;
            }];
            _civveh addEventHandler ["HandleDamage", { private [ "_damage" ]; if (( side (_this select 3) != KPLIB_side_player ) && ( side (_this select 3) != KPLIB_side_enemy )) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ];
            ((units _grp) select 0) moveInDriver _civveh;
            ((units _grp) select 0) disableAI "FSM";
            ((units _grp) select 0) disableAI "AUTOCOMBAT";
            _grpspeed = "LIMITED";

        };

        { _x addEventHandler ["HandleDamage", { private [ "_damage" ]; if (( side (_this select 3) != KPLIB_side_player ) && ( side (_this select 3) != KPLIB_side_enemy )) then { _damage = 0 } else { _damage = _this select 2 }; _damage } ]; } foreach units _grp;

        _sectors_patrol = [];
        _patrol_startpos = getpos (leader _grp);
        {
            if ((_patrol_startpos distance (markerpos _x) < 5000) && (count ([markerPos _x, 4000] call KPLIB_fnc_getNearbyPlayers) > 0)) then {
                _sectors_patrol pushback _x;
            };
        } foreach (KPLIB_sectors_capital + KPLIB_sectors_city + KPLIB_sectors_factory);

        _sectors_patrol_random = [];
        _sectorcount = count _sectors_patrol;
        while { count _sectors_patrol_random < _sectorcount } do {
            _nextsector = selectRandom _sectors_patrol;
            _sectors_patrol_random pushback _nextsector;
            _sectors_patrol = _sectors_patrol - [_nextsector];

        };

        while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
        {doStop _x; _x doFollow leader _grp} foreach units _grp;

        {
            _nearestroad = [(markerPos _x) getPos [random(100), random(360)], 200, []] call BIS_fnc_nearestRoad;
            if ( isNull _nearestroad ) then {
                _waypoint = _grp addWaypoint [ markerpos _x, 100 ];
            } else {
                _waypoint = _grp addWaypoint [ getpos _nearestroad, 0 ];
            };
            _waypoint setWaypointType "MOVE";
            _waypoint setWaypointSpeed _grpspeed;
            _waypoint setWaypointBehaviour "SAFE";
            _waypoint setWaypointCombatMode "BLUE";
            _waypoint setWaypointCompletionRadius 100;
        } foreach _sectors_patrol_random;

        _waypoint = _grp addWaypoint [_patrol_startpos , 100];
        _waypoint setWaypointType "CYCLE";

        if ( local _grp ) then {
            _headless_client = [] call KPLIB_fnc_getLessLoadedHC;
            if ( !isNull _headless_client ) then {
                _grp setGroupOwner ( owner _headless_client );
            };
        };

        waitUntil {
            sleep (30 + (random 30));
            ((({alive _x} count (units _grp)) == 0) || (count ([getpos leader _grp, 4000] call KPLIB_fnc_getNearbyPlayers) == 0))
        };

        if ( count (units _grp) > 0 ) then {
            if (count ([getpos leader _grp, 4000] call KPLIB_fnc_getNearbyPlayers) == 0) then {

                if ( !(isNull _civveh) ) then {
                     if ( { ( alive _x ) && (side group _x == KPLIB_side_player ) } count (crew _civveh) == 0 ) then {
                        deleteVehicle _civveh
                    };
                };

                { deletevehicle _x } foreach units _grp;
            };
        };
    };

    sleep 150 + (random (150));
};
