/*
    KPLIB_fnc_mission_settings

    File: fn_mission_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-14
    Last Update: 2019-06-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        CBA Settings initialization for this module.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// KPLIB_param_missionRefund
// Defines the resource refund from mission abortions.
// Default: 50
[
    "KPLIB_param_missionRefund",
    "SLIDER",
    [localize "STR_KPLIB_SETTINGS_MISSION_REFUND", localize "STR_KPLIB_SETTINGS_MISSION_REFUND_TT"],
    localize "STR_KPLIB_SETTINGS_MISSION",
    [0, 100, 50, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

true
