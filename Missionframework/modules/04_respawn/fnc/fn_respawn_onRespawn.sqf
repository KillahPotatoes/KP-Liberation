/*
    KPLIB_fnc_respawn_onKilled

    File: fn_respawn_onKilled.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        - DESCRIPTION MISSING @veteran29

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/
params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

setPlayerRespawntime 1e10;

// Kill the respawn camera
KPLIB_respawn_camera cameraeffect ["TERMINATE", "BACK"];

true
