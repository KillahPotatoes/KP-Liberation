/*
    KPLIB_fnc_common_createVehicle

    File: fn_common_createVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-03
    Last Update: 2018-12-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawning of a vehicle at given position with given direction.
        Supports spawning of air vehicles or paradrop vehicles, when z is > 10.

    Parameter(s):
        _classname  - Classname of the vehicle which should be spawned                                              [STRING, defaults to ""]
        _spawnPos   - Position ATL where the vehicle should be spawned. Paradropped when z > 10 and no air vehicle  [POSITION ATL, defaults to KPLIB_zeroPos]
        _spawnDir   - Heading for the vehicle from 0 to 360                                                         [NUMBER, defaults to (random 360)]
        _justSpawn  - True to skip all paradrop or air vehicle detection, even if z > 10                            [BOOL, defaults to false]
        _withCrew   - True to spawn crew for the vehicle                                                            [BOOL, defaults to false]
        _side       - Side to which this vehicle should belong, when _withCrew == true                              [SIDE, defaults to KPLIB_preset_sideE]

    Returns:
        Created vehicle [OBJECT]
*/

params [
    ["_classname", "", [""]],
    ["_spawnPos", KPLIB_zeroPos, [[]], [3]],
    ["_spawnDir", random 360, [0]],
    ["_justSpawn", false, [true]],
    ["_withCrew", false, [true]],
    ["_side", KPLIB_preset_sideE, [sideEmpty]]
];

// Exit if arguments are missing
if (_classname isEqualTo "" || _spawnPos isEqualTo []) exitWith {objNull};

// Local variables initialization
private _specialAttr = "NONE";
private _paradrop = false;
private _firstPos = KPLIB_zeroPos;
private _reposition = true;
private _velocity = 0;

// Make sure the z value is taken into account, if it shouldn't be skipped
if ((_spawnPos select 2) > 10 && !_justSpawn) then {
    if ((_classname isKindOf "Air") && _withCrew) then {
        // Fly for any air vehicle
        _specialAttr = "FLY";

        // Planes spawning mid air are needing a suitable velocity at start
        if (_classname isKindOf "Plane") then {
            _velocity = 140;
        };
    } else {
        // As it's no air vehicle and/or has no crew, the high z index should execute a paradrop
        _paradrop = true;
    };

    // Spawning mid air shouldn't need any pre- and repositioning
    _firstPos = _spawnPos;
    _reposition = false;
};

// Vehicle initially created at the zero position (if not flying). This is faster then create the vehicle at the desired position.
private _vehicle = createVehicle [_classname, _firstPos, [], 0, _specialAttr];

// Reposition the vehicle only, if we've placed it at the zeroPosition
if (_reposition) then {
    // Disable damage handling and simulation.
    _vehicle allowDamage false;
    _vehicle enableSimulationGlobal false;

    // Set the vehicle to the position where it should be.
    _vehicle setDir _spawnDir;
    _vehicle setPosATL _spawnPos;
    _vehicle setVectorUp (surfaceNormal (position _vehicle));

    // Activate the simulation again.
    _vehicle enableSimulationGlobal true;
    _vehicle setDamage 0;
    _vehicle allowDamage true;
} else {
    // Apply direction, if no reposition needed
    _vehicle setDir _spawndir;
};

// If we have a plane, let's give it some velocity
if (_velocity > 0) then {
    _vehicle setVelocity [_velocity * (sin _spawnDir), _velocity * (cos _spawnDir), 0];
};

if (_withCrew) then {
    [_vehicle, _side] call KPLIB_fnc_common_createCrew;
};

// Handle paradrop
if (_paradrop) then {
    [objNull, _vehicle] call BIS_fnc_curatorObjectEdited;
};

["KPLIB_vehicle_spawned", [_vehicle]] call CBA_fnc_localEvent;

// Return created vehicle
_vehicle
