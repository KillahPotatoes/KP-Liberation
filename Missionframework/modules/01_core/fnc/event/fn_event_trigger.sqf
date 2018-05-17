/*
    KPLIB_fnc_core_event_trigger

    File: fn_core_event_trigger.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-05-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Triggers Liberation scripted event handler

    Parameter(s):
        0: STRING - Name of event
        1: ARRAY - Array of arguments passed to triggered event
        2: ANY - OPTIONAL - Where event should be triggered (remoteExec target). Global by default.

    Returns:
    BOOLEAN
*/

params [
    ["_name", nil, [""]],
    ["_arguments", [], [[]]],
    ["_targets", [0]]
];

private _eventName = format["KPLIB_event_%1", _name];

[missionnamespace, _eventName, _arguments] remoteExec ["BIS_fnc_callscriptedeventhandler", _targets, false];

true
