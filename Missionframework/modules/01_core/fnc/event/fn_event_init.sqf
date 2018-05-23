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

// Exit if not ran
if(!isNil "KPLIB_event_namespace") exitWith {
    diag_log "[KP LIBERATION] [EVENT] Event system already initialized! ";
};

KPLIB_eventNamespace = call KPLIB_fnc_common_createNamespace;

// Subscribe to global events
"KPLIB_eventGlobalReceiver" addPublicVariableEventHandler {
    (_this select 1) call KPLIB_fnc_event_trigger;
};

true
