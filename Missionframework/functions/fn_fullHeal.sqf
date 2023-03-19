/*
    File: fn_fullHeal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2023-03-17
    Last Update: 2023-03-17
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
if (!canSuspend) exitWith {_this spawn KPLIB_fnc_fullHeal};

// Find all alive friendly units within the given radius from the center position
_units = allUnits select {(side _x == KPLIB_side_player) and (alive _x) and (_x distance _centerPos <= _radius)};

// Loop through each unit and heal them
{
    private _target = _x;
    private _name = name _caller;
    private _callermsg = localize "STR_FULLHEAL_DONE";
    private _targetmsg = format [localize "STR_FULLHEAL_APPLY", _name];
	
    // Use the ace fullHeal function if using ace.
    if (KPLIB_ace_med) then {
        [_caller, _target] call ace_medical_treatment_fnc_fullHeal;
    } else {
        _target setDamage 0;
    };
	
	// Display a hint to show healed and who healed

    [_callermsg] remoteExec [hint, _caller];
    [_targetmsg] remoteExec [hint, _target];
    sleep 3;
    [""] remoteExec [hintSilent, _target];

} forEach _units;

true
