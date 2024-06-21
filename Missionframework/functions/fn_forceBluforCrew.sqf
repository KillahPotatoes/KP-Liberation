/*
    File: fn_forceBluforCrew.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Creates vehicle crew from vehicle config.
        If the crew isn't the same side as the players, it'll create a player side crew.

    Parameter(s):
        _veh - Vehicle to add the blufor crew to [OBJECT, defaults to objNull]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_veh", objNull, [objNull]]
];

if (isNull _veh) exitWith {["Null object given"] call BIS_fnc_error; false};

// Create regular config crew
private _grp = createVehicleCrew _veh;

// If the config crew isn't the correct side, replace it with the crew classnames from the preset
if ((side _grp) != KPLIB_side_player) then {
    deleteVehicleCrew _veh;

    _grp = createGroup [KPLIB_side_player, true];
    while {count units _grp < 3} do {
        [KPLIB_b_crewUnit, getPos _veh, _grp] call KPLIB_fnc_createManagedUnit;
    };
    ((units _grp) select 0) moveInDriver _veh;
    ((units _grp) select 1) moveInGunner _veh;
    ((units _grp) select 2) moveInCommander _veh;

    // Delete crew which isn't in the vehicle due to e.g. no commander seat
    {
        if (isNull objectParent _x) then {deleteVehicle _x};
    } forEach (units _grp);
};

// Set the crew to safe behaviour
_grp setBehaviour "SAFE";

true
