/*
    KP LIBERATION INIT FILE

    File: init.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-03-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    General initialization file for Liberation. Runs after initServer, initPlayerLocal and after the save is loaded.
*/

waitUntil {!isNil "KPLIB_initServerDone"};
waitUntil {KPLIB_initServerDone};
waitUntil {KPLIB_save_loaded};

if (!isDedicated) then {
    waitUntil {!isNil "KPLIB_initClientDone"};
    waitUntil {KPLIB_initClientDone};
};

diag_log format [
    "[KP LIBERATION] [MISSIONSTART] Missionfile: %1 - World Name: %2 - Version: %3 - Blufor: %4 - Opfor: %5 - Resistance: %6 - Civilians: %7 - Arsenal: %8 - ACE: %9",
    (localize "STR_MISSION_TITLE"),
    worldName,
    (localize "STR_MISSION_VERSION"),
    KPLIB_preset_blufor,
    KPLIB_preset_opfor,
    KPLIB_preset_resistance,
    KPLIB_preset_civilians,
    KPLIB_preset_arsenal,
    KPLIB_ace_enabled
];

// Call module inits
call compile preprocessFileLineNumbers "modules\01_core\initModule.sqf";
call compile preprocessFileLineNumbers "modules\02_build\initModule.sqf";
call compile preprocessFileLineNumbers "modules\99_adminMenu\initModule.sqf";
call compile preprocessFileLineNumbers "modules\99_playerOptions\initModule.sqf";

KPLIB_initDone = true;
