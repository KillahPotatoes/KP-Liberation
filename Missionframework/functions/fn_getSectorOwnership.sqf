/*
    File: fn_getSectorOwnership.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-05-22
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the side of the owner of a given position with given radius.

    Parameter(s):
        _pos    - Position to get owner [POSITION, defaults to [0, 0, 0]]
        _radius - Radius to count units [NUMBER, defaults to KPLIB_range_sectorCapture]

    Returns:
        Owner of the position [SIDE]
*/

params [
    ["_pos", [0, 0, 0], [[]], [2, 3]],
    ["_radius", KPLIB_range_sectorCapture, [0]]
];

private _capCount = 3;
private _capRatio = 0.85;
private _capRatioMin = 0.51;
private _blufor = [_pos, _radius, KPLIB_side_player] call KPLIB_fnc_getUnitsCount;
private _opfor = [_pos, _radius, KPLIB_side_enemy] call KPLIB_fnc_getUnitsCount;
private _ratio = 0;

if (_blufor + _opfor != 0) then {
    _ratio = _blufor / (_blufor + _opfor);
};

if (_blufor > 0 && {(_opfor <= _capCount && _ratio > _capRatioMin) || _ratio > _capRatio}) exitWith {KPLIB_side_player};
if (_blufor == 0 && _opfor > _capCount) exitWith {KPLIB_side_enemy};
if (_blufor == 0 && _opfor <= _capCount) exitWith {KPLIB_side_civilian};

KPLIB_side_resistance
