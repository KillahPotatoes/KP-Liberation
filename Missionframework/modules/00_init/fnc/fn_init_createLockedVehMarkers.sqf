/*
    KPLIB_fnc_init_createLockedVehMarkers

    File: fn_init_createLockedVehMarkers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-08
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates the locked vehicle markers accordingly to the vehicle <> base links.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Shortcut to CfgVehicles.
private _cfg = configFile >> "CfgVehicles";

// Circle through all locked vehicle connections.
{
    // Classname of the locked vehicle.
    private _vehicle = _x select 0;
    // Marker of the sector to which the vehicle is connected.
    private _base = _x select 1;

    // Create marker above the sector marker.
    private _marker = createMarker ["lockedVehicle_" + _base, [markerPos _base select 0, (markerPos _base select 1) + 125]];
    _marker setMarkerText (getText (_cfg >> _vehicle >> "displayName"));
    _marker setMarkerShape "ICON";
    _marker setMarkerType "mil_pickup";
    _marker setMarkerColor KPLIB_preset_colorE;

    // Storing of the created locked vehicle marker with relation to the base marker.
    KPLIB_sectors_lockedVehMarkers pushBack [_marker, _base];
} forEach KPLIB_sectors_lockedVeh;

publicVariable "KPLIB_sectors_lockedVehMarkers";

true
