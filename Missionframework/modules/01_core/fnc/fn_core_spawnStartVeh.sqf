/*
    KPLIB_fnc_core_spawnStartVeh

    File: fn_core_spawnStartVeh.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-05-01
    Last Update: 2018-05-03
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Spawning of the start vehicles like the little birds and rubber dinghies.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Go through the available markers for the little bird spawn. Adapts to the amount of placed markers.
for [{_i=0}, {!isNil ("KPLIB_eden_littlebird_" + str _i)}, {_i = _i + 1}] do {
    // Spawn point from mission.sqm
    private _spawnPoint = missionNamespace getVariable ("KPLIB_eden_littlebird_" + str _i);
    // Current position for the spawn.
    private _spawnPos = getPosATL _spawnPoint;

    // Spawn the vehicle at the spawn position with a slight height offset.
    [KPLIB_preset_addHeli, [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.1], getDir _spawnPoint] call KPLIB_fnc_core_spawnVehicle;
};

// Go through the available markers for the rubber dinghy spawn. Adapts to the amount of placed markers.
for [{_i=0}, {!isNil ("KPLIB_eden_boat_" + str _i)}, {_i = _i + 1}] do {
    // Spawn point from mission.sqm
    private _spawnPoint = missionNamespace getVariable ("KPLIB_eden_boat_" + str _i);
    // Current position for the spawn.
    private _spawnPos = getPosATL _spawnPoint;

    // Spawn the vehicle at the spawn position with a slight height offset.
    [KPLIB_preset_addBoat, [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.1], getDir _spawnPoint] call KPLIB_fnc_core_spawnVehicle;
};

true
