/*
    File: fn_hasPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-22
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks if local player has the given permission granted.

    Parameter(s):
        _permission - Permission to check [NUMBER, defaults to -1]

    Returns:
        Has permission granted [BOOL]
*/

params [
    ["_permission", -1, [0]]
];

if (_permission isEqualTo -1) exitWith {["No permission number given"] call BIS_fnc_error; false};
if (!KPLIB_param_permissions) exitWith {true};

if (isNil "KPLIB_last_permission_check_time") then {KPLIB_last_permission_check_time = -1000;};

if (time > KPLIB_last_permission_check_time + 10) then {
    KPLIB_last_permission_check_time = time;
    KPLIB_permissions_cache = ((KPLIB_permissions select {(_x select 0) isEqualTo (getPlayerUID player)}) select 0) select 2;
};

if (isNil "KPLIB_permissions_cache") exitWith {false};

if (count KPLIB_permissions_cache > _permission) then {
    KPLIB_permissions_cache select _permission
} else {
    false
};
