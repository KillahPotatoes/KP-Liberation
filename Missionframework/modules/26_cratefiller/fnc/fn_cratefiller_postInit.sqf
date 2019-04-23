/*
    KPLIB_fnc_cratefiller_postInit

    File: fn_cratefiller_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "POST] [CRATEFILLER", true] call KPLIB_fnc_common_log;};

// Server section (dedicated and player hosted)
if (isServer) then {
    // create cratefiller presets on startup
    [] call KPLIB_fnc_cratefiller_presets;

    // Register arsenal filled event handler
    ["KPLIB_arsenal_newLists", {[] call KPLIB_fnc_cratefiller_presets;}] call CBA_fnc_addEventHandler;
};

if (isServer) then {["Module initialized", "POST] [CRATEFILLER", true] call KPLIB_fnc_common_log;};

true
