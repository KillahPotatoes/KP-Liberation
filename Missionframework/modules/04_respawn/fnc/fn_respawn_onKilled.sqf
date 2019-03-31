/*
    KPLIB_fnc_respawn_onKilled

    File: fn_respawn_onKilled.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        -

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/
params ["_unit", "_killer", "_respawnType", "_delay"];

setPlayerRespawnTime 1e10;

// Do not spawn the dialog if we're before campaign was started
[{KPLIB_campaignRunning}, {
    // Open respawn dialog
    [] call KPLIB_fnc_respawn_open;
}, _this] call CBA_fnc_waitUntilAndExecute;

true
