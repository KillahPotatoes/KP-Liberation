/*
    KPLIB_fnc_common_createCrew

    File: fn_common_createCrew.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-25
    Last Update: 2018-12-17
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
if ((isNull _vehicle) || !(alive _vehicle)) exitWith {grpNull};

private _turrets = (allTurrets _vehicle);

// Get driver class depending on vehicle type
private _driverType = switch (true) do {
    // Civilians and resitance do not have specialized infantry units
    case (_side in [KPLIB_preset_sideC, KPLIB_preset_sideR]): {"units"};
    case (_vehicle isKindOf "Plane"): {"rsPilotJet"};
    case (_vehicle isKindOf "Helicopter"): {"rsPilotHeli"};
    default {"rsCrewmanVeh"};
};

private _driverClass = [[_driverType, _side] call KPLIB_fnc_common_getPresetClass];

// Get crew class depending on vehicle type
private _crewType = switch (true) do {
    // Civilians and resitance do not have specialized infantry units
    case (_side in [KPLIB_preset_sideC, KPLIB_preset_sideR]): {"units"};
    case (_vehicle isKindOf "Plane"): {"rsPilotJet"};
    case (_vehicle isKindOf "Helicopter"): {"rsCrewmanHeli"};
    default {"rsCrewmanVeh"};
};

private _crewClasses = _turrets apply {
    [_crewType, _side] call KPLIB_fnc_common_getPresetClass;
};

// Spawn group and move into to vehicle
private _grp = [_side, _driverClass + _crewClasses, getPos _vehicle] call KPLIB_fnc_common_createGroup;
// Move the units into the vehicle, -1 indicates driver
{
    if (_forEachIndex isEqualTo 0) then {
        ((units _grp) select _forEachIndex) moveInDriver _vehicle;
    } else {
        ((units _grp) select _forEachIndex) moveInTurret [_vehicle, _x];
    }
} forEach [-1] + _turrets;

// Remove excess units from group
{
    if (isNull objectParent _x) then {
        deleteVehicle _x;
    };
} foreach (units _grp);

// Assign vehicle to group and make sure the commander is group leader
_grp addVehicle _vehicle;
_grp selectLeader (commander _vehicle);

// Return created crew
_grp
