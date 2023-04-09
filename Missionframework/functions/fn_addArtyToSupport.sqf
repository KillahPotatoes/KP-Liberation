/*
    File: fn_addArtyToSupport.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2023-03-17
    Last Update: 2023-03-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Check and sync to module a arty unit if given unit is player side.
        if arty is not player side or empty, waitUntil is dead or captured by player.

    Parameter(s):
        _obj - Object to check and sync to module [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_obj", objNull, [objNull]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};
if (!canSuspend) exitWith {_this spawn KPLIB_fnc_addArtyToSupport};

private _module = KPLIB_param_supportModule_arty;

_obj addEventHandler ["GetIn", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    if ((_unit isNotEqualTo player) && (side _unit == KPLIB_side_player)) then {
        _module synchronizeObjectsAdd _unit;
        _unit addEventHandler ["Killed", {
            params ["_unitKilled", "_killer", "_instigator", "_useEffects"];
            _module synchronizeObjectsRemove _unitKilled;
        }];
    };
}];

_obj addEventHandler ["GetOut", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    _module synchronizeObjectsRemove _unit;
}];

_obj addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    _module synchronizeObjectsRemove _unit;
}];

true
