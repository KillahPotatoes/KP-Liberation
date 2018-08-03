/*
    KP LIBERATION MODULE GLOBALS

    File: globals.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-08-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Initializes the global variables which are brought by this module.
*/

// Array of all whitelisted arsenal items
KPLIB_arsenal_whitelist = [];
// Variable for ending the campaign
KPLIB_campaignRunning = true;
// Respawn position shortcut
KPLIB_eden_respawnPos = getMarkerPos "respawn";
// Squad names for the buildable squads
KPLIB_preset_squadNames = [
    localize "STR_SQUAD_LIGHT",
    localize "STR_SQUAD_RIFLE",
    localize "STR_SQUAD_AT",
    localize "STR_SQUAD_AA",
    localize "STR_SQUAD_RECON",
    localize "STR_SQUAD_PARA"
];
// Indicator if the saved data is fully loaded
KPLIB_save_loaded = false;
// Spawnpoints for air vehicles
KPLIB_sectors_airspawn = [];
// All capturable sectors
KPLIB_sectors_all = [];
// All active sectors
KPLIB_sectors_active = [];
// Sectors which are captured by blufor
KPLIB_sectors_blufor = [];
// All city sectors
KPLIB_sectors_city = [];
// All factory sectors
KPLIB_sectors_factory = [];
// Positions of all FOBs
KPLIB_sectors_fobs = [];
// Locked vehicles <-> military bases connection array
KPLIB_sectors_lockedVeh = [];
// Markers for the locked vehicles
KPLIB_sectors_lockedVehMarkers = [];
// All metropolis (capital) sectors
KPLIB_sectors_metropolis = [];
// All military sectors
KPLIB_sectors_military = [];
// Spawnpoints for secondary missions and enemy forces
KPLIB_sectors_spawn = [];
// All radiotowers
KPLIB_sectors_tower = [];
// Reset position shortcut
KPLIB_resetPos = [99999,99999,0];
// Zero position shortcut
KPLIB_zeroPos = [0,0,0];

// Publish some variables to the clients (maybe this should be moved elsewhere later on)
publicVariable "KPLIB_campaignRunning";
publicVariable "KPLIB_eden_respawnPos";
publicVariable "KPLIB_sectors_active";
publicVariable "KPLIB_resetPos";
publicVariable "KPLIB_zeroPos";
