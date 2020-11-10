/*
    File: fn_protectObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-08
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Given object will get damage and simulation enabled/disabled.

    Parameter(s):
        _obj    - Object to (un)protect [OBJECT, defaults to objNull]
        _enable - Enable/Disable        [BOOL, defaults to true]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_obj", objNull, [objNull]],
    ["_enable", true, [false]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};

_obj allowDamage _enable;
_obj enableSimulation _enable;

true
