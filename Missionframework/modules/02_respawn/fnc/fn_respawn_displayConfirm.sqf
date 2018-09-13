#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_respawn_displayConfirm

    File: fn_respawn_displayConfirm.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/
params [["_confirmCtrl", nil, [controlNull]]];

private _display = ctrlParent _confirmCtrl;
private _spawnListCtrl = _display displayCtrl KPLIB_IDC_RESPAWN_SPAWNS;

private _respawnPos = _spawnListCtrl call KPLIB_fnc_respawn_displayGetSpawnPos;

// Spawn the player at selected position
[_respawnPos] call KPLIB_fnc_respawn_spawnPlayer;
