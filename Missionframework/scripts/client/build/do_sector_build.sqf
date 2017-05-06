private ["_building"];

if (((_this select 3) select 0) == KP_liberation_small_storage_building) then {
	_building = ((_this select 3) select 0) createVehicle (getPosATL player);
	_building setPosATL (getPosATL player);
	_building setdir ((getDir player) - 180);
	_building setVectorUp surfaceNormal position player;
	_building setVariable ["KP_liberation_storage_type", 1, true];
} else {
	[((_this select 3) select 1), ((_this select 3) select 0)] remoteExec ["build_fac_remote_call",2];
};
