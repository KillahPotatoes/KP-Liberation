/*
    KPLIB_fnc_core_handleSector

    File: fn_core_handleSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-06
    Last Update: 2018-05-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles an activated sector concerning which scripts should be started and checks for a later deactivation.

    Parameter(s):
        0: STRING - Name of the sectormarker.

    Returns:
    NOTHING
*/

params ["_sectorMarkerName"];

// Position of the sector.
private _sectorPos = getMarkerPos _sectorMarkerName;
// Leave loop variable.
private _sectorActive = true;
// Sector ready to be captured variable.
private _sectorCaptureReady = false;
// Deactivation timer. Set with the substraction to directly deactivate a sector if it was activated through a "fly by".
private _sectorTimer = diag_tickTime - KPLIB_sectors_stayActiveTime;

/**
 * TODO:
 * At this place we should add the spawning and other "upon sector activation" stuff when we reached that development stage.
 */
// Emit event about activated sector
["sector_activated", [_sectorMarkerName]] call KPLIB_fnc_event_trigger;

// Loop until the sector is abandoned.
while {_sectorActive} do {
    uiSleep 15;

    if ([_sectorPos, KPLIB_range_sector] call KPLIB_fnc_core_areUnitsNear) then {
        // Reset deactivation timer.
        _sectorTimer = diag_tickTime;

        /**
         * NOTE:
         * Maybe we could move the spawning etc. in here with a "_sectorSpawned" variable to do the spawning after the "fly by" catching.
         * But it could lead to a "Enemies spawn too late", but with a "spawn for 15 seconds" it could be more dangerous for air vehicles
         * to travel through enemy airspace. Guess this is something we have to look into when it comes to the enemy module and performance questions.
         */

        // Check if blufor captured the sector and call ownership change
        if ([_sectorPos, KPLIB_range_capture] call KPLIB_fnc_core_areUnitsNear && !([_sectorPos, 2 * KPLIB_range_capture, [KPLIB_preset_sideEnemy]] call KPLIB_fnc_core_areUnitsNear)) then {
            // Ensure that there are really no enemies nearby, by insert one loop cycle as wait time.
            if (_sectorCaptureReady) then {
                _sectorActive = false;
                [_sectorMarkerName] call KPLIB_fnc_core_changeSectorOwner;
                ["sector_captured", [_sectorMarkerName]] call KPLIB_fnc_event_trigger;
            } else {
                _sectorCaptureReady = true;
            };
        } else {
            _sectorCaptureReady = false;
        };
    } else {
        if (diag_tickTime > (_sectorTimer + KPLIB_sectors_stayActiveTime)) then {
            _sectorActive = false;
        };
    };
};

// Remove sector from active sectors array.
KPLIB_sectors_active = KPLIB_sectors_active - [_sectorMarkerName];
publicVariable "KPLIB_sectors_active";

// As the argument for changing a sector color should be global this should be fine. If not, we've to change it to something like
// If isServer then call, else remoteExec on server (concerning sector handling by HCs in the end)
call KPLIB_fnc_core_updateSectorMarkers;
