/*
    KPLIB_fnc_permission_registerPlayer

    File: fn_permission_registerPlayer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-19
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks if the player is already registered to the permission system.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

private _index = 0;
private _playerArray = [];

// Check if the player is registered
_index = KPLIB_permission_list findIf {(_x select 0) isEqualTo (getPlayerUID player)};
if (_index isEqualto -1) then {
    KPLIB_permission_list pushBack [getPlayerUID player, name player, KPLIB_permission_default];
} else {
    (KPLIB_permission_list select _index) set [1, name player];
};

[KPLIB_permission_list, [], [], []] remoteExecCall ["KPLIB_fnc_permission_syncClients", 2];

true
