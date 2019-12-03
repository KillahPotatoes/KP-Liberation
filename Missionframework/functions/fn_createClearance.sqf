/*
    File: fn_createClearance.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
if (!isServer) exitWith {false};

params [
    ["_centerPos", [0, 0, 0], [[]], [3]],
    ["_radius", 0, [0]],
    ["_save", false, [false]]
];

if (save_is_loaded && {(KP_liberation_clearances findIf {(_x select 0) isEqualTo _centerPos}) != -1}) exitWith {false};

{
    _x switchLight "OFF";
    _x hideObjectGlobal true;
    _x allowDamage false;
} forEach (nearestTerrainObjects [_centerPos, [], _radius, false, true]);

if (_save) then {
    KP_liberation_clearances pushBackUnique [_centerPos, _radius];
    publicVariable "KP_liberation_clearances";
};

true
