/*
    KPLIB_fnc_respawn_settings

    File: fn_respawn_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-11
    Last Update: 2018-11-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// KPLIB_param_mobileRespawn
// Enables/Disables the mobile respawn functionality of certain vehicles.
// Default: true
[
    "KPLIB_param_mobileRespawn",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_RESPAWN_MOBILE", localize "STR_KPLIB_SETTINGS_RESPAWN_MOBILE_TT"],
    localize "STR_KPLIB_SETTINGS_RESPAWN",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

true
