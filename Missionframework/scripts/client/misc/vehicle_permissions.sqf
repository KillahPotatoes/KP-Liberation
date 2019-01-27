params ["_role", "_vehicle"];

private _doEject = false;
private _blacklistedRoles = ["driver", "gunner", "commander"];
private _permissableVehicles = [["Tank", 1, "STR_PERMISSION_NO_ARMOR"], ["Air", 2, "STR_PERMISSION_NO_AIR"]];

_playerVehicleDetails = _permissableVehicles select {_vehicle isKindOf (_x select 0)} select 0;
if(count _playerVehicleDetails == 0) then {
	if(!([player, 0] call F_fetchPermission)) then {
		_doEject = true;
		hint localize "STR_PERMISSION_NO_LIGHT";
	};
} else {
	_vehiclePermissionIndex = _playerVehicleDetails select 1;
	_vehiclePermissionAccessMessage = _playerVehicleDetails select 2;

	if(!([player, _vehiclePermissionIndex] call F_fetchPermission) && _role in _blacklistedRoles) then {
		_doEject = true;
		hint localize _vehiclePermissionAccessMessage;
	};
};

if (_doEject) then {
	moveOut player;
};