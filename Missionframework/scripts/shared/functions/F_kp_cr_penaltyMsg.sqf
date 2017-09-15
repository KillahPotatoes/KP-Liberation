params ["_msgType",["_data",[]]];

switch (_msgType) do {
	case 0: {systemChat localize "STR_CR_VEHICLEMSG";};
	case 1: {systemChat (format [localize "STR_CR_BUILDINGMSG", (_data select 0)]);};
	case 2: {systemChat (format [localize "STR_CR_KILLMSG", (_data select 0)]);};
	default {private _text = format ["[KP LIBERATION] [ERROR] [CIVREP] penaltyMsg without valid msgType"];_text remoteExec ["diag_log",2];};
};
