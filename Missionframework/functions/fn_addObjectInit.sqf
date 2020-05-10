/*
    File: fn_addObjectInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-05-08
    Last Update: 2020-04-29
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Applies code from kp_objectInits.sqf to given object. Returns true if some code was applied, false if object has no KPLIB init code.

    Parameter(s):
        _object - Object which should get init code applied, if there is any defined [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_object", objNull, [objNull]]
];

if (isNull _object) exitWith {["Null object given"] call BIS_fnc_error; false};

// Create objectInitsCache object for this machine, if not present
if (isNil "KPLIB_objectInitsCache") then {KPLIB_objectInitsCache = createSimpleObject ["a3\weapons_f\empty.p3d", [-7580, -7580, 0], true];};

private _elements = KPLIB_objectInitsCache getVariable typeOf _object;

// Find and cache matching objectInits
if (isNil "_elements") then {
    _elements = KPLIB_objectInits select {
        _x params ["_classes", "", ["_inheritance", false]];

        if (_inheritance) then {
            {
                if (_object isKindOf _x) exitWith {true};
                false
            } forEach _classes // return
        } else {
            // return
            (toLower (typeOf _object)) in (_classes apply {toLower _x})
        };
    };

    KPLIB_objectInitsCache setVariable [typeOf _object, _elements];
};

if (_elements isEqualTo []) exitWith {
    false
};

{
    _object call (_x select 1);
} forEach _elements;

true
