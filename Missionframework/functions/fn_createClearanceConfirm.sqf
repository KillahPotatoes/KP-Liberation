/*
    File: fn_createClearanceConfirm.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-10
    Last Update: 2020-04-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Displays a confirmation dialog for the create clearance action.
        If confirmed, the clearance will be created by the server.

    Parameter(s):
        _centerPos  - Position for the clearance                                [POSITION, defaults to [0, 0, 0]]
        _radius     - Radius of the clearance around the center                 [NUMBER, defaults to 0]
        _save       - Switch to decide if the clearance should be persistent    [BOOL, defaults to false]

    Returns:
        Creation confirmed [BOOL]
*/

params [
    ["_centerPos", [0, 0, 0], [[]], [3]],
    ["_radius", 0, [0]],
    ["_save", false, [false]]
];

if (_centerPos isEqualTo [0, 0, 0]) exitWith {["Zero position given"] call BIS_fnc_error; false};
if (_radius isEqualTo 0) exitWith {["Zero radius given"] call BIS_fnc_error; false};
if (!canSuspend) exitWith {_this spawn KPLIB_fnc_createClearanceConfirm};

private _text = format [
    localize "STR_CONFIRM_CLEARANCE_TEXT",
    count (nearestTerrainObjects [_centerPos, [], _radius, false, true]),
    floor _radius,
    ["FOB", [_centerPos] call KPLIB_fnc_getFobName] joinString " "
];

private _confirmed = [
    _text,
    localize "STR_CONFIRM_CLEARANCE_TITLE",
    localize "STR_CONFIRM",
    localize "STR_RECYCLING_CANCEL",
    nil,
    false,
    false
] call BIS_fnc_guiMessage;

if (_confirmed) then {
    [_centerPos, _radius, true] remoteExecCall ["KPLIB_fnc_createClearance", 2];
};

_confirmed
