/*
    KPLIB_fnc_logistic_preInit

    File: fn_logistic_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-04-23
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
    ["Module initializing...", "PRE] [LOGISTIC", true] call KPLIB_fnc_common_log;

/*
    ----- Module Initialization -----
*/

    // Adding actions to spawned logi buildings
    ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_logistic_addActions;}] call CBA_fnc_addEventHandler;

    KPLIB_logistic_data = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_logistic_data";
};

// Process CBA Settings
[] call KPLIB_fnc_logistic_settings;

/*
    ----- Module Globals -----
*/

KPLIB_logistic_building = KPLIB_preset_logiBuildingF;
KPLIB_logistic_activeCam = objNull;

if (isServer) then {["Module initialized", "PRE] [LOGISTIC", true] call KPLIB_fnc_common_log;};

true
