/*
    KPLIB_fnc_common_createVehicle

    File: fn_common_createVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-03
    Last Update: 2018-10-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawning of a vehicle at given position with given direction.

    Parameter(s):
        _classname  - Classname of the vehicle which should be spawned                      [STRING, defaults to ""]
        _spawnPos   - Position ATL where the vehicle should be spawned                      [POSITION ATL, defaults to []]
        _spawnDir   - Heading for the vehicle from 0 to 360 (Default: random direction)     [NUMBER, defaults to (random 360)]
        _returnVeh  - True for return spawned vehicle as object, false for true on success  [BOOL, defaults to false]

    Returns:
        Created vehicle [OBJECT]
*/
[{
    params [
        ["_classname", "", [""]],
        ["_spawnPos", [], [[]], [3]],
        ["_spawnDir", random 360, [0]],
        ["_returnVeh", false, [true]]
    ];

    // Exit if arguments are missing
    if (_classname == "" || _spawnPos isEqualTo []) exitWith {[false, objNull] select _returnVeh};

    // Vehicle initially created at the zero position. This is faster then create the vehicle at the desired position.
    private _vehicle = createVehicle [_classname, KPLIB_zeroPos, [], 0, "CAN_COLLIDE"];

    // Disable damage handling and simulation.
    _vehicle allowDamage false;
    _vehicle enableSimulationGlobal false;

    // Set the vehicle to the position where it should be.
    _vehicle setDir _spawnDir;
    _vehicle setPosATL _spawnPos;

    // Activate the simulation again.
    _vehicle enableSimulationGlobal true;
    _vehicle setDamage 0;
    _vehicle allowDamage true;

    ["KPLIB_vehicle_spawned", [_vehicle]] call CBA_fnc_localEvent;

    [true, _vehicle] select _returnVeh

}, _this] call CBA_fnc_directCall;
