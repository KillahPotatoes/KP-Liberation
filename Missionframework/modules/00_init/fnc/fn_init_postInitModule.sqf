/*
    KPLIB_fnc_init_postInitModule

    File: fn_init_postInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Tasks of this module are:
        * Sort sector markers to specific arrays
        * Initialize the save manager
        * Connect unlockable vehicles to military sectors
        * Load and save very basic data like date, sector ownership, FOB positions and unlockable vehicle sector links
        * Manage sector color changing
        * Manage FOB markers

    Dependencies:
    NONE

    Returns:
    BOOL
*/

if (isServer) then {
    diag_log format ["[KP LIBERATION] [%1] [POST] [INIT] Module initializing...", diag_tickTime];

    // Load preset files
    [] call KPLIB_fnc_init_loadPresets;

    // Load arsenal
    [] call KPLIB_fnc_init_fillArsenal;

    // Sort the sector markers to category arrays
    [] call KPLIB_fnc_init_sortSectors;

    // Load current save
    [] call KPLIB_fnc_init_load;

    // Add saveTimer per frame handler
    [{
        params ["_args", "_handle"];

        if (KPLIB_save_loaded) then {
            if (KPLIB_campaignRunning) then {
                [] call KPLIB_fnc_init_save;
            } else {
                _handle call CBA_fnc_removePerFrameHandler;
                diag_log "[KP LIBERATION] [IMPORTANT] Save timer deactivated due to KPLIB_campaignRunning false.";
            };
        };
    }, KPLIB_save_interval] call CBA_fnc_addPerFrameHandler;

    // Create locked vehicle markers
    [] call KPLIB_fnc_init_createLockedVehMarkers;

    diag_log format ["[KP LIBERATION] [%1] [POST] [INIT] Module initialized", diag_tickTime];
};

[] call KPLIB_fnc_init_receiveInit;

true
