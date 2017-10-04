if (isDedicated) exitWith {};

params ["_notif_id", ["_pos", getpos player]];

if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_notifications called on: %1 - Parameters: [%2, %3] ", debug_source, _notif_id, _pos];_text remoteExec ["diag_log",2];};

switch (_notif_id) do {
	case 0: {
		["lib_civ_informant_start", [markertext ([10000, _pos] call F_getNearestSector)]] call BIS_fnc_showNotification;
		_informant_marker = createMarkerLocal ["informantmarker", _pos];
		_informant_marker setMarkerColorLocal "ColorCIV";
		_informant_marker setMarkerTypeLocal "hd_unknown";
	};
	case 1: {
		["lib_civ_informant_success"] call BIS_fnc_showNotification;
		deleteMarkerLocal "informantmarker";
	};
	case 2: {
		["lib_civ_informant_fail"] call BIS_fnc_showNotification;
		deleteMarkerLocal "informantmarker";
	};
	case 3: {
		["lib_civ_informant_death"] call BIS_fnc_showNotification;
		deleteMarkerLocal "informantmarker";
	};
	default {private _text = format ["[KP LIBERATION] [ERROR] civinfo_notifications.sqf -> no valid value for _notif_id: %1", _notif_id];_text remoteExec ["diag_log",2];};
};
