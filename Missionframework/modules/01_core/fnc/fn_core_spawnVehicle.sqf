/*
    KPLIB_fnc_core_spawnVehicle

    File: fn_core_spawnVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-03
    Last Update: 2018-05-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Spawning of a vehicle at given position with given direction.

    Parameter(s):
        0: STRING - Classname of the vehicle which should be spawned.
        1: POSITION - Position ATL where the vehicle should be spawned.
        2: NUMBER - OPTIONAL - Heading for the vehicle from 0 to 360. (Default: random direction)
        2: BOOL - OPTIONAL - True for return the spawned vehicle as object, false for return only true on success. (Default: false)

    Returns:
    OBJECT / BOOL - Depends on 3rd parameter. True -> returns object, False -> return true on success.
*/

params ["_classname", "_spawnPos", ["_spawnDir", random 360], ["_returnVeh", false]];

// Return variable
private _return = true;

// Vehicle created at the spawn position with a slight height offset.
private _vehicle = createVehicle [_classname, _spawnPos, [], 0, "CAN_COLLIDE"];

// Disable damage handling and simulation.
_vehicle allowDamage false;
_vehicle enableSimulationGlobal false;

// Repositioning of the vehicle to make sure it'll be where it should be.
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

_return
