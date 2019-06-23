/*
    KPLIB_fnc_enemy_transferGarrison

    File: fn_enemy_transferGarrison.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-18
    Last Update: 2019-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Transfer given amount of infantry or vehicle classes from one sector to another.
        Given the condition, that the amount of infantry or the specific classname is available at the origin sector.
        The origin sector also has to be inactive.

        !NOTE! Maybe this could be moved to the garrison module.

    Parameter(s):
        _origin         - Sector from which the troops should be transfered                     [STRING, defaults to ""]
        _destination    - Sector to which the troops should be transfered                       [STRING, defaults to ""]
        _infantry       - Amount of infantry which should be transfered                         [NUMBER, defaults to 0]
        _vehicleClasses - Array of vehicle classnames which should be transfered                [ARRAY, defaults to []]
        _onFoot         - True if soldiers should walk instead of being transported by a truck  [BOOL, defaults to false]

    Returns:
        Array of created groups [ARRAY]
*/

params [
    ["_origin", "", [""]],
    ["_destination", "", [""]],
    ["_troops", 0, [0]],
    ["_vehicleClasses", [], [[]]],
    ["_onFoot", false, [false]]
];

// Exit, if no origin or destination is given
if (_origin isEqualTo "" || _destination isEqualTo "") exitWith {[]};

// Exit, if origin sector is currently active
if (_origin in KPLIB_garrison_active) exitWith {[]};

if (KPLIB_param_enemyDebug) then {[format ["Transferring garrison from %1 (%2) to %3 (%4) with [%5, %6]", markerText _origin, _origin, markerText _destination, _destination, _troops, _vehicleClasses], "ENEMY"] call KPLIB_fnc_common_log;};

["KPLIB_transferConvoy_start", [_origin, _destination]] call CBA_fnc_localEvent;

// Arrays for created units
private _infantry = [];
private _vehicles = [];
private _groups = [];

// Origin garrison reference
private _garrison = [_origin] call KPLIB_fnc_garrison_getGarrison;

// Spawn Pos and Dir function
private _getPosDir = {
    params [
        ["_pos", [], [[]]],
        ["_radius", 150, [0]]
    ];

    private _nearRoad = selectRandom (_pos nearRoads _radius);
    private _spawnPos = [];
    private _spawnDir = random 360;
    if !(isNil "_nearRoad") then {
        _spawnPos = getPosATL _nearRoad;
        while {!((_spawnPos nearEntities 20) isEqualTo [])} do {
            _nearRoad = selectRandom (_pos nearRoads _radius);
            _spawnPos = getPosATL _nearRoad;
        };
        _spawnDir = _nearRoad getDir ((roadsConnectedTo _nearRoad) select 0);
    } else {
        _spawnPos = (_pos getPos [(random _radius), random 360]) findEmptyPosition [10, 50, "B_T_VTOL_01_armed_F"];
    };

    [_spawnPos, _spawnDir]
};

// Handle requested infantry
if !(_troops > (_garrison select 2)) then {
    // Define one infantry squad for transport
    private _squadComp = [
        KPLIB_preset_rsSquadLeaderE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE,
        KPLIB_preset_rsRiflemanE
    ];

    // Remove infantry from origin garrison
    [_origin, -_troops] call KPLIB_fnc_garrison_addInfantry;

    // Other local variables for infantry transport handling
    private _nearRoad = objNull;
    private _transport = objNull;
    private _grp = grpNull;

    while {_troops > 0} do {
        // Get spawn position
        private _spawnData = [markerPos _origin] call _getPosDir;

        // Create infantry group
        _grp = [_squadComp select [0, 10 min _troops], _spawnData select 0] call KPLIB_fnc_common_createGroup;
        _infantry pushBack _grp;
        _troops = _troops - (count (units _grp));

        // Add vehicle, if needed
        if (!_onFoot) then {
            private _transportClasses = [count (units _grp)] call KPLIB_fnc_enemy_getTransportClasses;
            _transport = [selectRandom _transportClasses, _spawnData select 0, _spawnData select 1] call KPLIB_fnc_common_createVehicle;
            _grp addVehicle _transport;
        };

        // !DEBUG!
        {
            _x addCuratorEditableObjects [units _grp + [_transport]];
        } forEach allCurators;
    };
} else {
    if (KPLIB_param_enemyDebug) then {[format ["%1 exceeds garrison strength of %2 (%3) for transfer", _troops, markerText _origin, _origin], "ENEMY"] call KPLIB_fnc_common_log;};
};

// Handle requested vehicles
{
    if (_x in (_garrison select 3) || _x in (_garrison select 4)) then {
        // Remove from garrison
        if (isNil {(_garrison select 3) deleteAt ((_garrison select 3) find _x)}) then {
            (_garrison select 4) deleteAt ((_garrison select 4) find _x);
        };

        // Spawn vehicle
        private _spawnData = [markerPos _origin] call _getPosDir;
        _vehicles pushBack ([_x, _spawnData select 0, _spawnData select 1, false, true] call KPLIB_fnc_common_createVehicle);
    } else {
        if (KPLIB_param_enemyDebug) then {[format ["%1 not available at garrison of %2 (%3)", _x, markerText _origin, _origin], "ENEMY"] call KPLIB_fnc_common_log;};
    };
} forEach _vehicleClasses;

// !DEBUG!
{
    _x addCuratorEditableObjects [_vehicles, true];
} forEach allCurators;

// Send created units to destination
{
    // Get group
    private _grp = _x;
    if !(_x isEqualType grpNull) then {
        _grp = group ((crew _x) select 0);
    };

    _groups pushBack _grp;

    // Remove possible initialization waypoints
    {deleteWaypoint [_grp, 0];} forEach (waypoints _grp);

    // Get destination position
    private _destPos = ([markerPos _destination, 100] call _getPosDir) select 0;

    // Add waypoint for destination
    private _waypoint = _grp addWaypoint [_destPos, 1];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointCombatMode "GREEN";
    if !((objectParent ((units _grp) select 0)) isKindOf "Tank") then {
        _waypoint setWaypointSpeed "LIMITED";
    };
    _waypoint setWaypointCompletionRadius 25;
    _waypoint setWaypointStatements ["true", format ["['KPLIB_transferConvoy_end', [thislist, ""%1""]] call CBA_fnc_localEvent;", _destination]];
} forEach (_infantry + _vehicles);

_groups
