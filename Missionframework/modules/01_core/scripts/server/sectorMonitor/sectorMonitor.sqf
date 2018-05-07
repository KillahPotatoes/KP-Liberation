/*
    KP Liberation sector monitoring script

    File: sectorMonitor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-05
    Last Update: 2018-05-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles activation of sectors and spawning of the sector handle script, if blufor units are near a sector.
*/

while {KPLIB_campaignRunning} do {
    // Only check for possible sector activation, if the cap isn't already reached. (The cap can be intended exceeded during one loop circle)
    if (count KPLIB_sectors_active < KPLIB_cap_sector) then {
        {
            // Position of current sector.
            private _currentSectorPos = getMarkerPos _x;

            // If there are units inside the activation radius, start the sector handle script.
            if ([_currentSectorPos, KPLIB_range_sector] call KPLIB_fnc_core_areUnitsNear) then {
                // NOTE: Later we could check here for the HC load and distribute the sector handling to a HC, if running.
                KPLIB_sectors_active pushBack _x;
                [_x] spawn KPLIB_fnc_core_handleSector;
            };
        } forEach (KPLIB_sectors_all - KPLIB_sectors_blufor - KPLIB_sectors_active);
    } else {
        diag_log format ["[KP LIBERATION] [SECTOR CAP] Cap for active sectors reached. %1 sectors currently active.", count KPLIB_sectors_active];
        // Wait here to avoid rpt spamming of the above message.
        waitUntil {uiSleep 5; count KPLIB_sectors_active < KPLIB_cap_sector};
    };
    uiSleep 5;
};
