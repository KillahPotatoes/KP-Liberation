/*
    KPLIB_fnc_common_createCrew

    File: fn_common_createCrew.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-25
    Last Update: 2018-12-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Spawns a full crew for given vehicle. Currently only implemented for empty vehicles.

    Parameter(s):
        _vehicle    - Vehicle object which should get a crew    [OBJECT, defaults to objNull]
        _side       - Side of the crew                          [SIDE, defaults to KPLIB_preset_sideE]

    Returns:
        Created crew [GROUP]
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_side", KPLIB_preset_sideE, [sideEmpty]]
];

// Exit when no or destroyed vehicle was given
if ((_vehicle isEqualTo objNull) || !(alive _vehicle)) exitWith {grpNull};

// Determine classname side
private _crewSide = switch (_side) do {
    case KPLIB_preset_sideF: {"F"};
    case KPLIB_preset_sideR: {"R"};
    case KPLIB_preset_sideC: {"C"};
    default {"E"};
};

// Determine classname type for air vehicles
private _crewType = switch (true) do {
    case (_vehicle isKindOf "Plane"): {"rsPilotJet"};
    case (_vehicle isKindOf "Helicopter"): {"rsPilotHeli"};
    default {"rsCrewmanVeh"};
};

// Get correct classname or exit, when no classname could be found
private _crewClass = missionNamespace getVariable ["KPLIB_preset_" + _crewType + _crewSide, ""];
if ((_crewClass isEqualTo "") || (_crewClass isEqualTo [])) exitWith {grpNull};

// Get all turret paths of the vehicle
private _turrets = [[-1]] + (allTurrets _vehicle);

// Fill array for group spawning
private _classnames = [];
for "_i" from 1 to (count _turrets) do {
    if (_crewClass isEqualType []) then {
        _classnames pushBack (selectRandom _crewClass);
    } else {
        _classnames pushBack _crewClass;
    };
};

// Spawn group and move into to vehicle
private _grp = [_side, _classnames, getPos _vehicle] call KPLIB_fnc_common_createGroup;
{
    if (_forEachIndex isEqualTo 0) then {
        ((units _grp) select _forEachIndex) moveInDriver _vehicle;
    } else {
        ((units _grp) select _forEachIndex) moveInTurret [_vehicle, _x];
    }
} forEach _turrets;

// Assign vehicle to group and make sure the commander is group leader
_grp addVehicle _vehicle;
_grp selectLeader (commander _vehicle);

// Return created crew
_grp
