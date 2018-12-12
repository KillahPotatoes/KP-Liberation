/*
    KPLIB_fnc_garrison_spawn

    File: fn_garrison_spawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2018-12-08
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

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [GARRISON] Spawn for %2", diag_tickTime, _sector];};

// Initialize local variables
private _garrison = [_sector] call KPLIB_fnc_garrison_getGarrison;
private _sectorOwner = _garrison select 1;
private _sectorOwnerSide = sideEmpty;
private _soldierCount = _garrison select 2;
private _squadCount = floor (_soldierCount / 6);
private _leftSolders = _soldierCount % 6;
private _lightVehicles = _garrison select 3;
private _heavyVehicles = _garrison select 4;

// Create active garrison array entry
KPLIB_garrison_active pushBack [_sector, _sectorOwner, [], [], [], []];

// Get current sector owner
switch (_sectorOwner) do {
    case 0;
    case 1: {_sectorOwnerSide = KPLIB_preset_sideE;};
    case 2: {_sectorOwnerSide = KPLIB_preset_sideF;};
    default {_sectorOwnerSide = KPLIB_preset_sideE;};
};

// Spawn full infantry squads
for "_i" from 1 to _squadCount do {
    // Spawn infantry squads with small delays. Otherwise it could cause a small freeze, when there >3 squads at a sector.
    [{_this call KPLIB_fnc_garrison_spawnSectorInfantry;}, [_sector, _sectorOwner], _i] call CBA_fnc_waitAndExecute;
};

// Spawn remaining soldiers
if (_leftSolders > 0) then {
    [_sector, _sectorOwner, _leftSolders] call KPLIB_fnc_garrison_spawnSectorInfantry;
};

// Spawn light vehicles
{
    [{_this call KPLIB_fnc_garrison_spawnSectorVehicle;}, [_sector, _x, _sectorOwnerSide], _forEachIndex] call CBA_fnc_waitAndExecute;
} forEach _lightVehicles;

// Spawn heavy vehicles
{
    [{_this call KPLIB_fnc_garrison_spawnSectorVehicle;}, [_sector, _x, _sectorOwnerSide, "heavy"], (count _lightvehicles) + _forEachIndex] call CBA_fnc_waitAndExecute;
} forEach _heavyVehicles;

true
