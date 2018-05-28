/*
    KP Liberation server side event loop

    File: eventLoop.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-25
    Last Update: 2018-05-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Does periodic checks on players and emits events when necessary
*/

while {KPLIB_campaignRunning} do {
    // FOB Event
    // Get all players
    private _players = allPlayers select {alive _x && !(_x isKindOf "HeadlessClient_F")};
    private _checkedPlayers = [];

    // Check for players inside fobs
    {
        private _fob = _x;
        private _inFob = _players inAreaArray [getMarkerPos _fob, KPLIB_range_fob, KPLIB_range_fob];
        _checkedPlayers append _inFob;
        // Handle all players in current fob
        {
            // If player is in current fob but it is not set on him we need to Emit event
            if(!(_x getVariable ["KPLIB_fob", ""] isEqualTo _fob)) then {
                // Save current player fob on player
                _x setVariable ["KPLIB_fob", _fob];
                // Emit event
                ["player_fob", [_x, _fob], true] call KPLIB_fnc_event_trigger;
            };
        } forEach _inFob;
    } forEach (KPLIB_sectors_fobs + ["KPLIB_eden_startbase_marker"]);

    // Players that left are outside of fobs
    {
        if(!(_x getVariable ["KPLIB_fob", ""] isEqualTo "")) then {
            // Remove fob that was saved on player
            _x setVariable ["KPLIB_fob", ""];
            // Emit event
            ["player_fob", [_x, ""], true] call KPLIB_fnc_event_trigger;
        };
    } forEach (_players - _checkedPlayers);

    uiSleep 3;
};
