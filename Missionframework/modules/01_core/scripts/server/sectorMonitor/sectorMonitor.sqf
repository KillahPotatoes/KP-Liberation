/*
    KP Liberation sector monitoring script

    File: sectorMonitor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-05
    Last Update: 2018-05-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles activation and deactivation of sectors. Provides managing of the active sectors array for further use in other modules/events.
*/

while {KPLIB_campaignRunning} do {
    // Only check for possible sector activation, if the cap isn't already reached.
    if (count KPLIB_sectors_active < KPLIB_cap_sector) then {
        {
            private _currentSectorPos = getMarkerPos _x;
            private _nearUnits = _currentSectorPos nearEntities ["AllVehicles", KPLIB_range_sector];
            private _nearUnitsCount = {side _x isEqualTo KPLIB_preset_sidePlayers} count _nearUnits;

            // If there are units inside the activation radius, start the sector handle script.
            if (_nearUnitsCount > 0) then {
                KPLIB_sectors_active pushBack _x;
                // [_x] spawn KPLIB_fnc_core_handleSector;
            };
        } forEach (KPLIB_sectors_all - KPLIB_sectors_blufor - KPLIB_sectors_active);
    };
    uiSleep 5;
};
