/*
    KPLIB_fnc_enemy_settings

    File: fn_enemy_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-06-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        CBA Settings initialization for this module

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

/*
    ----- ENEMY COMMANDER SETTINGS -----
*/

// KPLIB_param_enemyDebug
// Enables/Disables debug mode for this module.
// Default: true
[
    "KPLIB_param_enemyDebug",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_ENEMY_DEBUG", localize "STR_KPLIB_SETTINGS_ENEMY_DEBUG_TT"],
    localize "STR_KPLIB_SETTINGS_ENEMY",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

true
