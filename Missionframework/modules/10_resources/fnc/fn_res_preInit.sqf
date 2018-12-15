/*
    KPLIB_fnc_res_preInit

    File: fn_res_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-13
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESOURCES] Module initializing...", diag_tickTime];};

// Process CBA Settings
[] call KPLIB_fnc_res_settings;

// Server section (dedicated and player hosted)
if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_res_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_res_saveData;}] call CBA_fnc_addEventHandler;

    // Adding actions to spawned crates
    ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_res_addCrateActions}] call CBA_fnc_addEventHandler;

    // All valid crate classnames. Defined here on the server as the used preset variables aren't present on the clients yet but needed in initial loading.
    KPLIB_res_crateClasses = [
        KPLIB_preset_crateSupplyF,
        KPLIB_preset_crateAmmoF,
        KPLIB_preset_crateFuelF,
        KPLIB_preset_crateSupplyE,
        KPLIB_preset_crateAmmoE,
        KPLIB_preset_crateFuelE
    ];
    publicVariable "KPLIB_res_crateClasses";

    // Array for all spawned resource crates
    KPLIB_res_allCrates = [];
};

// HC section
if (!hasInterface && !isDedicated) then {

};

// Player section
if (hasInterface) then {

};

/*
    ----- Module Globals -----
*/


if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [RESOURCES] Module initialized", diag_tickTime];};

true
