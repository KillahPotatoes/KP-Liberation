/*
    KPLIB_fnc_garrison_getVehSpawnPos

    File: fn_garrison_getVehSpawnPos.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-23
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Finds an position where a vehicle can safely spawn. Skips water positions.

    Parameter(s):
        _center - Center position from which to find a spawn position [POSITION, defaults to KPLIB_zeroPos]

    Returns:
        Position to spawn [POSITION AGL]
*/

params [
    ["_center", KPLIB_zeroPos, [[]], [3]]
];

private _spawnPos = (_center getPos [50 + (random 200), random 360]) findEmptyPosition [0, 50, "B_T_VTOL_01_armed_F"];
private _nearRoad = selectRandom (_center nearRoads 150);
if !(isNil "_nearRoad") then {
    _spawnPos = getPosATL _nearRoad;
};

// Avoid spawn position on water or empty position by findEmptyPosition
if (_spawnPos isEqualTo [] || surfaceIsWater _spawnPos || !((_spawnPos nearEntities 20) isEqualTo [])) exitWith {_this call KPLIB_fnc_garrison_getVehSpawnPos};

// Return position with a slight z Offset
[_spawnPos select 0, _spawnPos select 1, 0.25]
