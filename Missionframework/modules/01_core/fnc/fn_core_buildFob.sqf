/*
    KPLIB_fnc_core_buildFob

    File: fn_core_buildFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-11
    Last Update: 2018-05-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Builds FOB on given position.

    Parameter(s):
        0: OBJECT|ARRAY - Object or position where FOB has to be built.
        1: OBJECT - OPTIONAL - Player that initiated building. Mandatory for interactive build. (Default: objNull)
        2: BOOL - OPTIONAL - Should FOB be built interactively for player. (Default: false)

    Returns:
    OBJECT - Spawned vehicle
*/

params ["_position", ["_player", objNull], ["_interactive", false]];

// Get position of build area
private _buildPos = _position;
// If our position is an object we will save it for later deletion
private _box = objNull;

// If position is object, get position of object
if(typeName _buildPos == typeName objNull) then {
    _box = _buildPos;
    _buildPos = getPosATL _box;
};

// Build FOB
if (_interactive) then {
    // TODO we should allow for manual placement of FOB building in interative mode here later
    deleteVehicle _box;
    private _marker = [_buildPos] call KPLIB_fnc_core_createFobMarker;
    KPLIB_sectors_fobs pushBack _marker;
} else {
    private _marker = [_buildPos] call KPLIB_fnc_core_createFobMarker;
    KPLIB_sectors_fobs pushBack _marker;
};

publicVariable "KPLIB_sectors_fobs";
