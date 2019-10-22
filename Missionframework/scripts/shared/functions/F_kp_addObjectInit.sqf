/*
	F_addObjectInit

	File: F_kp_addObjectInit.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2019-05-08
	Last Update: 2019-05-08

	Description:
	Applies code from kp_objectInits.sqf to given object. Returns true if some code was applied, false if object has no KPLIB init code.

	Parameter(s):
		0: OBJECT - Object which should get init code applied, if there is any defined. (Default objNull)

	Returns:
	BOOL
*/

params [["_object", objNull, [objNull]]];

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
