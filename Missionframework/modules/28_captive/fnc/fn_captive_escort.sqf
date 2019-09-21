/*
    KPLIB_fnc_captive_escort

    File: fn_captive_escort.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-21
    Last Update: 2019-09-21
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
_escort setVariable ["KPLIB_isEscorting", true, true];
_escort setVariable ["KPLIB_escorting", _unit, true];

// Attach the captive to the player
_unit attachTo [_escort, [0, 1, 0]];

// Add the action to release the captive
[
    _escort,
    ["STR_KPLIB_ACTION_STOPESCORT", name _unit],
    [{[_this select 0, _this select 2] call KPLIB_fnc_captive_stopEscort;}, nil, -800, false, true, "","", 10]
] call KPLIB_fnc_common_addAction;

true
