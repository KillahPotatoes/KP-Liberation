/*
    KPLIB_fnc_garrison_preInit

    File: fn_garrison_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "PRE] [GARRISON", true] call KPLIB_fnc_common_log;};

/*
    ----- Module Globals -----
*/

// Array to collect active garrison units
KPLIB_garrison_active = [];

// Array which contains all garrisons
KPLIB_garrison_array = [];

// Indicator for presets initialization
KPLIB_garrison_presetInitE = false;
KPLIB_garrison_presetInitF = false;


/*
    ----- Module Initialization -----
*/

if (isServer) then {
    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_garrison_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_garrison_saveData;}] call CBA_fnc_addEventHandler;

    // Register sector activation event handler
    ["KPLIB_sector_activated", {[_this select 0] call KPLIB_fnc_garrison_spawn;}] call CBA_fnc_addEventHandler;

    // Register sector captured event handler
    ["KPLIB_sector_captured", {[_this select 0] call KPLIB_fnc_garrison_changeOwner;}] call CBA_fnc_addEventHandler;

    // Register sector deactivation event handler
    ["KPLIB_sector_deactivated", {[_this select 0] call KPLIB_fnc_garrison_despawn;}] call CBA_fnc_addEventHandler;
};

// Register preset change event handler (The if is needed, because this event is also fired on mission start, not only on change)
["CBA_SettingChanged", {
    params ["_setting", "_value"];

    // Detect if blufor or opfor setting is changed
    switch (_setting) do {
        case "KPLIB_param_presetE": {
            // Don't fire on normal mission start
            if (!KPLIB_garrison_presetInitE) then {
                KPLIB_garrison_presetInitE = true;
            } else {
                // If it was changed mid game, reload preset variables, reinitialize sector garrisons and publish variables to clients
                if (isServer) then {
                    [] call KPLIB_fnc_init_loadPresets;
                    [_setting] call KPLIB_fnc_garrison_reInitSectors;
                } else {
                    [] spawn KPLIB_fnc_init_receiveInit;
                };
                // Give the server admin a hint that a full server restart is recommended
                if (hasInterface && serverCommandAvailable "#kick") then {
                    hint parseText format ["<t color='#ff0000' align='center' size='2'>%1</t><br />%2", localize "STR_KPLIB_HINT_REQUIRERESTART1", localize "STR_KPLIB_HINT_REQUIRERESTART2"];
                };
            };
        };
        case "KPLIB_param_presetF": {
            // Don't fire on normal mission start
            if (!KPLIB_garrison_presetInitF) then {
                KPLIB_garrison_presetInitF = true;
            } else {
                // If it was changed mid game, reload preset variables, reinitialize sector garrisons and publish variables to clients
                if (isServer) then {
                    [] call KPLIB_fnc_init_loadPresets;
                    [_setting] call KPLIB_fnc_garrison_reInitSectors;
                } else {
                    [] spawn KPLIB_fnc_init_receiveInit;
                };
                // Give the server admin a hint that a full server restart is recommended
                if (hasInterface && serverCommandAvailable "#kick") then {
                    hint parseText format ["<t color='#ff0000' align='center' size='2'>%1</t><br />%2", localize "STR_KPLIB_HINT_REQUIRERESTART1", localize "STR_KPLIB_HINT_REQUIRERESTART2"];
                };
            };
        };
        default {};
    };
}] call CBA_fnc_addEventHandler;

if (isServer) then {["Module initialized", "PRE] [GARRISON", true] call KPLIB_fnc_common_log;};

true
