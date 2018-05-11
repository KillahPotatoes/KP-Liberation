/*
    KPLIB_fnc_core_spawnFobVehicle

    File: fn_core_spawnFobVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-11
    Last Update: 2018-05-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Spawns vehicle and attaches FOB deploy action to it. It uses KPLIB_fnc_core_spawnVehicle internally.

    Parameter(s):
        0: STRING - Classname of the vehicle which should be spawned.
        1: POSITION - Position ATL where the vehicle should be spawned.
        2: NUMBER - OPTIONAL - Heading for the vehicle from 0 to 360. (Default: random direction)

    Returns:
    OBJECT - Spawned vehicle
*/

params ["_classname", "_spawnPos", ["_spawnDir", random 360]];

private _vehicle = [_classname, _spawnPos, _spawnDir, true] call KPLIB_fnc_core_spawnVehicle;

// Add action for every player and queue for JIP
[
    _vehicle,
    [localize "STR_FOB_DEPLOY", {[param [0], param [1], param[3]] call KPLIB_fnc_core_buildFob}, true, -1000, false, false, "", "[_target, _this] call KPLIB_fnc_core_canBuildFob", 10]
] remoteExecCall ["addAction", 0, true];

_vehicle
