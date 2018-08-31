/*
    KPLIB_fnc_init_postInitModule

    File: fn_init_postInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-08-31
    Last Update: 2018-08-31
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

if (!isServer) exitWith {};

diag_log format ["[KP LIBERATION] [%1] [POSTINIT] Module initializing...", diag_tickTime];


// Read the module globals
call compile preprocessFileLineNumbers "modules\00_init\globals.sqf";

// Load preset files
call KPLIB_fnc_init_loadPresets;

// Load arsenal
call KPLIB_fnc_init_fillArsenal;

// Sort the sector markers to category arrays
call KPLIB_fnc_init_sortSectors;

// Load current save and start the timer for triggering the saving process
call KPLIB_fnc_init_load;
execVM "modules\00_init\scripts\server\saveTimer\timer.sqf";

// Create locked vehicle markers
call KPLIB_fnc_init_createLockedVehMarkers;

diag_log format ["[KP LIBERATION] [%1] [POSTINIT] Module initialized", diag_tickTime];

true
