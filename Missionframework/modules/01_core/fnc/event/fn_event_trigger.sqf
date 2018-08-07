#include "defines.hpp"
/*
    KPLIB_fnc_event_trigger

    File: fn_event_trigger.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-08-02
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Triggers Liberation scripted event handler

    Parameter(s):
        0: STRING - Name of event
        1: ARRAY - Array of arguments passed to triggered event
        2: BOOL - OPTIONAL - Should event be global. Local by default.

    Returns:
    BOOL
*/
#ifdef DEBUG_EVENTS
    diag_log format[LOG_PREFIX + "Triggered: %1", _this joinString ", "];
#endif

params [
    ["_name", nil, [""]],
    ["_arguments", [], [[]]],
    ["_global", false, [false]]
];

private _namespace = KPLIB_eventNamespace;
private _handlers = _namespace getVariable [_name, []];

// Call every handler for event
{
    if (_x isEqualType {}) then {
            _arguments call _x;
    }
} forEach _handlers;

// Broadcast global event
if(_global) then {
    KPLIB_eventGlobalReceiver = [_name, _arguments];
    publicVariable "KPLIB_eventGlobalReceiver";
};

true
