/*
    KPLIB_fnc_enemy_addStrength

    File: fn_enemy_addStrength.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-24
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Adds given amount to enemy strength value.

    Parameter(s):
        _amount - Positive or negative amount to add [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_amount", 0, [0]]
];

// Exit, if not enough strength available
if (_amount < 0 && _amount > KPLIB_enemy_strength) exitWith {false};

KPLIB_enemy_strength = KPLIB_enemy_strength + _amount;
publicVariable "KPLIB_enemy_strength";

true
