/*
    KPLIB_fnc_event_removeHandler

    File: fn_event_removeHandler.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-08-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Removes Liberation scripted event handler

    Parameter(s):
        0: STRING - Name of event
        1: NUMBER - ID of the handler for given event

    Returns:
    BOOL - TRUE if removed, FALSE if didn't exist
*/

params [
    ["_name", nil, [""]],
    ["_id", nil, [0]]
];

private _namespace = KPLIB_eventNamespace;
private _handlers = _namespace getVariable [_name, []];

// Id must be unsigned and in handlers array range
if(_id > -1 && (count _handlers) > _id) exitWith {
    _handlers set [_id, -1];
    //Handler found and removed
    true
};

// No handler with given ID
false
