/*
    KPLIB_fnc_permission_postInit

    File: fn_permission_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-07
    Last Update: 2018-12-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [PERMISSION] Module initializing...", diag_tickTime];};

["LightVehicle", {[player, "LightVehicle"] call KPLIB_fnc_permission_getPermission}] call KPLIB_fnc_permission_addPermissionHandler;

if (hasInterface) then {
    // Add event handlers
    player addEventHandler ["GetInMan", {if !(["LightVehicle"] call KPLIB_fnc_permission_checkPermission) then {moveOut player};}];
};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [PERMISSION] Module initialized", diag_tickTime];};

true
