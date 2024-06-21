/*
    File: fn_crAddAceAction.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2023-04-26
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

if (KPLIB_civrep_debug > 0) then {[format ["ace_action called on: %1", debug_source], "CIVREP"] remoteExecCall ["KPLIB_fnc_log", 2];};

_civ addAction [
    "<t color='#FF0000'>" + localize "STR_CR_ACE_ACTION" + "</t>",
    {
        params ["_target", "_caller"];

        private _items = [
            "ACE_elasticBandage",
            "ACE_fieldDressing",
            "ACE_packingBandage",
            "ACE_quikclot"
        ] arrayIntersect (vestItems _caller + uniformItems _caller + backpackItems _caller);

        if !(_items isEqualTo []) then {
            removeAllActions _target;
            _caller removeItem (selectRandom _items);
            _caller playMove "AinvPknlMstpSnonWnonDnon_medic4";
            sleep 8;
            _target setDamage 0;
            [_caller, _target] call ace_medical_treatment_fnc_fullHeal;
            _target setVariable ["KPLIB_isHealed", true, true];
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
    "alive _originalTarget",
    3
];

true
