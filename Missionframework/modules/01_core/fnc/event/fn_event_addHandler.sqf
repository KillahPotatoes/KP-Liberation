/*
    KPLIB_fnc_core_event_addHandler

    File: fn_core_event_addHandler.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-05-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds Liberation scripted event handler

    Parameter(s):
        0: STRING - Event name
        1: CODE - Code executed when event is triggered

    Returns:
    NUMBER - ID of the handler for given event
*/

params [
    ["_name", nil, [""]],
    ["_code", nil, [{}]]
];

private _eventName = format["KPLIB_eventId_%1", _name];

// Create event handler and return ID
[true, _eventName, _code] call BIS_fnc_addScriptedEventHandler;

true
