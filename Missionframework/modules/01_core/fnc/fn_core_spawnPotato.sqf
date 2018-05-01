/*
    KPLIB_fnc_core_spawnPotato

    File: fn_core_spawnPotato.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-05-01
    Last Update: 2018-05-01
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
    KPLIB_core_potato01 = createVehicle [KPLIB_preset_potato, [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.1], [], 0, "NONE"];

    // Disable damage handling and simulation.
    KPLIB_core_potato01 allowDamage false;
    KPLIB_core_potato01 enableSimulationGlobal false;

    // Repositioning of Potato 01 to make sure it'll be where it should be.
    KPLIB_core_potato01 setDir (getDir KPLIB_eden_potatospawn);
    KPLIB_core_potato01 setPosATL [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2) + 0.1];

    // Clear all cargo.
    clearWeaponCargoGlobal KPLIB_core_potato01;
    clearMagazineCargoGlobal KPLIB_core_potato01;
    clearItemCargoGlobal KPLIB_core_potato01;
    clearBackpackCargoGlobal KPLIB_core_potato01;

    // Declare as ace medical vehicle (can also be set if ACE is not used)
    KPLIB_core_potato01 setVariable ["ace_medical_medicClass", 1, true];

    // Add event handler to call this script again if we have a "Potato down".
    // NOTE: Has to be tested in the testing phase, if this may cause all players to execute a spawning of a new Potato 01 in a dedicated server environment.
    // NOTE: If it's the case, a simple "if (isServer)" should be fine to ensure it'll only spawn one Potato 01 from the server (dedicated or player hosted).
    KPLIB_core_potato01 addMPEventHandler ["MPKilled", {[] spawn KPLIB_fnc_core_spawnPotato;}];

    // Small delay to prevent issues with activated damage handling and activate the simulation again.
    sleep 0.2;
    KPLIB_core_potato01 enableSimulationGlobal true;
    KPLIB_core_potato01 setDamage 0;
    KPLIB_core_potato01 allowDamage true;
};

true
