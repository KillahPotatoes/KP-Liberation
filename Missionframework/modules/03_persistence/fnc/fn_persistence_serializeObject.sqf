/*
    KPLIB_fnc_persistence_serializeObject

    File: fn_persistence_serializeObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-14
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Serializes vehicle into an array.

    Parameter(s):
        _object - Vehicle to serialize [OBJECT, defaults to objNull]

    Returns:
        Serialized vehicle state [ARRAY]
*/
params [
    ["_object", objNull, [objNull]]
];

if (isNull _object) exitWith {[]};

private _type = typeOf _object;

private _hitpointsDamage = [];
private _hitpoints = getAllHitPointsDamage _object;

for "_i" from 0 to (count (_hitpoints select 0) - 1) do {
    _hitpointsDamage pushBack [
        _hitpoints select 0 select _i,
        _hitpoints select 2 select _i
    ];
};

private _worldPos = getPosWorld _object;
private _dirAndUp = [vectorDir _object, vectorUp _object];
private _alive = alive _object;
private _damage = damage _object;

private _crew = (crew _object) apply {_x call KPLIB_fnc_persistence_serializeUnit};

private _fuel = fuel _object;

private _turretMagazines = [];
private _cargo = [];
if (_alive) then {
    _turretMagazines = magazinesAllTurrets _object;
    _cargo = _object call KPLIB_fnc_persistence_getCargo;
};

// return
[
    _type,
    _worldPos,
    _dirAndUp,
    _alive,
    _damage,
    _hitpointsDamage,
    _crew,
    _fuel,
    _turretMagazines,
    _cargo
]
