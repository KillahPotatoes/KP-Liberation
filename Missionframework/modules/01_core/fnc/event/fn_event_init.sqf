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

// Exit if not ran
if(!isNil "KPLIB_event_namespace") exitWith {
    diag_log LOG_PREFIX + "Event system already initialized!";
};

KPLIB_eventNamespace = call KPLIB_fnc_common_createNamespace;

// Subscribe to global events
"KPLIB_eventGlobalReceiver" addPublicVariableEventHandler {
    #ifdef DEBUG_EVENTS
        diag_log format[LOG_PREFIX + "Recived: %1", _this joinString ", " ];
    #endif
    (_this select 1) call KPLIB_fnc_event_trigger;
};

// STILL WIP
// Create server side event loop
if(isServer) then {
    [] spawn {
        while {KPLIB_campaignRunning} do {
            // FOB Event
            // TODO move to function, REFACTOR!! CHECK PERFORMANCE!!
            call {
                // Get all players
                private _players = allPlayers select {alive _x};

                // Check for players inside fobs
                {
                    private _fob = _x;
                    private _inFob = _players inAreaArray [getMarkerPos _fob, KPLIB_range_fob, KPLIB_range_fob];
                    {
                        if(_x getVariable ["KPLIB_fob", false] isEqualTo false) then {
                            // Save current player fob on player
                            _x setVariable ["KPLIB_fob", _fob];
                            // Emit event
                            ["player_inFob", [_x, _fob]] call KPLIB_fnc_event_trigger;
                        };
                        // We don't need to check this player anymore
                        _players = _players - [_x];
                    } forEach _inFob;
                } forEach (KPLIB_sectors_fobs);

                // Players that left are outside of fobs
                {
                    if(_x getVariable ["KPLIB_fob", false] isEqualType "") then {
                        // Remove fob that was saved on player
                        _x setVariable ["KPLIB_fob", false];
                        // Emit event
                        ["player_inFob", [_x, false]] call KPLIB_fnc_event_trigger;
                    };
                } forEach _players;
            };

            uiSleep 3;
        };
    };
};

true
