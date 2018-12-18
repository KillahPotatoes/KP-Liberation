/*
    KPLIB_fnc_core_preInit

    File: fn_core_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [CORE] Module initializing...", diag_tickTime];};

// Process CBA Settings
[] call KPLIB_fnc_core_settings;

if (isServer) then {
    ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_core_handleVehicleSpawn}] call CBA_fnc_addEventHandler;

    if(KPLIB_param_clearVehicleCargo) then {
        ["KPLIB_vehicle_spawned", {[_this select 0] call KPLIB_fnc_common_clearVehicleCargo}] call CBA_fnc_addEventHandler;
    };
};

/*
    ----- Module Globals -----
*/

// Potato 01 vehicle reference
KPLIB_core_potato01 = objNull;
// Deploy button trigger for redeploy dialog
KPLIB_dialog_deploy = 0;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [CORE] Module initialized", diag_tickTime];};

true
