/*
    KPLIB_fnc_garrison_reInitSectors

    File: fn_garrison_reInitSectors.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-27
    Last Update: 2018-12-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Reinitializes all affected sectors, when preset was changed during the campaign.

    Parameter(s):
        _preset - Variable name of the changed preset [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_preset", "", [""]]
];

// Only execute on server and with valid parameter
if (!isServer || (_preset isEqualTo "")) exitWith {};

diag_log format ["[KP LIBERATION] [%1] [GARRISON] ----- Reinitialization of sector garrisons started -----", diag_tickTime];

// Fetch all not active sectors
private _sectors = KPLIB_sectors_all - KPLIB_sectors_active;

// Select only enemy or friendly sectors
private _friendly = true;
if (_preset isEqualTo "KPLIB_param_presetF") then {
    _sectors = _sectors arrayIntersect KPLIB_sectors_blufor;
} else {
    _sectors = _sectors - KPLIB_sectors_blufor;
    _friendly = false;
};

// Get the correct classname arrays (copy for heavy vehicles to safely append the second array)
private _lVehicles = missionNamespace getVariable ["KPLIB_preset_vehLightArmedPl" + (["E", "F"] select _friendly), []];
private _hVehicles = +(missionNamespace getVariable ["KPLIB_preset_vehHeavyApcPl" + (["E", "F"] select _friendly), []]);
_hVehicles append (missionNamespace getVariable ["KPLIB_preset_vehHeavyPl" + (["E", "F"] select _friendly), []]);

// Reinitialize vehicle classnames in sector garrisons
private _lVehCount = 0;
private _hVehCount = 0;
{
    if ((_x select 0) in _sectors) then {
        // Get amount of light vehicles and erase current entries
        _lVehCount = count (_x select 3);
        _x set [3, []];

        // Add light vehicles
        for "_i" from 1 to _lVehCount do {
            (_x select 3) pushBack (selectRandom _lVehicles);
        };

        // Get amount of heavy vehicles and erase current entries
        _hVehCount = count (_x select 4);
        _x set [4, []];

        // Add heavy vehicles
        for "_i" from 1 to _hVehCount do {
            (_x select 4) pushBack (selectRandom _hVehicles);
        };

        diag_log format ["[KP LIBERATION] [GARRISON] %1 (%2) reinitialized", markerText (_x select 0), _x select 0];
    };
} forEach KPLIB_garrison_array;

diag_log format ["[KP LIBERATION] [%1] [GARRISON] ----- Reinitialization of sector garrisons finished -----", diag_tickTime];

true
