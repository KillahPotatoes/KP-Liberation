/*
    KPLIB_fnc_permission_preInit

    File: fn_permission_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {

    diag_log format ["[KP LIBERATION] [%1] [PRE] [PERMISSION] Module initializing...", diag_tickTime];

    // Register load event handler
    ["KPLIB_doLoad", {[] call KPLIB_fnc_permission_loadData;}] call CBA_fnc_addEventHandler;

    // Register save event handler
    ["KPLIB_doSave", {[] call KPLIB_fnc_permission_saveData;}] call CBA_fnc_addEventHandler;

    // Register newPH event handler
    ["KPLIB_permission_newPH", {[_this select 0, _this select 1] call KPLIB_fnc_permission_initDefault;}] call CBA_fnc_addEventHandler;

    KPLIB_permission_data = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_permission_data";

};

/*
    ----- Module Globals -----
*/

KPLIB_permission_list = [];
KPLIB_permission_types = [];
KPLIB_permission_default = [];
KPLIB_permission_groups = [];

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [PERMISSION] Module initialized", diag_tickTime];};

true
