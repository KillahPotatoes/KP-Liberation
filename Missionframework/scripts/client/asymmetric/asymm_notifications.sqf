if (isDedicated) exitWith {};

params ["_notif_id", ["_pos", getpos player]];

if (KP_liberation_asymmetric_debug > 0) then {[format ["asymm_notifications called on: %1 - Parameters: [%2, %3] ", debug_source, _notif_id, _pos], "ASYMMETRIC"] remoteExecCall ["KPLIB_fnc_log", 2];};

switch (_notif_id) do {
    case 0: {
        ["lib_asymm_convoy_ambush", [markertext ([10000, _pos] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        private _ambush_marker = createMarkerLocal ["asymm_ambushmarker", _pos];
        _ambush_marker setMarkerDirLocal (random 360);
        _ambush_marker setMarkerColorLocal "ColorIndependent";
        _ambush_marker setMarkerTypeLocal "hd_ambush";
    };
    case 1: {
        ["lib_asymm_convoy_ambush_success"] call BIS_fnc_showNotification;
        deleteMarkerLocal "asymm_ambushmarker";
    };
    case 2: {
        ["lib_asymm_convoy_ambush_fail"] call BIS_fnc_showNotification;
        deleteMarkerLocal "asymm_ambushmarker";
    };
    default {[format ["asymm_notifications.sqf -> no valid value for _notif_id: %1", _notif_id], "ERROR"] remoteExecCall ["KPLIB_fnc_log", 2];};
};
