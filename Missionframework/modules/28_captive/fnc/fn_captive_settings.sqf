/*
    KPLIB_fnc_captive_settings

    File: fn_captive_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-12
    Last Update: 2019-09-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        CBA Settings initialization for this module.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// KPLIB_param_captiveIntel
// Amount of intel which will be granted on interrogation.
// Default: 10
[
    "KPLIB_param_captiveIntel",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_CAPTIVE_INTELVALUE", localize "STR_KPLIB_SETTINGS_CAPTIVE_INTELVALUE_TT"],
    localize "STR_KPLIB_SETTINGS_CAPTIVE",
    [1, 100, 10, 1],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_captiveIntelRandom
// Amount of random intel modifier on interrogation.
// Default: 5
[
    "KPLIB_param_captiveIntelRandom",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_CAPTIVE_INTELRANDOM", localize "STR_KPLIB_SETTINGS_CAPTIVE_INTELRANDOM_TT"],
    localize "STR_KPLIB_SETTINGS_CAPTIVE",
    [0, 100, 5, 1],
    1,
    {}
] call CBA_Settings_fnc_init;

true
