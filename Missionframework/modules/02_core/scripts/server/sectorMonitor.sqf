/*
    KP Liberation sector monitoring script

    File: sectorMonitor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-05
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Handles activation of sectors and spawning of the sector handle script, if blufor units are near a sector.
*/
scriptName "KPLIB_sectorMonitor";

if(isServer) then {

    // Update sector markers every time sector state was changed
    {[_x, {call KPLIB_fnc_core_updateSectorMarkers}] call CBA_fnc_addEventHandler;} forEach ["KPLIB_sector_activated", "KPLIB_sector_deactivated"];

    // Init function, executed every time whole list of sectors was iterated
    private _initFunction = {
        // Get inactive sectors
        _sectors = (KPLIB_sectors_all - KPLIB_sectors_blufor - KPLIB_sectors_active);
    };

    // Create PFH Object for sectors activation check
    [
        {
            // If we checked whole list, reinitialize the list
            if (_sectors isEqualTo []) then {
                [] call (_this getVariable "start");
            };

            // Extract current sector from array
            private _currentSector = _sectors deleteAt (floor random count _sectors);

            // Check if sector should be activated
            if([getMarkerPos _currentSector, KPLIB_param_sectorActRange] call KPLIB_fnc_core_areUnitsNear) then {
                [_currentSector] call KPLIB_fnc_core_handleSector;
            };
        },      // Handler
        0,      // Delay
        [],     // Args
        _initFunction,      // Start func
        {},     // End func
        {KPLIB_campaignRunning && (count KPLIB_sectors_active < KPLIB_param_sectorCapRange)}, // Run condition
        {},     // End condition
        ["_sectors"]      // Privates to serialize between calls
    ] call CBA_fnc_createPerFrameHandlerObject;

};
