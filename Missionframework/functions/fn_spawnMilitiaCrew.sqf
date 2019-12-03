/*
    File: fn_spawnMilitiaCrew.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_vehicle"];

private _grp = createGroup [GRLIB_side_enemy, true];
private _vehcrew = [];
while {count units _grp < 3} do {
    [selectRandom militia_squad, getPos _vehicle, _grp] call KPLIB_fnc_createManagedUnit;
};
((units _grp) select 0) moveInDriver _vehicle;
((units _grp) select 1) moveInGunner _vehicle;
((units _grp) select 2) moveInCommander _vehicle;
{
    if (vehicle _x == _x) then {
        deleteVehicle _x;
    };
} foreach (units _grp);
