/*
    KPLIB_fnc_cratefiller_settings

    File: fn_cratefiller_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-05-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        CBA Settings initialization for this module.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

/*
    ----- CRATEFILLER SETTINGS -----
*/

// KPLIB_param_cratefiller
// Enables/Disables the cratefiller.
// Default: true
[
    "KPLIB_param_cratefiller",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_CRATEFILLER_ACTIVATE", localize "STR_KPLIB_SETTINGS_CRATEFILLER_ACTIVATE_TT"],
    localize "STR_KPLIB_SETTINGS_CRATEFILLER",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_cratefillerOverview
// Enables/Disables the cratefiller tools.
// Default: true
[
    "KPLIB_param_cratefillerOverview",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_CRATEFILLER_ACTIVATEOVERVIEW", localize "STR_KPLIB_SETTINGS_CRATEFILLER_ACTIVATEOVERVIEW_TT"],
    localize "STR_KPLIB_SETTINGS_CRATEFILLER",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

true
