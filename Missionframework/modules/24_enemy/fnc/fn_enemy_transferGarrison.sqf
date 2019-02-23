/*
    KPLIB_fnc_enemy_transferGarrison

    File: fn_enemy_transferGarrison.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-18
    Last Update: 2019-02-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Transfer given amount of infantry or vehicle classes from one sector to another.
        Given the condition, that the amount of infantry or the specific classname is available at the origin sector.
        The origin sector also has to be inactive.
        NOTE: Maybe this could be moved to the garrison module.

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
if (_origin == "" || _destination == "") exitWith {[]};

// Exit, if origin sector is currently active
if (_origin in KPLIB_garrison_active) exitWith {[]};

if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [ENEMY] Transferring garrison from %1 (%2) to %3 (%4) with [%5, %6]", markerText _origin, _origin, markerText _destination, _destination, _troops, _vehicleClasses];};

["KPLIB_transferConvoy_start", [_origin, _destination]] call CBA_fnc_localEvent;

// Arrays for created units
private _infantry = [];
private _vehicles = [];

// Origin garrison reference
private _garrison = [_origin] call KPLIB_fnc_garrison_getGarrison;

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
        _nearRoad = selectRandom ((markerPos _origin) nearRoads 100);
        private _spawnPos = ((markerPos _origin) getPos [(random 100), random 360]) findEmptyPosition [10, 50, "B_T_VTOL_01_armed_F"];
        private _spawnDir = random 360;
        if !(isNil "_nearRoad") then {
            _spawnPos = getPosATL _nearRoad;
            while {!((_spawnPos nearEntities 5) isEqualTo [])} do {
                _nearRoad = selectRandom ((markerPos _origin) nearRoads 100);
                _spawnPos = getPosATL _nearRoad;
            };
            _spawnDir = _nearRoad getDir ((roadsConnectedTo _nearRoad) select 0);
        };

        // Create infantry group
        _grp = [_squadComp select [0, 8 min _troops], _spawnPos] call KPLIB_fnc_common_createGroup;
        _infantry pushBack _grp;
        _troops = _troops - (count (units _grp));

        // Add vehicle, if needed
        if (!_onFoot) then {
            private _transportClasses = [count (units _grp)] call KPLIB_fnc_enemy_getTransportClasses;
            _transport = [selectRandom _transportClasses, _spawnPos, _spawnDir] call KPLIB_fnc_common_createVehicle;
            _grp addVehicle _transport;
        };

        // !DEBUG!
        {
            _x addCuratorEditableObjects [units _grp + [_transport]];
        } forEach allCurators;
    };
} else {
    if (KPLIB_param_debug) then {diag_log format ["[KP LIBERATION] [ENEMY] %1 exceeds garrison strength of %2 for transfer", _troops, _origin];};
};

// Handle requested vehicles
if !(_vehicleClasses isEqualTo []) then {

};

// Send created units to destination
{
    // Get group
    private _grp = _x;
    if !(_x isEqualType grpNull) then {
        _grp = group ((crew _x) select 0);
    };

    // Remove possible initialization waypoints
    {deleteWaypoint [_grp, 0];} forEach (waypoints _grp);

    // Get destination position
    private _nearRoad = selectRandom ((markerPos _destination) nearRoads 50);
    private _destPos = ((markerPos _destination) getPos [(random 100), random 360]) findEmptyPosition [10, 50, "B_T_VTOL_01_armed_F"];
    if !(isNil "_nearRoad") then {
        _destPos = getPosATL _nearRoad;
    };

    // Add waypoint for destination
    private _waypoint = _grp addWaypoint [_destPos, 1];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointCombatMode "GREEN";
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointCompletionRadius 50;
    _waypoint setWaypointStatements ["true", format ["['KPLIB_transferConvoy_end', [thislist, ""%1""]] call CBA_fnc_localEvent;", _destination]];
} forEach (_infantry + _vehicles);

true
