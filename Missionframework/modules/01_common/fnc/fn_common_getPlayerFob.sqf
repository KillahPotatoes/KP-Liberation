/*
    KPLIB_fnc_common_getPlayerFob

    File: fn_common_getPlayerFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-24
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Returns the FOB of the given player.

    Parameter(s):
        _player - Player which should be checked [OBJECT, defaults to player]

    Returns:
        FOB of the player to check
*/

params [
    ["_player", player, [objNull]]
];

_player getVariable ["KPLIB_fob", ""]
