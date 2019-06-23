#include "script_component.hpp"
/*
    KPLIB_fnc_logistic_postInit

    File: fn_logistic_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-05-18
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
    ["Module initializing...", "POST] [LOGISTIC", true] call KPLIB_fnc_common_log;

    // Logistic station permissions
    // Recycle
    [
        "Recycle",
        {},
        false,
        "GroupLogistics"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    // Resupply
    [
        "Resupply",
        {},
        false,
        "GroupLogistics"
    ] call KPLIB_fnc_permission_addPermissionHandler;

    [
        "Recycle",
        {
            if (["Recycle"] call KPLIB_fnc_permission_checkPermission) then {
                closeDialog 0;
                [] call KPLIB_fnc_logistic_openRecycleDialog;
            } else {
                [
                    ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
                    [localize "STR_KPLIB_HINT_NOPERMISSION"]
                ] call CBA_fnc_notify;
            };
        },
        "STR_KPLIB_LOGISTIC_RECYCLE"
    ] call KPLIB_fnc_logistic_addMenu;

    [
        "Resupply",
        {
            if (["Resupply"] call KPLIB_fnc_permission_checkPermission) then {
                closeDialog 0;
                [] call KPLIB_fnc_logistic_openResupplyDialog;
            } else {
                [
                    ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
                    [localize "STR_KPLIB_HINT_NOPERMISSION"]
                ] call CBA_fnc_notify;
            };
        },
        "STR_KPLIB_LOGISTIC_RESUPPLY"
    ] call KPLIB_fnc_logistic_addMenu;

    private _vehicles = [];
    {
        _vehicles append (missionNamespace getVariable [format ["KPLIB_preset_%1F", _x], ""]);
        _vehicles append (missionNamespace getVariable [format ["KPLIB_preset_%1E", _x], ""]);
    } forEach [
        "vehLightUnarmed",
        "vehLightArmed",
        "vehTrans",
        "boats",
        "vehHeavyApc",
        "vehHeavy",
        "vehAntiAir",
        "vehArty",
        "heliTrans",
        "heliAttack",
        "planeTrans",
        "jets",
        "logistic"
    ];
    LSVAR("Vehicles", _vehicles);
};

if (isServer) then {["Module initialized", "POST] [LOGISTIC", true] call KPLIB_fnc_common_log;};

true
