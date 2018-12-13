/*
    KPLIB_fnc_init_receiveInit

    File: fn_init_receiveInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-25
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Receive data from the server initialization and split the packages accordingly.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (isDedicated) exitWith {};

diag_log format ["[KP LIBERATION] [%1] [CLIENT INIT] Client initializing...", diag_tickTime];

diag_log "[KP LIBERATION] [CLIENT INIT] Receiving data...";

// Wait until the server has send the preset data
waitUntil {!isNil "KPLIB_preset_allData"};

diag_log "[KP LIBERATION] [CLIENT INIT] Data received. Processing...";

{
    {
        missionNamespace setVariable [_x select 0, _x select 1];
    } forEach _x;
} forEach KPLIB_preset_allData;

diag_log "[KP LIBERATION] [CLIENT INIT] Data processed";

if (hasInterface) then {
    // Preload the arsenal to speed up arsenal opening during the game
    ["Preload"] call BIS_fnc_arsenal;
    diag_log "[KP LIBERATION] [CLIENT INIT] Preloaded Arsenal";

    // Create needed local markers
    [] call KPLIB_fnc_init_clientMarkers;
    diag_log "[KP LIBERATION] [CLIENT INIT] Client Markers initialized";
};

diag_log format ["[KP LIBERATION] [%1] [CLIENT INIT] Client initialized", diag_tickTime];

true
