#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayConfirm

    File: fn_respawn_displayConfirm.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/
params [["_display", nil, [displayNull]]];

private _respawnItem = (_display getVariable "KPLIB_currentItem");
private _respawnPos = [(_respawnItem select 1)] call KPLIB_fnc_respawn_getSpawnPos;

// Spawn the player at selected position
[_respawnPos] call KPLIB_fnc_respawn_spawnPlayer;
