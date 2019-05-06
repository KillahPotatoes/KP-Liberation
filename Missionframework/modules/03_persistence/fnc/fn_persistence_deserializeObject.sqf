/*
    KPLIB_fnc_persistence_deserializeObject

    File: fn_persistence_deserializeObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-17
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Creates object from serialized array.

    Parameter(s):
        _type             - Object classname  [STRING, defaults to ""]
        _pos              - Position WORLD    [Pos WORLD, defaults to KPLIB_zeroPos]
        _dirAndUp         - Dir and up        [ARRAY]

    Returns:
        Created object [OBJECT]
*/
params [
    ["_type", "", [""]],
    ["_worldPos", KPLIB_zeroPos, [[]], 3],
    ["_dirAndUp", [[0,1,0], [0,0,1]], [[]], 2],
    ["_alive", true, [true]],
    ["_damage", 0, [0]],
    ["_hitpointsDamage", [], [[]]],
    ["_crew", [], [[]]],
    ["_fuel", 1, [0]],
    ["_turretMagazines", [], [[]]],
    ["_cargo", [], [[]]]
];

private _object = _type call KPLIB_fnc_common_createVehicle;
_object setPosWorld _worldPos;
_object setVectorDirAndUp _dirAndUp;
_object setDamage [_damage, false];

{
    _object setHitPointDamage _x;
} forEach _hitpointsDamage;

_object setFuel _fuel;

[_object, _turretMagazines] call KPLIB_fnc_persistence_setTurretMagazines;
[_object, _cargo] call KPLIB_fnc_persistence_setCargo;

_object
