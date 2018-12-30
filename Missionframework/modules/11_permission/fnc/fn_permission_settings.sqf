/*
    KPLIB_fnc_permission_settings

    File: fn_permission_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-27
    Last Update: 2018-12-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

/*
    ----- PERMISSION SETTINGS -----
*/

// KPLIB_param_permission
// Enables/Disables the permission system.
// Default: true
[
    "KPLIB_param_permission",
    "CHECKBOX",
    [localize "STR_KPLIB_SETTINGS_PERMISSION_ACTIVATE", localize "STR_KPLIB_SETTINGS_PERMISSION_ACTIVATE_TT"],
    localize "STR_KPLIB_SETTINGS_PERMISSION",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

true
