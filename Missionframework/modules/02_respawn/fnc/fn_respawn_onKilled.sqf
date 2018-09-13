/*
    KPLIB_fnc_respawn_onKilled

    File: fn_respawn_onKilled.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-09-13
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    -

    Parameter(s):
    NONE

    Returns:
    NOTHING
*/

systemChat "onKilled";

setPlayerRespawnTime 999999999;

// Do not spawn the dialog if we're before campaign was started
[{
    // Open respawn dialog
    [] call KPLIB_fnc_respawn_open;
}, KPLIB_campaignRunning] call CBA_fnc_waitAndExecute;

