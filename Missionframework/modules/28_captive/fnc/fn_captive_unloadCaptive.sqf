/*
    KPLIB_fnc_captive_unloadCaptive

    File: fn_captive_unloadCaptive.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-22
    Last Update: 2019-09-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Unloads the give unit and removes the action from the vehicle.

    Parameter(s):
        _unit       - Unit to load in vehicle           [OBJECT, defaults to objNull]
        _vehicle    - Vehicle which carries the unit    [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

// Exit on missing object
if (isNull _unit || isNull _vehicle) exitWith {
    false
};

// Emit target event to move the unit out of the vehicle
["KPLIB_captive_unload", [_unit, _vehicle], _unit] call CBA_fnc_targetEvent;

// Emit global event
["KPLIB_captive_unloaded", [_unit, _vehicle]] call CBA_fnc_globalEvent;

true
