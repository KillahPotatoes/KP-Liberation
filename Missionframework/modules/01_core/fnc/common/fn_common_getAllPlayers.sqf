/*
    KPLIB_fnc_common_getAllPlayers.sqf

    File: fn_common_getAllPlayers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-21
    Last Update: 2018-06-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Returns all players without headless clients (human players)

    Parameter(s):
    NONE

    Returns:
    ARRAY - array of players
*/

((allUnits + allDead) select {isPlayer _x}) - entities "HeadlessClient_F"
