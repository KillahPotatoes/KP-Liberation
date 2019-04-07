/*
    KPLIB_fnc_logistic_postInit

    File: fn_logistic_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-16
    Last Update: 2019-04-06
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
    diag_log format ["[KP LIBERATION] [%1] [POST] [LOGISTIC] Module initializing...", diag_tickTime];

    [
        "Recycle",
        {
            if ([player, "Recycle"] call KPLIB_fnc_permission_getPermission) then {
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
            if ([player, "Resupply"] call KPLIB_fnc_permission_getPermission) then {
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

    [
        "Cratefiller",
        {
            if ([player, "Cratefiller"] call KPLIB_fnc_permission_getPermission && KPLIB_param_cratefiller) then {
                closeDialog 0;
                [] call KPLIB_fnc_cratefiller_openDialog;
            } else {
                [
                    ["a3\3den\data\controlsgroups\tutorial\close_ca.paa", 1, [1,0,0]],
                    [localize "STR_KPLIB_HINT_NOPERMISSION"]
                ] call CBA_fnc_notify;
            };
        },
        "STR_KPLIB_LOGISTIC_CRATEFILLER"
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
    KPLIB_logistic_data setVariable ["Vehicles", _vehicles, true]
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [LOGISTIC] Module initialized", diag_tickTime];};

true
