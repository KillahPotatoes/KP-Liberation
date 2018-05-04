/*
    KPLIB_fnc_core_spawnPotato

    File: fn_core_spawnPotato.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-05-01
    Last Update: 2018-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Spawning of the Potato 01 helicopter.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Check if there wasn't a Potato 01 already spawned or if the spawned one is destroyed.
// NOTE: As the loading will happen before this function is called, it won't interfere with a loaded Potato 01.
if (isNull KPLIB_core_potato01 || !(alive KPLIB_core_potato01)) then {
    // Position for the spawn.
    private _spawnPos = getPosATL KPLIB_eden_potatospawn;

    // Create Potato 01 at the spawn position with a slight height offset.
    KPLIB_core_potato01 = [KPLIB_preset_potato, [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.1], getDir KPLIB_eden_potatospawn, true] call KPLIB_fnc_core_spawnVehicle;

    // Declare as ace medical vehicle (can also be set if ACE is not used)
    KPLIB_core_potato01 setVariable ["ace_medical_medicClass", 1, true];

    // Add event handler to call this script again if we have a "Potato down". Will run only on the server.
    KPLIB_core_potato01 addMPEventHandler ["MPKilled", {if (isServer) then {[] call KPLIB_fnc_core_spawnPotato;};}];
};

true
