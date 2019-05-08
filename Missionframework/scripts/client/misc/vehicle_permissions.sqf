params ["_unit", "_vehicle"];

private _role = assignedVehicleRole player select 0;
if (_role isEqualTo "cargo") exitWith {};

private _permissibleVehicles = [
    ["Car", 0, "STR_PERMISSION_NO_LIGHT"],
    ["Tank", 1, "STR_PERMISSION_NO_ARMOR"],
    ["Air", 2, "STR_PERMISSION_NO_AIR"]
];

(_permissibleVehicles select {_vehicle isKindOf (_x select 0)} select 0) params ["_type", "_permission", "_hintString"];

if !([player, _permission] call F_fetchPermission) exitWith {
    moveOut player;
    hint localize _hintString;
};