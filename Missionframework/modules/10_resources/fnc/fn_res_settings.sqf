/*
    KPLIB_fnc_res_settings

    File: fn_res_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-14
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/


/*
    ----- RESOURCES SETTINGS -----
*/

// KPLIB_param_crateVolume
// The amount of resources which can be stored in a crate.
// Default: 100
[
    "KPLIB_param_crateVolume",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_RES_CRATEVOLUME", localize "STR_KPLIB_SETTINGS_RES_CRATEVOLUME_TT"],
    localize "STR_KPLIB_SETTINGS_RES",
    [50, 400, 100, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

true
