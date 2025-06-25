/*
    File: fn_createSectorObjects.sqf
    Author: PiG13BR - https://github.com/PiG13BR
    Date: 2024-11-22
    Last Update: 2024-12-16
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
       Create registered objects in the designated sector

    Parameter(s):
        _sector - sector where the objects will be created [STRING]

    Returns:
        All objects created in this sector [ARRAY]
*/

if (!isServer) exitWith {};

params ["_sector"];

private _allGarrisons = [];

private _structures = KPLIB_sectorObjects_hashMap get _sector;
if ((isNil "_structures") || {count _structures < 1}) exitWith {_allGarrisons};

{   
    _class = _x # 0;
    _pos = ((_x # 1) # 0);
    _dir = ((_x # 1) # 1);

    _object = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
    _object setPosATL _pos;
    _object setDir _dir;

    // Vehicles
    if (_object isKindOf "Allvehicles") then {
        [_object, 0] remoteExec ["setFuel"];
        [_object, "LOCKEDPLAYER"] remoteExec ["setVehicleLock"];
        _object lockDriver true;
    };

    _allGarrisons pushBack _object;
}forEach _structures;

_allGarrisons
