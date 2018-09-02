/*
    KPLIB_fnc_common_spawnVehicle

    File: fn_common_spawnVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-03
    Last Update: 2018-09-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Spawning of a vehicle at given position with given direction.

    Parameter(s):
        0: STRING - Classname of the vehicle which should be spawned.
        1: POSITION - Position ATL where the vehicle should be spawned.
        2: NUMBER - OPTIONAL - Heading for the vehicle from 0 to 360. (Default: random direction)
        3: BOOL - OPTIONAL - True for return the spawned vehicle as object, false for return only true on success. (Default: false)

    Returns:
    OBJECT / BOOL - Depends on 3rd parameter. True -> returns object, False -> return true on success.
*/
[{
    params [["_classname", nil, [""]], ["_spawnPos", nil, [[]]], ["_spawnDir", random 360], ["_returnVeh", false]];

    // Return variable
    private _return = true;

    // Vehicle initially created at the zero position. This is faster then create the vehicle at the desired position.
    private _vehicle = createVehicle [_classname, KPLIB_zeroPos, [], 0, "CAN_COLLIDE"];

    // Disable damage handling and simulation.
    _vehicle allowDamage false;
    _vehicle enableSimulationGlobal false;

    // Set the vehicle to the position where it should be.
    _vehicle setDir _spawnDir;
    _vehicle setPosATL _spawnPos;

    // Clear all cargo of the start vehicle.
    clearWeaponCargoGlobal _vehicle;
    clearMagazineCargoGlobal _vehicle;
    clearItemCargoGlobal _vehicle;
    clearBackpackCargoGlobal _vehicle;

    // Activate the simulation again.
    _vehicle enableSimulationGlobal true;
    _vehicle setDamage 0;
    _vehicle allowDamage true;

    if (_returnVeh) then {_return = _vehicle;};

    ["KPLIB_vehicle_spawned", [_vehicle]] call CBA_fnc_localEvent;

    _return

}, _this] call CBA_fnc_directCall;
