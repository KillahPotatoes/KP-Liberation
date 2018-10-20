/*
    KPLIB_fnc_core_handleSector

    File: fn_core_handleSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-06
    Last Update: 2018-10-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles an activated sector concerning which scripts should be started and checks for a later deactivation.

    Parameter(s):
        0: STRING - Name of the sectormarker.

    Returns:
    NOTHING
*/

params [["_sectorMarkerName", nil, [""]]];

// Create sector handler PFH Object
private _handler = [
    {
        // Per Tick
        _this getVariable "params" params ["_sector", "_sectorPos"];

        // If there are no enemy units in two times the capture range and friendly units are in capture range
        // capture the sector
        if (
            !([_sectorPos, 2 * KPLIB_range_capture, [KPLIB_preset_sideEnemy]] call KPLIB_fnc_core_areUnitsNear)
            && {[_sectorPos, KPLIB_range_capture] call KPLIB_fnc_core_areUnitsNear}
        ) then {
            diag_log format ["[KP LIBERATION] [%1] [CORE] Sector %2 was captured", diag_tickTime, _sector];

            _this setVariable ["KPLIB_sectorActive", false];
            [_sector] call KPLIB_fnc_core_changeSectorOwner;
            ["KPLIB_sector_captured", [_sector]] call CBA_fnc_globalEvent;
        }
        else {
            // If there are no friendly units in activation range, deactivate the sector
            if !([_sectorPos, KPLIB_range_sector] call KPLIB_fnc_core_areUnitsNear) then {
                _this setVariable ["KPLIB_sectorActive", false];
            }
        }
    }, // Handler
    (15 + random 5), // Delay
    [_sectorMarkerName, getMarkerPos _sectorMarkerName], // Args
    {
        _this getVariable "params" params ["_sector"];

        _this setVariable ["KPLIB_sectorActive", true];

        KPLIB_sectors_active pushBack _sector;
        publicVariable "KPLIB_sectors_active";
        ["KPLIB_sector_activated", [_sector]] call CBA_fnc_globalEvent;

        diag_log format ["[KP LIBERATION] [%1] [CORE] Sector %2 was activated", diag_tickTime, _sector];

    }, // Start func
    {
        _this getVariable "params" params ["_sector"];

        KPLIB_sectors_active = KPLIB_sectors_active - [_sector];
        publicVariable "KPLIB_sectors_active";
        ["KPLIB_sector_deactivated", [_sector]] call CBA_fnc_globalEvent;

        diag_log format ["[KP LIBERATION] [%1] [CORE] Sector %2 was deactivated", diag_tickTime, _sector];
    }, // End func
    {true}, // Run condition
    {!(_this getVariable ["KPLIB_sectorActive", true])} // End condition
] call CBA_fnc_createPerFrameHandlerObject;
