/*
    KPLIB_fnc_init_createParamVar

    File: fn_init_createParamVar.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-04-29
    Last Update: 2018-04-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Creates variable in format of "KPLIB_param_<name>" with given value.
    Should be used to create unique non param variable names.

    Parameter(s):
        0: STRING - Name of parameter, used to "namespaced" variable
        1: ANY - Value of variable
        2: BOOL - should created variable be public

    Returns:
    BOOL
*/
params ["_name", ["_value", nil], ["_public", true]];

// Create param variable
missionNamespace setVariable [
    format ["KPLIB_param_%1", _name],
    _value,
    _public
];

true
