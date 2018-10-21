/*
    KPLIB_fnc_garrison_spawnSectorVehicle

    File: fn_garrison_spawnSectorVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-21
    Last Update: 2018-10-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns a vehicle with full crew of given side at given sector.

    Parameter(s):
        _sector         - Markername of the sector          [STRING, defaults to ""]
        _vehicle        - Classname of the vehicle to spawn [STRING, defaults to ""]
        _side           - Side of the vehicle               [SIDE, defaults to KPLIB_preset_sideEnemy]

    Returns:
        Spawned vehicle [OBJECT]
*/

params [
    ["_sector", "", [""]],
    ["_vehicle", "", [""]],
    ["_side", KPLIB_preset_sideEnemy, [sideEmpty]]
];

// Exit if no or invalid sector or classname was given
if (_sector == "") exitWith {objNull};
if (_vehicle == "") exitWith {objNull};
if !(_sector in KPLIB_sectors_all) exitWith {objNull};

// Initialize local variables
private _vehicleArray = [];
private _spawnPos = ((getMarkerPos _sector) getPos [50 + (random 250), random 360]) findEmptyPosition [0, 100, "B_T_VTOL_01_armed_F"];

/* NOTE
    This works totally fine and also adds e.g. a CSAT vehicle classname as Blufor side, if ordered.
    The "problem" is, that it has the normal config crew, so it's manned by CSAT soldiers which belong to Blufor side.
    Maybe we have to replace it with an own function, especially as some AAF vehicles (resistance side) are also in the blufor preset.
*/
// Spawn vehicle
_vehicleArray = [_spawnPos, random 360, _vehicle, _side] call BIS_fnc_spawnvehicle;

// FOR DEBUG: Add group to Zeus
{
    _x addCuratorEditableObjects [[(_vehicleArray select 0)] + (_vehicleArray select 1), true]
} forEach allCurators;

/* NOTE
    Adding a patrol waypoint pattern to the vehicle let it move like the infantry squads, which is the same like in the old framework.
    Unfortunately this leads to the behaviour that they can get stuck and drive over their homies with no regrets.
    So we could let them spawn standing still and just "scan the area" or we keep it like in the old framework and let them drive around.
    Personally I think both options aren't the best in their current implementation, but I would prefer them to just stand.
*/
// Add patrol waypoints
// [(_vehicleArray select 0), (getMarkerPos _sector), 250, 4, "MOVE", "SAFE", "YELLOW", "LIMITED"] call CBA_fnc_taskPatrol;

_vehicleArray select 0
