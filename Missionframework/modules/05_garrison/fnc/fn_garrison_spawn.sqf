/*
    KPLIB_fnc_garrison_spawn

    File: fn_garrison_spawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-10-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Handles the spawning of the sector garrison which is stored in the garrison array.

    Parameter(s):
        _sector - Markername of the sector [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]]
];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [GARRISON] Spawn for %2 started", diag_tickTime, _sector];};

private _garrison = KPLIB_garrison_array select (KPLIB_garrison_array findIf {_x select 0 == _sector});
private _sectorOwner = _garrison select 1;
private _sectorOwnerSide = sideEmpty;
private _soldierCount = _garrison select 2;
private _squadCount = floor (_soldierCount / 6);
private _leftSolders = _soldierCount % 6;

// Get current sector owner
switch (_sectorOwner) do {
    case 0;
    case 1: {_sectorOwnerSide = KPLIB_preset_sideEnemy;};
    case 2: {_sectorOwnerSide = KPLIB_preset_sidePlayers;};
    default {_sectorOwnerSide = KPLIB_preset_sideEnemy;};
};

for "_i" from 1 to _squadCount do {
    // Spawn infantry squads with small delays. Otherwise it could cause a small freeze, when there >3 squads at a sector.
    [{[_this select 0, _this select 1] call KPLIB_fnc_garrison_spawnSectorInfantry;}, [_sector, _sectorOwner], _i] call CBA_fnc_waitAndExecute;
};

if (_leftSolders > 0) then {
    [_sector, _sectorOwner, _leftSolders] call KPLIB_fnc_garrison_spawnSectorInfantry;
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [GARRISON] Spawn for %2 finished", diag_tickTime, _sector];};

true
