#include "defines.hpp"
/*
    KPLIB_fnc_event_init

    File: fn_event_init.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-18
    Last Update: 2018-05-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes Liberation event system

    Parameter(s):
    NONE

    Returns:
    BOOLEAN
*/

// Exit if already initialized
if(!isNil "KPLIB_event_namespace") exitWith {
    diag_log LOG_PREFIX + "Event system already initialized!";
};

KPLIB_eventNamespace = call KPLIB_fnc_common_createNamespace;

// we can't add public var Eh at preinit, spawn will fix it.
// "Inspired" by: <https://github.com/CBATeam/CBA_A3/blob/435ae41e9282ab71d34150bb3c1a8621a18bcfb0/addons/events/XEH_preInit.sqf#L19>
[] spawn {
    // Subscribe to global events
    "KPLIB_eventGlobalReceiver" addPublicVariableEventHandler {
        #ifdef DEBUG_EVENTS
            diag_log format[LOG_PREFIX + "Recived: %1", _this joinString ", " ];
        #endif
        (_this select 1) call KPLIB_fnc_event_trigger;
    };
};

// Create server side event loop
if(isServer) then {
    execVM "modules\01_core\scripts\server\eventLoop.sqf";
};

true
