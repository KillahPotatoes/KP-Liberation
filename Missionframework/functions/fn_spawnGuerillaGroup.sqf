/*
    File: fn_spawnGuerillaGroup.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-08
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Spawns a group of guerilla units with random gear depending on guerilla strength.

    Parameter(s):
        _pos    - Position where to spawn the group                             [POSITION, defaults to [0, 0, 0]]
        _amount - Amount of units for the group. 0 for automatic calculation    [NUMBER, defaults to 0]

    Returns:
        Spawned group [GROUP]
*/
// TODO
params [["_pos", [0, 0, 0]], ["_amount", 0]];

private _grp = createGroup [GRLIB_side_resistance, true];
private _tier = [] call KPLIB_fnc_getResistanceTier;
private _cr_multi = [] call KPLIB_fnc_crGetMulti;
if (_amount == 0) then {_amount = (6 + (round (random _cr_multi)) + (round (random _tier)));};
private _weapons = missionNamespace getVariable ("KP_liberation_guerilla_weapons_" + str _tier);
private _uniforms = missionNamespace getVariable ("KP_liberation_guerilla_uniforms_" + str _tier);
private _vests = missionNamespace getVariable ("KP_liberation_guerilla_vests_" + str _tier);
private _headgear = missionNamespace getVariable ("KP_liberation_guerilla_headgear_" + str _tier);

while {(count (units _grp) < _amount)} do {
    private _unit = [selectRandom KP_liberation_guerilla_units, _pos, _grp, "PRIVATE", 5] call KPLIB_fnc_createManagedUnit;

    private _weapon = selectRandom _weapons;

    removeAllWeapons _unit;
    removeAllItems _unit;
    removeAllAssignedItems _unit;
    removeUniform _unit;
    removeVest _unit;
    removeBackpack _unit;
    removeHeadgear _unit;
    removeGoggles _unit;

    _unit forceAddUniform (selectRandom _uniforms);
    _unit addItemToUniform "FirstAidKit";
    _unit addItemToUniform "MiniGrenade";
    _unit addVest (selectRandom _vests);
    for "_i" from 1 to (_weapon select 2) do {_unit addItemToVest (_weapon select 1);};
    _unit addHeadgear (selectRandom _headgear);
    if (_tier > 1) then {
        _unit addGoggles (selectRandom KP_liberation_guerilla_facegear);
    };

    _unit addWeapon (_weapon select 0);
    _unit addPrimaryWeaponItem (_weapon select 3);
    _unit addPrimaryWeaponItem (_weapon select 4);

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "ItemRadio";

    if ((_tier > 1) && ((random 100) <= KP_liberation_resistance_at_chance)) then {
        _unit addBackpack "B_FieldPack_cbr";
        for "_i" from 1 to 3 do {_unit addItemToBackpack "RPG7_F";};
        _unit addWeapon "launch_RPG7_F";
    };
};

_grp
