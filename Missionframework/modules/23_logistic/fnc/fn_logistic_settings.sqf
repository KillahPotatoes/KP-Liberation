/*
    KPLIB_fnc_logistic_settings

    File: fn_logistic_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-28
    Last Update: 2019-01-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// KPLIB_param_recycleFactor
// Defines the resource refund from vehicle recycling.
// Default: 50
[
    "KPLIB_param_recycleFactor",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_RECYCLE_FACTOR", localize "STR_KPLIB_SETTINGS_RECYCLE_FACTOR_TT"],
    localize "STR_KPLIB_SETTINGS_RECYCLE",
    [1, 100, 50, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

true
