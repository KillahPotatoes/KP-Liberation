/*
    KPLIB_fnc_core_buildFobRandom

    File: fn_core_buildFobRandom.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-11
    Last Update: 2018-12-16
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Functionality to place the FOB box at a random spawn point and trigger the FOB buildings placement to establish a random FOB at start.

    Parameter(s):
        _box - FOB box which provided the action [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_box", objNull, [objNull]]
];

// Exit if provided box isn't a FOB box
if !((typeOf _box) isEqualTo KPLIB_preset_fobBoxF) exitWith {false};

// Get a valid spawn marker for the FOB
private _spawnMarker = [KPLIB_sectors_spawn, 500] call KPLIB_fnc_common_getRandomSpawnMarker;

if (_spawnMarker isEqualTo "") exitWith {
    hint localize "STR_KPLIB_HINT_RANDOMFOBERROR";
    [{hintSilent "";}, [], 5] call CBA_fnc_waitAndExecute;
    false
};

private _spawnPos = markerPos _spawnMarker;

// Disable damage handling and simulation
_box allowDamage false;
_box enableSimulationGlobal false;

// Set the vehicle to the position where it should be
_box setPosATL [_spawnPos select 0, _spawnPos select 1, 0.25];

// Activate the simulation again
_box enableSimulationGlobal true;
_box setDamage 0;
_box allowDamage true;

["KPLIB_fob_build_requested", [_box, _spawnPos]] call CBA_fnc_localEvent;

true
