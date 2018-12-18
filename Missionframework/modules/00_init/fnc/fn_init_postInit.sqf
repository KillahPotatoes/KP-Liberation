/*
    KPLIB_fnc_init_postInit

    File: fn_init_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (!isServer) then {
    // Called in the scheduled postInit environment allows the small wait in the function
    [] call KPLIB_fnc_init_receiveInit;
} else {
    diag_log format ["[KP LIBERATION] [%1] [POST] [INIT] Module initializing...", diag_tickTime];

    // Sort the sector markers to category arrays
    [] call KPLIB_fnc_init_sortSectors;

    // Load current save
    [] call KPLIB_fnc_init_load;

    // Add saveTimer per frame handler
    [{
        params ["_args", "_handle"];

        if (KPLIB_save_loaded && (time > 0)) then {
            if (KPLIB_campaignRunning) then {
                [] call KPLIB_fnc_init_save;
            } else {
                _handle call CBA_fnc_removePerFrameHandler;
                diag_log "[KP LIBERATION] [IMPORTANT] Save timer deactivated due to KPLIB_campaignRunning false.";
            };
        };
    }, KPLIB_param_saveInterval] call CBA_fnc_addPerFrameHandler;

    // Create locked vehicle markers
    [] call KPLIB_fnc_init_createLockedVehMarkers;

    // Place down Antennas at Radio Tower sectors
    [] call KPLIB_fnc_init_placeTowers;

    diag_log format ["[KP LIBERATION] [%1] [POST] [INIT] Module initialized", diag_tickTime];
};

// Player section
if (hasInterface) then {
    // Preload the arsenal to speed up arsenal opening during the game
    ["Preload"] call BIS_fnc_arsenal;
};

true
