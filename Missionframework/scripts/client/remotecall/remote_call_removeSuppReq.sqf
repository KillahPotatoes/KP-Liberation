if (isDedicated) exitWith {};

[KP_liberation_suppMod_req, KP_liberation_suppMod_arty] call BIS_fnc_removeSupportLink;
deleteVehicle KP_liberation_suppMod_req;
KP_liberation_suppMod_req = nil;
