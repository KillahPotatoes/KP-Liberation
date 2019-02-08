/*
    KPLIB_fnc_logi_preInit

    File: fn_logi_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-02-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {
    diag_log format ["[KP LIBERATION] [%1] [PRE] [LOGISTIC] Module initializing...", diag_tickTime];

    // Adding actions to spawned logi buildings
    ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_logi_addActions;}] call CBA_fnc_addEventHandler;

    KPLIB_logi_data = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_logi_data";
};

// Process CBA Settings
[] call KPLIB_fnc_logi_settings;

/*
    ----- Module Globals -----
*/

KPLIB_logi_building = KPLIB_preset_logiBuildingF;
KPLIB_logi_activeCam = objNull;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [LOGISTIC] Module initialized", diag_tickTime];};

true