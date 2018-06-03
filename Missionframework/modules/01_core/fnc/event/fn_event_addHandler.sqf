#include "defines.hpp"
/*
    KPLIB_fnc_event_addHandler

    File: fn_event_addHandler.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-05-23
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

private _namespace = KPLIB_eventNamespace;
private _handlers = _namespace getVariable _name;

// If there is no handlers array initialize new and return id
if(isNil "_handlers") exitWith {
    _namespace setVariable [_name, [_code]];
    0 // Return first handler ID
};

// Find first empty array position denoted by -1
private _id =  _handlers find -1;

if (_id < 0) then { // No empty space append to array
    _id = _handlers pushBack _code;
} else { // Empty space found, reuse index
    _handlers set [_id, _code];
};

// Return handler ID
_id
