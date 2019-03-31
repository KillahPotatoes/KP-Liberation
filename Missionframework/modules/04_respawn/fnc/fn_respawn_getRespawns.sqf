/*
    KPLIB_fnc_respawn_getRespawns

    File: fn_respawn_getRespawns.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-09-12
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Get list of currenty available respawns

    Parameter(s):
        NONE

    Returns:
        Array of arrays with available respawns [ARRAY]
*/


private _spawns = [[localize "STR_KPLIB_MAINBASE", KPLIB_eden_startbase]];

// Add the FOBs to the spawn list
{
    _spawns pushBack [
        format ["FOB %1 - %2", (KPLIB_preset_alphabetF select _forEachIndex), mapGridPosition getMarkerPos _x],
        _x
    ];
} forEach KPLIB_sectors_fobs;

// Add mobile respawns to the spawn list if parameter isn't disabled
if (KPLIB_param_mobileRespawn) then {
    {
        private _displayName = getText (configFile >>  "CfgVehicles" >> (typeOf _x) >> "displayName");
        // Add item to list
        _spawns pushBack [
            format ["%1 - %2", _displayName, mapGridPosition getPos _x],
            _x
        ];
    } forEach ([] call KPLIB_fnc_core_getMobSpawns)
};

_spawns
