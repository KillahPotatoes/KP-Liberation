/*
    KPLIB_fnc_civilian_spawnCiv

    File: fn_civilian_spawnCiv.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-09-04
    Last Update: 2019-09-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Handles spawning of a individual civilian on foot.

    Parameter(s):
        _sector - Markername of the sector [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/


params [
    ["_sector", "", [""]]
];

if (isServer) then {[format ["Despawn for %1", _sector], "CIVILIAN", true] call KPLIB_fnc_common_log;};

// Initialize local variables

// Spawn Civ

// Return
true
