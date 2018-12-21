/*
    KPLIB_fnc_garrison_spawnSectorVehicle

    File: fn_garrison_spawnSectorVehicle.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-21
    Last Update: 2018-12-19
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns a vehicle with full crew of given side at given sector.

    Parameter(s):
        _sector     - Markername of the sector          [STRING, defaults to ""]
        _classname  - Classname of the vehicle to spawn [STRING, defaults to ""]
        _side       - Side of the vehicle               [SIDE, defaults to KPLIB_preset_sideE]
        _kind       - Kind of the vehicle (light/heavy) [STRING, defaults to "light"]

    Returns:
        Spawned vehicle [OBJECT]
*/

params [
    ["_sector", "", [""]],
    ["_classname", "", [""]],
    ["_side", KPLIB_preset_sideE, [sideEmpty]],
    ["_kind", "light", [""]]
];

// Exit if no or invalid sector or classname was given
if (_sector isEqualTo "" || _classname isEqualTo "" || !(_sector in KPLIB_sectors_all)) exitWith {objNull};

// Initialize local variables
private _sectorPos = getMarkerPos _sector;
private _spawnPos = [_sectorPos] call KPLIB_fnc_garrison_getVehSpawnPos;
private _activeGarrisonRef = [_sector, true] call KPLIB_fnc_garrison_getGarrison;

/* NOTE
    This works totally fine and also adds e.g. a CSAT vehicle classname as Blufor side, if ordered.
    The "problem" is, that it has the normal config crew, so it's manned by CSAT soldiers which belong to Blufor side.
    Maybe we have to replace it with an own function, especially as some AAF vehicles (resistance side) are also in the blufor preset.
*/
// Spawn vehicle
private _vehicle = [_classname, _spawnPos, random 360, true, true] call KPLIB_fnc_common_createVehicle;
_vehicle setDamage 0;
private _crew = crew _vehicle;

// FOR DEBUG: Add group to Zeus
{
    _x addCuratorEditableObjects [[_vehicle], true]
} forEach allCurators;

/* NOTE
    Adding a patrol waypoint pattern to the vehicle let it move like the infantry squads, which is the same like in the old framework.
    Unfortunately this leads to the behaviour that they can get stuck and drive over their homies with no regrets.
    So we could let them spawn standing still and just "scan the area" or we keep it like in the old framework and let them drive around.
    Personally I think both options aren't the best in their current implementation, but I would prefer them to just stand.
*/
// Add patrol waypoints with a chance of 15%. Otherwise create a waypoint at spawn position.
if (random 1 <= 0.15) then {
    [_vehicle, _sectorPos, 250, 4, "SAD", "SAFE", "RED", "LIMITED"] call CBA_fnc_taskPatrol;
} else {
    private _waypoint = (group (_crew select 0)) addWaypoint [_spawnPos, 1];
    _waypoint setWaypointType "MOVE";
    _waypoint setWaypointBehaviour "SAFE";
    _waypoint setWaypointCombatMode "RED";
    _waypoint setWaypointSpeed "LIMITED";
    _waypoint setWaypointCompletionRadius 30;
};

// Add vehicle and crew to active garrison array
if (_kind == "light") then {
    (_activeGarrisonRef select 3) pushBack _vehicle;
} else {
    (_activeGarrisonRef select 4) pushBack _vehicle;
};

(_activeGarrisonRef select 5) append _crew;

// Return vehicle object
_vehicle
