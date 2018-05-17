/*
    KPLIB_fnc_core_event_removeHandler

    File: fn_core_event_removeHandler.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-05-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Removes Liberation scripted event handler

    Parameter(s):
        0: STRING - Name of event
        1: NUMBER - ID of the handler for given event

    Returns:
    BOOLEAN - TRUE if removed, FALSE if didn't exist
*/

params [
    ["_name", nil, [""]],
    ["_id", nil, [0]]
];

private _eventName = format["KPLIB_event_%1", _name];

// Remove event handler and return bool
[true, _eventName, _id] call BIS_fnc_removeScriptedEventHandler
