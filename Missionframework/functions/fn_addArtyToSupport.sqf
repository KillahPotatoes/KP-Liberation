/*
    File: fn_addArtyToSupport.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2023-03-17
    Last Update: 2023-04-26
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

private _objcrew = crew _obj;

if (!(player in _objcrew) && side _obj == KPLIB_side_player) then {
    KPLIB_param_supportModule_arty synchronizeObjectsAdd [vehicle _obj];
    {
        _x addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator", "_useEffects"];
            if ((side _unit == KPLIB_side_player) && (_unit != player)) then {
                KPLIB_param_supportModule_arty synchronizeObjectsRemove [_unit];
            };
        }];
    } forEach _objcrew;
};

_obj addEventHandler ["GetIn", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    if ((side _unit == KPLIB_side_player) && (_unit != player)) then {
        KPLIB_param_supportModule_arty synchronizeObjectsAdd [vehicle _vehicle];
        _unit addEventHandler ["Killed", {
            params ["_unit", "_killer", "_instigator", "_useEffects"];
                if ((side _unit == KPLIB_side_player) && (_unit != player)) then {
                    KPLIB_param_supportModule_arty synchronizeObjectsRemove [_unit];
                };
        }];
    };
}];

_obj addEventHandler ["GetOut", {
    params ["_vehicle", "_role", "_unit", "_turret"];
    if ((side _unit == KPLIB_side_player) && (_unit != player)) then {
        KPLIB_param_supportModule_arty synchronizeObjectsRemove [_unit];
    };
}];

_obj addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator", "_useEffects"];
    private _crews = crew _unit;
    KPLIB_param_supportModule_arty synchronizeObjectsRemove [vehicle _unit];
    if (!(player in _crews)) then {
        KPLIB_param_supportModule_arty synchronizeObjectsRemove _crews;
    };
}];

true
