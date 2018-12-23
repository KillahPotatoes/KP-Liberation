/*
    KPLIB_fnc_core_updateSectorMarkers

    File: fn_core_updateSectorMarkers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-27
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Updates general sector marker colors and create locked vehicle markers.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Color change for the main sector markers.
{_x setMarkerColor KPLIB_preset_colorE;} forEach (KPLIB_sectors_all - KPLIB_sectors_blufor - KPLIB_sectors_active);
{_x setMarkerColor KPLIB_preset_colorActE;} forEach KPLIB_sectors_active;
{_x setMarkerColor KPLIB_preset_colorF;} forEach KPLIB_sectors_blufor;

// Color change for the locked vehicle markers.
{
    if ((_x select 1) in KPLIB_sectors_blufor) then {
        (_x select 0) setMarkerColor KPLIB_preset_colorF;
    } else {
        if ((_x select 1) in KPLIB_sectors_active) then {
            (_x select 0) setMarkerColor KPLIB_preset_colorActE;
        } else {
            (_x select 0) setMarkerColor KPLIB_preset_colorE;
        };
    };
} forEach KPLIB_sectors_lockedVehMarkers;

true
