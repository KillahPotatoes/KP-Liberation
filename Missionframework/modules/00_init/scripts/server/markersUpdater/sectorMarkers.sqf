/*
    KP Liberation sector marker managing script

    File: sectorMarkers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-27
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This script will take care to apply general sector marker colors and create locked vehicle markers.
*/

waitUntil {KPLIB_save_loaded};

// Array to store sector and locked vehicle markers.
private _lockedVehMarkers = [];
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
    _marker setMarkerColor KPLIB_preset_colorEnemy;

    // Storing of the created locked vehicle marker with relation to the base marker.
    _lockedVehMarkers pushBack [_marker, _base];
} forEach KPLIB_sectors_lockedVeh;

// Storage for the last blufor sector count.
private _sectorCount = -1;

// Loop to adjust marker colors during the game.
while {KPLIB_campaignRunning} do {

    // Only continue if blufor lost or captured a sector.
    waitUntil {uiSleep 2; (count KPLIB_sectors_blufor) != _sectorCount};

    // Color change for the main sector markers.
    {_x setMarkerColor KPLIB_preset_colorEnemy;} forEach (KPLIB_sectors_all - KPLIB_sectors_blufor);
    {_x setMarkerColor KPLIB_preset_colorPlayers;} forEach KPLIB_sectors_blufor;

    // Color change for the locked vehicle markers.
    {
        if ((_x select 1) in KPLIB_sectors_blufor) then {
            (_x select 0) setMarkerColor KPLIB_preset_colorPlayers;
        } else {
            (_x select 0) setMarkerColor KPLIB_preset_colorEnemy;
        }
    } forEach _lockedVehMarkers;

    // Update blufor sector count storage.
    _sectorCount = count KPLIB_sectors_blufor;
};
