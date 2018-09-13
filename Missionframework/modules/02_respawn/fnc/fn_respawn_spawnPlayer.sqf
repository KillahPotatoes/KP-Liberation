#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_

    File: fn_respawn_doSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Spawns player at given position

    Parameter(s):
        0: ARRAY - Position where player will be spawned
        1: ARRAY - Loadout data

    Returns:
    NOTHING
*/
params [
    ["_respawnPos", nil, [[]], 3],
    ["_loadout", [], [[]]]
];

(findDisplay KPLIB_IDC_RESPAWN_DISPLAY) closeDisplay 0;

setPlayerRespawnTime 0;

systemChat str canSuspend;
systemChat "spawningPlayer";
systemChat str (alive player);

systemChat format["POs: %1", _respawnPos];

[{
    player setPosATL (_this select 0);

    if !(_loadout isEqualTo []) then {
        [player, [profileNamespace, _loadout]] call BIS_fnc_loadInventory;
    }
}, {alive player}, [_respawnPos], 2] call CBA_fnc_waitUntilAndExecute;
