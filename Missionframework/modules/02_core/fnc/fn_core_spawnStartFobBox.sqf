/*
    KPLIB_fnc_core_spawnStartFobBox

    File: fn_core_spawnStartFobBox.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-09
    Last Update: 2018-12-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawning of the initial FOB box.

    Parameter(s):
        _boxWreck - Wreck of previous FOB box. Will be deleted [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/
params [
    ["_boxWreck", objNull, [objNull]]
];

if (!isServer || count KPLIB_sectors_fobs > 0) exitWith {};

// If FOB box wreck is too close to respawn we should delete it.
if((_boxWreck distance2D KPLIB_eden_boxspawn) < 10 && !alive _boxWreck) exitWith {
    deleteVehicle _boxWreck;
    // Spawn FOB box after wreck was deleted
    [{[] call KPLIB_fnc_core_spawnStartFobBox}, [], 1] call CBA_fnc_waitAndExecute;
};

// Position for the spawn.
private _spawnPos = getPosATL KPLIB_eden_boxspawn;

// Create FOB box at the spawn position with a slight height offset.
private _fobBox = [KPLIB_preset_fobBoxF, [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.1], getDir KPLIB_eden_boxspawn, true] call KPLIB_fnc_common_createVehicle;

// Add random FOB placement action for start FOB box
[
    _fobBox,
    "STR_KPLIB_ACTION_DEPLOYRANDOM",
    [{[_this select 0] call KPLIB_fnc_core_buildFobRandom;}, true, -800, false, true, "", "(_target distance KPLIB_eden_boxspawn) < 3 && KPLIB_sectors_fobs isEqualTo []", 4],
    "#FF0000"
] remoteExecCall ["KPLIB_fnc_common_addAction", 0, true];

// Add event handler to call this script again if box was destroyed.
_fobBox addMPEventHandler ["MPKilled", {[_this select 0] call KPLIB_fnc_core_spawnStartFobBox}];

true
