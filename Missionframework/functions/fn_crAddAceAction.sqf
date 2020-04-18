/*
    File: fn_crAddAceAction.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds action for healing with ACE field dressing to a given object.

    Parameter(s):
        _civ - Civilian to add the healing action to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_civ", objNull, [objNull]]
];

if (isNull _civ) exitWith {["Null object given"] call BIS_fnc_error; false};

if (KP_liberation_civrep_debug > 0) then {[format ["ace_action called on: %1", debug_source], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};

_civ addAction [
    "<t color='#FF0000'>" + localize "STR_CR_ACE_ACTION" + "</t>",
    {
        private _target = _this select 0;
        private _caller = _this select 1;

        if ("ACE_fieldDressing" in (vestItems player + uniformItems player + backpackItems player)) then {
            _caller removeItem "ACE_fieldDressing";
            _target setDamage 0;
        } else {
            hint localize "STR_CR_ACE_ACTION_FAIL";
            sleep 3;
            hintSilent "";
        };
    },
    nil,
    1.5,
    true,
    true,
    "",
    "(damage _target) >= 0.5",
    3
];

true
