/*
    KPLIB_fnc_core_buildFob

    File: fn_core_buildFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-11
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Builds FOB on given position.

    Parameter(s):
        _position       - Object or position where FOB has to be built                      [OBJECT/ARRAY, defaults to []]
        _player         - Player that initiated building. Mandatory for interactive build   [OBJECT, defaults to objNull]
        _interactive    - Should FOB be built interactively for player                      [BOOL, defaults to false]

    Returns:
        Spawned vehicle [OBJECT]
*/

params [
    ["_position", [], [[], objNull]],
    ["_player", objNull, [objNull]],
    ["_interactive", false, [false]]
];

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
    ["KPLIB_fob_built", [_marker]] call CBA_fnc_localEvent;
} else {
    private _marker = [_buildPos] call KPLIB_fnc_core_createFobMarker;
    KPLIB_sectors_fobs pushBack _marker;
    ["KPLIB_fob_built", [_marker]] call CBA_fnc_localEvent;
};

publicVariable "KPLIB_sectors_fobs";
call KPLIB_fnc_core_updateFobMarkers;
