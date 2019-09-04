/*
    KPLIB_fnc_civilian_spawn

    File: fn_civilian_spawn.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-20
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Handles the spawning of the sector civilians.

    Parameter(s):
        _sector - Markername of the sector [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_sector", "", [""]]
];

if (isServer) then {[format ["Spawn Civilians for %1", _sector], "CIVILIAN", true] call KPLIB_fnc_common_log;};

// If sector is not a town or metropolis, do nothing.
if !([_sector, "city"] call KPLIB_fnc_common_isSectorType || {[_sector, "metropolis"] call KPLIB_fnc_common_isSectorType} ) exitWith {
	// RETURN
	false;
};

// Initialize local variables
private _sectorPos = getMarkerPos _sector;
private _amount = 20; // staticly set to a higher number for testing
private _civilianArray = [];
private _spawnPos = _sectorPos getPos [random 200, random 360];

// Avoid spawn position on water
while {surfaceIsWater _spawnPos} do {
    _spawnPos = _sectorPos getPos [random 150, random 360];
};

// Set array to select civilian classnames from
_civilianArray = ["units", KPLIB_preset_sideC, true] call KPLIB_fnc_common_getPresetClass;

// Grab some random civilian classnames
for "_i" from 1 to _amount do {
    _classnames pushBack (selectRandom _civilianArray);
};

// return
true
