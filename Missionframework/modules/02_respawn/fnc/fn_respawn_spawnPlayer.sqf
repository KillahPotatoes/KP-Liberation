#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_doSpawn

    File: fn_respawn_doSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-22
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
    ["_loadout", "", [""]]
];

(findDisplay KPLIB_IDC_RESPAWN_DISPLAY) closeDisplay 0;

// Respawn the player
setPlayerRespawnTime 0;

[{alive player}, {
    setPlayerRespawnTime 1e10;

    params ["_respawnPos", "_loadout"];
    player setPosATL _respawnPos;

    [player, [profileNamespace, _loadout]] call BIS_fnc_loadInventory;

    // Reveal player to nearby infantry so he is not "invisible" to them for a while
    {_x reveal [player, 0.01]} forEach (player nearEntities ["Man", 10]);

    // Emit redeploy event
    ["KPLIB_player_redeploy", [player, _respawnPos, _loadout]] call CBA_fnc_globalEvent;

}, [_respawnPos, _loadout], 2] call CBA_fnc_waitUntilAndExecute;
