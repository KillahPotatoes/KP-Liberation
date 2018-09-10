/*
    KP Liberation periodic save trigger script

    File: timer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-03-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Repeatedly triggers the save process depending on configured time interval.
*/
scriptName "KPLIB_saveTimer";

waitUntil {KPLIB_save_loaded};

// Add saveTimer per frame handler
[{
    params ["_args", "_handle"];

    if (KPLIB_campaignRunning) then {
        [] call KPLIB_fnc_init_save;
    } else {
        _handle call CBA_fnc_removePerFrameHandler;
        diag_log "[KP LIBERATION] [IMPORTANT] Save timer deactivated due to KPLIB_campaignRunning false.";
    }
}, KPLIB_save_interval] call CBA_fnc_addPerFrameHandler;
