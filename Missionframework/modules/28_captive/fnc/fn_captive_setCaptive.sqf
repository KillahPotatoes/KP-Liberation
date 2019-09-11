/*
    KPLIB_fnc_captive_setCaptive

    File: fn_captive_setCaptive.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-11
    Last Update: 2019-09-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Sets an unit into captive mode.

    Parameter(s):
        _unit - Unit to set in captive mode [OBJECT, defaults to objNull]

    Returns:
        Unit set into captive mode [BOOL]
*/

params [
    ["_unit", objNull, [objNull]]
];

// Exit on missing object
if (isNull _unit) exitWith {
    false
};

if !(vehicle _unit isEqualTo _unit) then {
    moveOut _unit;
};

// Set variable on unit
_unit setVariable ["KPLIB_captive", true];

// Remove some equipment of the unit
removeAllWeapons _unit;
removeHeadgear _unit;
removeBackpack _unit;
_unit setUnitPos "UP";
if (KPLIB_ace_enabled) then {
    [_unit, true] call ACE_captives_fnc_setSurrendered;
} else {
    _unit disableAI "ANIM";
    _unit disableAI "MOVE";
    _unit playmove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    _unit setCaptive true;
};



true
