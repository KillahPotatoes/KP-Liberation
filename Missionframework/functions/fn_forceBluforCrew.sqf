/*
    File: fn_forceBluforCrew.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2024-08-27
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Creates vehicle crew from vehicle config.
        If the crew isn't the same side as the players, it'll create a player side crew.

    Parameter(s):
        _veh - Vehicle to add the blufor crew to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_veh", objNull, [objNull]]
];

if (isNull _veh) exitWith {["Null object given"] call BIS_fnc_error; false};

// Create crew
_crew = [_veh, KPLIB_side_player] call KPLIB_fnc_createCrew;

_grp = _crew select 1;

// Set the crew to safe behaviour
_grp setBehaviour "SAFE";

true
