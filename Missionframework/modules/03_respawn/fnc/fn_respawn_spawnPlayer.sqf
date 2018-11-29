#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_doSpawn

    File: fn_respawn_doSpawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns player at given position

    Parameter(s):
        _respawnPos - Position where player will be spawned [POSITION, defaults to KPLIB_zeroPos]
        _loadout    - Loadout data                          [STRING, defaults to ""]

    Returns:
        Module was initialized [BOOL]
*/

params [
    ["_respawnPos", KPLIB_zeroPos, [[]], 3],
    ["_loadout", "", [""]]
];

// Close respawn display
(findDisplay KPLIB_IDC_RESPAWN_DISPLAY) closeDisplay 0;

// Respawn the player
setPlayerRespawnTime 0;

[{alive player}, {
    params ["_respawnPos", "_loadout"];

    setPlayerRespawnTime 1e10;

    // Try to find empty respawn pos around given respawn position
    private _emptyRespawnPos = _respawnPos findEmptyPosition [0, 15, "Man"];
    if (_emptyRespawnPos isEqualTo []) then {
        player setPosATL _respawnPos;
    } else {
        player setPosATL _emptyRespawnPos;
    };

    // Load loadout
    [player, [profileNamespace, _loadout]] call BIS_fnc_loadInventory;

    // Reveal player to nearby infantry so he is not "invisible" to them for a while
    {_x reveal [player, 0.01]} forEach (player nearEntities ["Man", 10]);

    // Disable stamina if selected in settings
    if !(KPLIB_param_stamina) then {
        player enableStamina false;
    };

    // Emit redeploy event
    ["KPLIB_player_redeploy", [player, _respawnPos, _loadout]] call CBA_fnc_globalEvent;

}, [_respawnPos, _loadout], 2] call CBA_fnc_waitUntilAndExecute;

true
