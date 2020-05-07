/*
    File: fn_spawnSectorCrates.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-28
    Last Update: 2020-05-07
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns random amount of random resource crates at given sector,
        if not already given during this session.
        Amount of crates is depending on resources multiplier.

    Parameter(s):
        _sector - Sector marker string [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]]
];

if (_sector isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; false};
if (isNil "KPLIB_sectorCratesSpawned") then {KPLIB_sectorCratesSpawned = [];};

if !(_sector in KPLIB_sectorCratesSpawned) then {
    KPLIB_sectorCratesSpawned pushBack _sector;

    private _amount = (ceil (random 3)) * GRLIB_resources_multiplier;
    private _spawnPos = [];
    private _j = 0;

    for "_i" from 1 to _amount do {
        while {_spawnPos isEqualTo []} do {
            _j = _j + 1;
            _spawnPos = ((markerPos _sector) getPos [random 50, random 360]) findEmptyPosition [10, 40, KP_liberation_ammo_crate];
            if (_j isEqualTo 10) exitWith {};
        };
        if !(_spawnPos isEqualTo []) then {
            [selectRandom KPLIB_crates, 100, _spawnpos] call KPLIB_fnc_createCrate;
            _spawnPos = [];
        } else {
            ["No suitable spawn position found."] call BIS_fnc_error;
            [format ["Couldn't find spawn position for resource crate for sector %1", _sector], "WARNING"] call KPLIB_fnc_log;
        };
    };
};

true
