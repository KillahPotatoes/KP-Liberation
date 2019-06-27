/*
    KPLIB_fnc_cratefiller_preInit

    File: fn_cratefiller_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {
    ["Module initializing...", "PRE] [CRATEFILLER", true] call KPLIB_fnc_common_log;

    // Register arsenal filled event handler
    ["KPLIB_arsenal_newLists", {[] call KPLIB_fnc_cratefiller_presets;}] call CBA_fnc_addEventHandler;

    KPLIB_cratefiller_data = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_cratefiller_data";

    KPLIB_cratefiller_cache = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_cratefiller_cache";
};

// Process CBA Settings
[] call KPLIB_fnc_cratefiller_settings;

if (isServer) then {["Module initialized", "PRE] [CRATEFILLER", true] call KPLIB_fnc_common_log;};

true
