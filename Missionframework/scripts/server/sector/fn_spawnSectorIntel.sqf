/*
    File: fn_spawnSectorIntel.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-05-01
    Last Update: 2020-05-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns intel objects in valid buildings at given sector.

    Parameter(s):
        _sector - Sector to spawn intel for                                 [STRING, defaults to ""]
        _range  - Range from the sector center to look for valid buildings  [NUMBER, defaults to 150]
        _amount - Amount of intel objects to spawn at the sector            [NUMBER, defaults to 2 + (floor (random 3))]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]],
    ["_range", 150, [0]],
    ["_amount", 2 + (floor (random 3)), [0]]
];

if (_sector isEqualTo "") exitWith {["Empty string given"] call BIS_fnc_error; false};
if (isNil "KPLIB_sectorIntelSpawned") then {KPLIB_sectorIntelSpawned = []};

if !(_sector in KPLIB_sectorIntelSpawned) then {
    KPLIB_sectorIntelSpawned pushBack _sector;
    private _buildings = (nearestObjects [markerPos _sector, KPLIB_intelBuildingClasses, _range]) select {alive _x};

    if !(_buildings isEqualTo []) then {
        private _positions = [];
        {_positions append _x;} forEach (_buildings apply {[_x] call BIS_fnc_buildingPositions});

        if ((count _positions) >= (_amount * 4)) then {
            private _spawnPos = [];
            private _obj = objNull;

            for "_i" from 1 to _amount do {
                _spawnPos = _positions deleteAt (floor random (count _positions));
                _obj = (selectRandom KPLIB_intelObjectClasses) createVehicle _spawnPos;
                _obj setdir (random 360);
                _obj setPosATL _spawnPos;
                _obj allowDamage false;
            };
        };
    };
};

true
