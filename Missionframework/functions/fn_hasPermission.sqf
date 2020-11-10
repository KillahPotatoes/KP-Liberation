/*
    File: fn_hasPermission.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-04-09
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
if (!GRLIB_permissions_param) exitWith {true};

if (isNil "GRLIB_last_permission_check_time") then {GRLIB_last_permission_check_time = -1000;};

if (time > GRLIB_last_permission_check_time + 10) then {
    GRLIB_last_permission_check_time = time;
    GRLIB_permissions_cache = ((GRLIB_permissions select {(_x select 0) isEqualTo (getPlayerUID player)}) select 0) select 2;
};

if (isNil "GRLIB_permissions_cache") exitWith {false};

if (count GRLIB_permissions_cache > _permission) then {
    GRLIB_permissions_cache select _permission
} else {
    false
};
