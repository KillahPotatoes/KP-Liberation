/*
    KPLIB_fnc_persistence_serializeObject

    File: fn_persistence_serializeObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-14
    Last Update: 2019-03-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

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

private _objectType = typeOf _object;

private _hitpoints = [];
private _configHitpoints = configFile >> "CfgVehicles" >> _objectType >> "HitPoints";

// Get current damage
for "_i" from 0 to (count _configHitpoints - 1) do {
    private _hitpointEntry = configName (_configHitpoints select _i);
    private _hitpointHealth = _object getHitPointDamage _hitpointEntry;
    _hitpoints pushBack [_hitpointEntry, _hitpointHealth];
};

private _objectPos = getPosWorld _object;
private _objectDirAndUp = [vectorDir _object, vectorUp _object];
private _objectAlive = alive _object;
private _objectDamage = damage _object;


private _objectCrew = [];
if (_object isKindOf "AllVehicles") then {
    {
        _objectCrew pushBack (_x call KPLIB_fnc_persistence_serializeUnit);
    } forEach (crew _object);
};

private _objectFuel = fuel _object;

private _objectAmmo = [];
private _objectMagazineCargo = [];
private _objectItemCargo = [];
private _objectWeapons = [];
private _objectBackPacks = [];

private _objectBackpackItems = [];
private _objectBackpackMagazines = [];
private _objectBackpackWeapons = [];


if (_objectAlive) then {
    _objectAmmo = magazinesAmmo _object;
    _objectMagazineCargo =  getMagazineCargo _object;
    _objectItemCargo =  itemCargo _object;
    _objectWeapons = weaponsItemsCargo _object;
    _objectBackPacks = getBackpackCargo _object;

    {
        _x params ["", "_container"];
        _objectBackpackItems append (itemCargo _container);
        _objectBackpackMagazines append (getMagazineCargo _container);
        _objectBackpackWeapons append (weaponsItems _container);
    } forEach (everyContainer _object);
};

// Return
[
    _objectType,
    _objectPos,
    _objectDirAndUp,
    _objectAlive,
    _objectDamage,
    _hitpoints,
    _objectFuel,
    _objectAmmo,
    _objectMagazineCargo,
    _objectItemCargo,
    _objectWeapons,
    _objectCrew,
    _objectBackPacks,
    _objectBackpackItems,
    _objectBackpackMagazines,
    _objectBackpackWeapons
]
