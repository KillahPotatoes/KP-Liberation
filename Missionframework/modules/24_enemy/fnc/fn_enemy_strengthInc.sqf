/*
    KPLIB_fnc_enemy_strengthInc

    File: fn_enemy_strengthInc.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-18
    Last Update: 2019-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        CBA loop to increase the enemy strength in given interval depending on the remaining military bases.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Increase strength by remaining enemy military bases
private _increase = (count (KPLIB_sectors_military - KPLIB_sectors_blufor)) * 10;
[_increase] call KPLIB_fnc_enemy_addStrength;

// Enforce cap for strength
if (KPLIB_enemy_strength > 1000) then {
    KPLIB_enemy_strength = 1000;
    if (KPLIB_param_enemyDebug) then {["Strength reached cap of 1000", "ENEMY"] call KPLIB_fnc_common_log;};
} else {
    if (KPLIB_param_enemyDebug) then {[format ["Strength increased from %1 to %2", KPLIB_enemy_strength - _increase, KPLIB_enemy_strength], "ENEMY"] call KPLIB_fnc_common_log;};
};

// Schedule the next call
if (KPLIB_campaignRunning) then {
    [{[] call KPLIB_fnc_enemy_strengthInc;}, [], 1800] call CBA_fnc_waitAndExecute;
};

true
