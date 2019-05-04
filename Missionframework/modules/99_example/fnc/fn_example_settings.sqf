/*
    KPLIB_fnc_example_settings

    File: fn_example_settings.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-04-23
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
    ----- EXAMPLE SETTINGS -----
*/

// KPLIB_param_example
// This is an example setting.
// Default: true
[
    "KPLIB_param_example",
    "CHECKBOX",
    ["Example Setting Name", "Example Setting Tooltip"],
    "Example Setting Category",
    true,
    1,
    {}
] call CBA_Settings_fnc_init;

true
