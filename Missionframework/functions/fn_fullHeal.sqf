/*
    File: fn_fullHeal.sqf
    Author: KP Liberation APR Dev Team - https://github.com/Apricot-ale/KP-Liberation-APR
    Date: 2023-03-17
    Last Update: 2024-06-20
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Fully heal all player side units within a given radius of a center position.
        If applied, display a hint with the name of caller.

    Parameter(s):
        _centerPos  - Position for the apply heal script area                   [POSITION, defaults to [0, 0, 0]]
        _radius     - Radius of the apply heal script from the center           [NUMBER, defaults to 0]
        _caller     - Caller unit of this function                              [OBJECT, defaults to objNull]

    Returns:
        Heal confirmed [BOOL]
*/

params [
    ["_centerPos", [0, 0, 0], [[]], [3]],
    ["_radius", 0, [0]],
    ["_caller", objNull, [objNull]]
];

if (_centerPos isEqualTo [0, 0, 0]) exitWith {["Zero position given"] call BIS_fnc_error; false};
if (_radius isEqualTo 0) exitWith {["Zero radius given"] call BIS_fnc_error; false};
if (isNull _caller) exitWith {["Null object given"] call BIS_fnc_error; false};
if (!canSuspend) exitWith {_this spawn KPLIB_fnc_fullHeal;};
if (KPLIB_param_fullHealCheckEnemies && ([_centerPos, 350, KPLIB_side_enemy ] call KPLIB_fnc_getUnitsCount) > 1 ) exitWith {[localize "STR_FULLHEAL_ENEMIES_NEARBY"] remoteExecCall ["hint", _caller];};

private _targetunits = units KPLIB_side_player select {(alive _x) and (_x distance _centerPos <= _radius)};
private _healedunits = [];
private _cooldownunits = [];
private _acefr = false;
if (isClass (configfile >> "CfgPatches" >> "ace_field_ration")) then {_acefr = true};

{
    private _target = _x;
    private _localtime = time;
    private _lastHeal = _target getVariable ["lastHealTime", -6000];
    private _cooltime = KPLIB_param_fullHealCooldown + _lastHeal;
    if (_cooltime < _localtime) then {
        _target setVariable ["lastHealTime", _localtime];
        if (KPLIB_ace_med) then {[_caller, _target] call ace_medical_treatment_fnc_fullHeal;} else {_target setDamage 0;};
        if (isPlayer _target) then {
            if (_acefr) then {_target setVariable ["acex_field_rations_thirst",0]; _target setVariable ["acex_field_rations_hunger",0];};
            if (_target isNotEqualTo _caller) then {_healedunits pushBack _target;};
        };
    } else {
        _cooldownunits pushBack _target;
        private _cooldowntime = (_cooltime - _localtime)/60;
        if (_target isNotEqualTo _caller) then {
            [format [localize "STR_FULLHEAL_COOLDOWN", round _cooldowntime, name _caller]] remoteExecCall ["hint", _target];
        } else {
            [format [localize "STR_FULLHEAL_COOLDOWN_OWN", round _cooldowntime]] remoteExecCall ["hint", _target];
        };
    };
} forEach _targetunits;

if (!(_caller in _cooldownunits)) then {[localize "STR_FULLHEAL_DONE"] remoteExecCall ["hint", _caller];};
[format [localize "STR_FULLHEAL_APPLY", name _caller]] remoteExecCall ["hint", _healedunits];
sleep 5;
[""] remoteExecCall ["hintSilent", _targetunits];

true
