/*
    KPLIB_fnc_init_sortSectors

    File: fn_init_sortSectors.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-10-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks all map markers and sort them inside the specific sector arrays.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

private _tempMarker = [];

{
    _tempMarker = toArray _x;
    _tempMarker resize 12;

    // Fetch the main mission sectors and  spawnpoints
    switch (toString _tempMarker) do {
        case "KPLIB_eden_a": {KPLIB_sectors_airspawn pushBack _x;};
        case "KPLIB_eden_b": {KPLIB_sectors_military pushBack _x; KPLIB_sectors_all pushBack _x;};
        case "KPLIB_eden_c": {KPLIB_sectors_city pushBack _x; KPLIB_sectors_all pushBack _x;};
        case "KPLIB_eden_f": {KPLIB_sectors_factory pushBack _x; KPLIB_sectors_all pushBack _x;};
        case "KPLIB_eden_m": {KPLIB_sectors_metropolis pushBack _x; KPLIB_sectors_all pushBack _x;};
        case "KPLIB_eden_s": {KPLIB_sectors_spawn pushBack _x;};
        case "KPLIB_eden_t": {KPLIB_sectors_tower pushBack _x; if (isServer) then {_x setMarkerText format ["%1 %2",markerText _x, mapGridPosition (markerPos _x)];}; KPLIB_sectors_all pushBack _x;};
    };
} forEach allMapMarkers;

// Send filled arrays to clients
publicVariable "KPLIB_sectors_airspawn";
publicVariable "KPLIB_sectors_spawn";
publicVariable "KPLIB_sectors_military";
publicVariable "KPLIB_sectors_city";
publicVariable "KPLIB_sectors_metropolis";
publicVariable "KPLIB_sectors_factory";
publicVariable "KPLIB_sectors_tower";
publicVariable "KPLIB_sectors_all";

true
