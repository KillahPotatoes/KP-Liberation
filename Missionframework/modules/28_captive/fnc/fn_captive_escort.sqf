/*
    KPLIB_fnc_captive_escort

    File: fn_captive_escort.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-21
    Last Update: 2019-09-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Attach a captive to the escorting player.

    Parameter(s):
        _unit       - Unit which will be escorted   [OBJECT, defaults to objNull]
        _escort     - Escorting player              [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_unit", objNull, [objNull]],
    ["_escort", objNull, [objNull]]
];

// Exit on missing object
if (isNull _unit || isNull _escort) exitWith {
    false
};

// Set variable on escort
_escort setVariable ["KPLIB_captive_isEscorting", true, true];
_escort setVariable ["KPLIB_captive_escorting", _unit, true];

// Attach the captive to the player
_unit attachTo [_escort, [0, 1, 0]];

// Switch the load action from unit to player
_unit removeAction (_unit getVariable ["KPLIB_captive_loadID", 9000]);
private _id = [
    _escort,
    ["STR_KPLIB_ACTION_LOADCAPTIVE", name _unit],
    [{[_this select 3] call KPLIB_fnc_captive_loadCaptive;}, _unit, -800, false, true, "", "({(_x emptyPositions ""cargo"") > 0} count (_target nearEntities [[""LandVehicle"", ""Air""], 5])) > 0", 10]
] call KPLIB_fnc_common_addAction;
_unit setVariable ["KPLIB_captive_loadID", _id];

// Add the action to release the captive
private _id = [
    _escort,
    ["STR_KPLIB_ACTION_STOPESCORT", name _unit],
    [{[_this select 0, _this select 2] call KPLIB_fnc_captive_stopEscort;}, nil, -800, false, true, "","", 10]
] call KPLIB_fnc_common_addAction;

// Write the id into the player
_escort setVariable ["KPLIB_stopEscort_id", _id];

true
