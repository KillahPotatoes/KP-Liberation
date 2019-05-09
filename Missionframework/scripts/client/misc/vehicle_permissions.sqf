params ["_vehicle"];
private _vehicleClass = toLower typeOf _vehicle;

// Cargo is always allowed
private _isCargo = (_vehicle getCargoIndex player) != -1;
if (_isCargo || _vehicle isKindOf "ParachuteBase") exitWith {};

private _permissibleVehicles = [
    [light_vehicles_classes, "STR_PERMISSION_NO_LIGHT"],
    [heavy_vehicles_classes, "STR_PERMISSION_NO_ARMOR"],
    [air_vehicles_classes, "STR_PERMISSION_NO_AIR"]
];

private _permissionIdx = _permissibleVehicles findIf {_vehicleClass in (_x select 0)};
if (_permissionIdx isEqualTo -1) exitWith {};

if !([player, _permissionIdx] call F_fetchPermission) exitWith {
    moveOut player;
    hint localize (_permissibleVehicles select _permissionIdx select 1);
};
