/*
    File: fn_allowCrewInImmobile.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-05
    Last Update: 2020-05-22
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Allows crew in immobile vehicle depending on AllowEnemiesInImmobile parameters.

    Parameter(s):
        _vehicle - Vehicle which should allow immobile crew [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {["Null object given"] call BIS_fnc_error; false};

// KPLIB_param_allowEnemiesInImmobile (0-50-100)
_vehicle allowCrewInImmobile (random 100 < KPLIB_param_allowEnemiesInImmobile);

true
