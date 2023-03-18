/*
    File: fn_addArtyToSupport.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2023-03-17
    Last Update: 2023-03-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Check and sync to module a arty unit if given unit is player side.
        if arty is not player side or empty, waitUntil is dead or captured by player.

    Parameter(s):
        _obj - Object to check and sync to module [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_obj", objNull, [objNull]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};
if (!canSuspend) exitWith {_this spawn KPLIB_fnc_addArtyToSupport};

_module = KPLIB_param_supportModule_arty;

while {true} do {
	waitUntil {sleep 1; ((count (crew _obj) > 0) || !alive _obj)};
	if (!alive _obj) exitWith {};
	_NewCrew = crew _obj;
	_OldCrew = _NewCrew;
	if (!(player in _NewCrew) && side _obj == KPLIB_side_player) then {
		_module synchronizeObjectsAdd _NewCrew;
	};
	while {true} do {
	if ((_NewCrew isNotEqualTo _OldCrew) || !alive _obj) exitWith {_module synchronizeObjectsRemove _OldCrew;};
		_NewCrew = crew _obj;
		sleep 1;
	};
	sleep 1;
};

true
