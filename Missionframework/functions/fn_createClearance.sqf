/*
    File: fn_createClearance.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Adds a terrain objects clearance around given position with given radius.
        If the save switch is set to true, the clearance will be saved during the campaign.

    Parameter(s):
        _centerPos  - Position for the clearance                                [POSITION, defaults to [0, 0, 0]]
        _radius     - Radius of the clearance around the center                 [NUMBER, defaults to 0]
        _save       - Switch to decide if the clearance should be persistent    [BOOL, defaults to false]

    Returns:
        Function reached the end [BOOL]
*/

if (!isServer) exitWith {false};

params [
    ["_centerPos", [0, 0, 0], [[]], [3]],
    ["_radius", 0, [0]],
    ["_save", false, [false]]
];

if (_centerPos isEqualTo [0, 0, 0]) exitWith {["Zero position given"] call BIS_fnc_error; false};
if (_radius isEqualTo 0) exitWith {["Zero radius given"] call BIS_fnc_error; false};

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
