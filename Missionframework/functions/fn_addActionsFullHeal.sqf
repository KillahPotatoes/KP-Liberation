/*
    File: fn_addActionsFullHeal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2023-03-26
    Last Update: 2023-03-26
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds fullHeal action to object.

    Parameter(s):
        _obj - Object to add fullHeal action to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_obj", objNull, [objNull]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};

// Full Heal
_obj addAction [
    ["<t color='#80FF80'>", localize "STR_FULLHEAL_ACTION", "</t> <img size='2' image='res\ui_fullheal.paa'/>"] joinString "",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        [getpos _target, KPLIB_range_fob * 0.25, _caller] call KPLIB_fnc_fullheal;
    },
    nil,
    -705,
    false,
    true,
    "",
    "
        KPLIB_param_fullHeal
    "
];

true
