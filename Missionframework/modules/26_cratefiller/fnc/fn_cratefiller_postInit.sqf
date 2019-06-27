/*
    KPLIB_fnc_cratefiller_postInit

    File: fn_cratefiller_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2019-06-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {
    ["Module initializing...", "POST] [CRATEFILLER", true] call KPLIB_fnc_common_log;

    // Cratefiller permission
    [
        "Cratefiller",
        {},
        false,
        "GroupLogistics"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Cratefiller logistic menu
    [
        "Cratefiller",
        {
            if (["Cratefiller"] call KPLIB_fnc_permission_checkPermission && KPLIB_param_cratefiller) then {
                closeDialog 0;
                [] call KPLIB_fnc_cratefiller_openDialog;
            } else {
                [
                    ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
                    [[localize "STR_KPLIB_HINT_NOCRATEFILLER", localize "STR_KPLIB_HINT_NOPERMISSION"] select KPLIB_param_cratefiller]
                ] call CBA_fnc_notify;
            };
        },
        "STR_KPLIB_LOGISTIC_CRATEFILLER"
    ] call KPLIB_fnc_logistic_addMenu;

    // create cratefiller presets on startup
    [] call KPLIB_fnc_cratefiller_presets;
};

if (isServer) then {["Module initialized", "POST] [CRATEFILLER", true] call KPLIB_fnc_common_log;};

true
