/*
    KPLIB_fnc_persistence_serializeObject

    File: fn_persistence_serializeObject.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-03-14
    Last Update: 2019-03-14
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Serializes vehicle into an array.

    Parameter(s):
        _vehicle - Vehicle to serialize [OBJECT, defaults to objNull]

    Returns:
        Serialized vehicle state [ARRAY]
*/
params [
    ["_vehicle", objNull, [objNull]]
];

if (isNull _vehicle) exitWith {[]};

private _vehicleType = typeOf _vehicle;

private _hitpoints = [];
private _configHitpoints = configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints";

// Get current damage
for "_i" from 0 to (count _configHitpoints - 1) do {
    private _hitpointEntry = configName (_configHitpoints select _i);
    private _hitpointHealth = _vehicle getHitPointDamage _hitpointEntry;
    _hitpoints pushBack [_hitpointEntry, _hitpointHealth];
};

private _vehiclePos = getPosWorld _vehicle;
private _vehicleDirAndUp = [vectorDir _vehicle, vectorUp _vehicle];
private _vehicleAlive = alive _vehicle;
private _vehicleDamage = damage _vehicle;


private _vehicleCrew = [];
if (_vehicle isKindOf "AllVehicles") then {
    {
        _vehicleCrew pushBack (_x call KPLIB_fnc_persistence_serializeUnit);
    } forEach (crew _vehicle);
};

private _vehicleFuel = fuel _vehicle;

private _vehicleAmmo = [];
private _vehicleMagazineCargo = [];
private _vehicleItemCargo = [];
private _vehicleWeapons = [];
private _vehicleBackPacks = [];

private _vehicleBackpackItems = [];
private _vehicleBackpackMagazines = [];
private _vehicleBackpackWeapons = [];


if (_vehicleAlive) then {
    _vehicleAmmo = magazinesAmmo _vehicle;
    _vehicleMagazineCargo =  getMagazineCargo _vehicle;
    _vehicleItemCargo =  itemCargo _vehicle;
    _vehicleWeapons = weaponsItemsCargo _vehicle;
    _vehicleBackPacks = getBackpackCargo _vehicle;

    {
        _x params ["", "_container"];
        _vehicleBackpackItems append (itemCargo _container);
        _vehicleBackpackMagazines append (getMagazineCargo _container);
        _vehicleBackpackWeapons append (weaponsItems _container);
    } forEach (everyContainer _vehicle);
};

// Return
[
    _vehicleType,
    _vehiclePos,
    _vehicleDirAndUp,
    _vehicleAlive,
    _vehicleDamage,
    _hitpoints,
    _vehicleFuel,
    _vehicleAmmo,
    _vehicleMagazineCargo,
    _vehicleItemCargo,
    _vehicleWeapons,
    _vehicleCrew,
    _vehicleBackPacks,
    _vehicleBackpackItems,
    _vehicleBackpackMagazines,
    _vehicleBackpackWeapons
]
