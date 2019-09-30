/*
    KPLIB_fnc_captive_interrogate

    File: fn_captive_interrogate.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-25
    Last Update: 2019-09-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Interrogates the unit, adds intel and deletes it.

    Parameter(s):
        _unit - Unit to load in vehicle [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_unit", objNull, [objNull]]
];

// Exit on missing object
if (isNull _unit) exitWith {
    false
};

// Calculate the intel gain
private _intel = KPLIB_param_captiveIntel;
if !(KPLIB_param_captiveIntelRandom isEqualTo 0) then {
    _intel = _intel + ((round (random (KPLIB_param_captiveIntelRandom * 2))) - KPLIB_param_captiveIntelRandom);
};

// Add the intel
[_intel] call KPLIB_fnc_resources_addIntel;

// Delete the unit
deleteVehicle _unit;

// Emit global event
["KPLIB_captive_interrogated", [_unit]] call CBA_fnc_globalEvent;

true
