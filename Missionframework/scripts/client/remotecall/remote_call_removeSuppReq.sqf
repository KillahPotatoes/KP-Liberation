if (isDedicated) exitWith {};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] [SUPP] Source: %1 - Remove SuppMod Sync", debug_source];_text remoteExec ["diag_log",2];};
[KP_liberation_suppMod_req, KP_liberation_suppMod_arty] call BIS_fnc_removeSupportLink;
deleteVehicle KP_liberation_suppMod_req;
KP_liberation_suppMod_req = nil;