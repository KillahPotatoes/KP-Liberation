/*
    KPLIB_fnc_enemy_addAwareness

    File: fn_enemy_addAwareness.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-24
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Adds given amount to enemy awareness value.

    Parameter(s):
        _amount - Positive or negative amount to add [NUMBER, defaults to 0]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_amount", 0, [0]]
];

KPLIB_enemy_awareness = KPLIB_enemy_awareness + _amount;
if (KPLIB_enemy_awareness < 0) then {KPLIB_enemy_awareness = 0;};
if (KPLIB_enemy_awareness > 100) then {KPLIB_enemy_awareness = 100;};
publicVariable "KPLIB_enemy_awareness";

true
