/*
    KPLIB_fnc_civilian_spawnVeh

    File: fn_civilian_spawnVeh.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-04
    Last Update: 2019-09-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Handles spawning of a individual civilian vehicle empty, or manned.

    Parameter(s):
        _sector - Markername of the sector [STRING, defaults to ""]
		_empty - Should veh be empty [BOOL, defaults to true]

    Returns:
        Function reached the end [BOOL]
*/


params [
    ["_sector", "", [""]],
	["_empty", true, [true]]
];

if (isServer) then {[format ["Despawn for %1", _sector], "CIVILIAN", true] call KPLIB_fnc_common_log;};

// Initialize local variables

// Spawn Veh

// Return
true
