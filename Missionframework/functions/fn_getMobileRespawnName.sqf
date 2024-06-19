/*
    File: fn_getMobileRespawnName.sqf
    Author: doxus
    Date: 2024-04-23
    Last Update: 2024-04-23
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets NATO military name of the given respawn vehicle (assigned per idx)

    Parameter(s):
        _msp - mobile respawn vehicle object reference (defaults to nil)

    Returns:
        Mobile respawn name
*/


params [
    ["_msp", nil]
];

private _respawn_vehicles = [] call KPLIB_fnc_getMobileRespawns;
private _name = "VEHICLE_NOT_FOUND";

if (!isNil "_msp") then {
    private _vehicle_idx = _respawn_vehicles find _msp;
    if (_vehicle_idx != -1 && _vehicle_idx < count KPLIB_militaryAlphabet) then {
        _name = KPLIB_militaryAlphabet select _vehicle_idx;
    };
};
_name
