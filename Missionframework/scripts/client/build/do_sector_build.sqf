private ["_building"];

_building = (_this select 3) createVehicle (getPosATL player);
_building setPosATL (getPosATL player);
_building setdir ((getDir player) - 180);
_building setVectorUp surfaceNormal position player;
_building setVariable ["KP_liberation_storage_type", 1, true];
