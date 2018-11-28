/*
    KPLIB_fnc_virtual_settings

    File: fn_virtual_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-28
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

// KPLIB_param_commanderZeusMode
// Zeus access level for Commander slot.
// Default: 2 (Limited, free camera)
[
    "KPLIB_param_commanderZeusMode",
    "LIST",
    localize "STR_KPLIB_SETTINGS_ZEUS_COMMANDER_MODE",
    [localize "STR_KPLIB_SETTINGS_ZEUS", localize "STR_KPLIB_SETTINGS_ZEUS_COMMANDER"],
    [
        [
            0,
            1,
            2,
            3
        ],
        [
            "STR_KPLIB_SETTINGS_ZEUS_NONE",
            "STR_KPLIB_SETTINGS_ZEUS_LIMITED",
            "STR_KPLIB_SETTINGS_ZEUS_LIMITED_FREE_CAM",
            "STR_KPLIB_SETTINGS_ZEUS_FULL"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_subCommanderZeusMode
// Zeus access level for Sub-Commander slot.
// Default: 1 (Limited)
[
    "KPLIB_param_subCommanderZeusMode",
    "LIST",
    localize "STR_KPLIB_SETTINGS_ZEUS_SUBCOMMANDER_MODE",
    [localize "STR_KPLIB_SETTINGS_ZEUS", localize "STR_KPLIB_SETTINGS_ZEUS_SUBCOMMANDER"],
    [
        [
            0,
            1,
            2,
            3
        ],
        [
            "STR_KPLIB_SETTINGS_ZEUS_NONE",
            "STR_KPLIB_SETTINGS_ZEUS_LIMITED",
            "STR_KPLIB_SETTINGS_ZEUS_LIMITED_FREE_CAM",
            "STR_KPLIB_SETTINGS_ZEUS_FULL"
        ],
        1
    ],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_limitedZeusRadius
// Allowed edit/camera radius in meters around the player opening the zeus interface.
// Default: 35 meters
[
    "KPLIB_param_limitedZeusRadius",
    "SLIDER",
    localize "STR_KPLIB_SETTINGS_ZEUS_RADIUS",
    localize "STR_KPLIB_SETTINGS_ZEUS",
    [5, 500, 35, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_limitedZeusCeiling
// Allowed edit/camera ceiling above the terrain in meters around the player opening the zeus interface.
// Default: 35 meters
[
    "KPLIB_param_limitedZeusCeiling",
    "SLIDER",
    localize "STR_KPLIB_SETTINGS_ZEUS_CEILING",
    localize "STR_KPLIB_SETTINGS_ZEUS",
    [5, 500, 35, 0],
    1,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_zeusFobIcons
// Should FOB 3D icons be shown in zeus interface.
// Default: true
[
    "KPLIB_param_zeusFobIcons",
    "CHECKBOX",
    localize "STR_KPLIB_SETTINGS_ZEUS_FOB_ICONS",
    [localize "STR_KPLIB_SETTINGS_ZEUS", localize "STR_KPLIB_SETTINGS_ZEUS_CLIENT"],
    true,
    0,
    {}
] call CBA_Settings_fnc_init;

// KPLIB_param_zeusLocationIcons
// Should Location 3D icons be shown in zeus interface.
// Default: true
[
    "KPLIB_param_zeusLocationIcons",
    "CHECKBOX",
    localize "STR_KPLIB_SETTINGS_ZEUS_LOCATION_ICONS",
    [localize "STR_KPLIB_SETTINGS_ZEUS", localize "STR_KPLIB_SETTINGS_ZEUS_CLIENT"],
    true,
    0,
    {}
] call CBA_Settings_fnc_init;

true
