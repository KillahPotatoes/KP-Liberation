params ["_msgType",["_data",[]]];

if (KP_liberation_civrep_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVREP] globalMsg called on: %1 - Parameters: [%2, %3]", debug_source, _msgType, _data];_text remoteExec ["diag_log",2];};

switch (_msgType) do {
	case 0: {systemChat localize "STR_CR_VEHICLEMSG";};
	case 1: {systemChat (format [localize "STR_CR_BUILDINGMSG", (_data select 0)]);};
	case 2: {systemChat (format [localize "STR_CR_KILLMSG", (_data select 0)]);};
	case 3: {systemChat (format [localize "STR_CR_RESISTANCE_KILLMSG", (_data select 0)]);};
	case 4: {systemChat (format [localize "STR_CR_HEALMSG", (_data select 0)]);};
	case 5: {["lib_asymm_guerilla_incoming", _data] call BIS_fnc_showNotification;};
	default {private _text = format ["[KP LIBERATION] [ERROR] [CIVREP] globalMsg without valid msgType"];_text remoteExec ["diag_log",2];};
};
