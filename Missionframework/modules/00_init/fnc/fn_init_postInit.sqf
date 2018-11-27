/*
    KPLIB_fnc_init_postInit

    File: fn_init_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {
    diag_log format ["[KP LIBERATION] [%1] [POST] [INIT] Module initializing...", diag_tickTime];

    // Load preset files
    [] call KPLIB_fnc_init_loadPresets;

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

    // Apply Time Multiplier
    [] call KPLIB_fnc_init_timeMultiApply;

    diag_log format ["[KP LIBERATION] [%1] [POST] [INIT] Module initialized", diag_tickTime];
};

// Called in the scheduled postInit environment allows the small waits in the function
[] call KPLIB_fnc_init_receiveInit;

true
