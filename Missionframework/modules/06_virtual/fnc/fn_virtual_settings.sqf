/*
    KPLIB_fnc_virtual_settings

    File: fn_virtual_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        CBA Settings initialization for this module

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/


/*
    ----- ZEUS SETTINGS -----
*/

// KPLIB_param_virtual_commanderZeusMode
// Zeus access level for Commander slot.
// Default: 1 (Limited)
[
    "KPLIB_param_virtual_commanderZeusMode",
    "LIST",
    localize "STR_KPLIB_SETTINGS_ZEUS_COMMANDER_MODE",
    [localize "STR_KPLIB_SETTINGS_ZEUS", localize "STR_KPLIB_SETTINGS_ZEUS_COMMANDER"],
    [
        [
            0,
            1,
            2
        ],
        [
            "STR_KPLIB_SETTINGS_ZEUS_NONE",
            "STR_KPLIB_SETTINGS_ZEUS_LIMITED",
            "STR_KPLIB_SETTINGS_ZEUS_FULL"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_virtual_subCommanderZeusMode
// Zeus access level for Sub-Commander slot.
// Default: 1 (Limited)
[
    "KPLIB_param_virtual_subCommanderZeusMode",
    "LIST",
    localize "STR_KPLIB_SETTINGS_ZEUS_SUBCOMMANDER_MODE",
    [localize "STR_KPLIB_SETTINGS_ZEUS", localize "STR_KPLIB_SETTINGS_ZEUS_SUBCOMMANDER"],
    [
        [
            0,
            1,
            2
        ],
        [
            "STR_KPLIB_SETTINGS_ZEUS_NONE",
            "STR_KPLIB_SETTINGS_ZEUS_LIMITED",
            "STR_KPLIB_SETTINGS_ZEUS_FULL"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

true
