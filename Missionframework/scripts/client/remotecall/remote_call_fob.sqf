if ( isDedicated ) exitWith {};

if ( isNil "sector_timer" ) then { sector_timer = 0 };

params [ "_fob", "_status" ];
private [ "_fobname" ];

_fobname = [_fob] call KPLIB_fnc_getFobName;

if ( _status == 0 ) then {
    [ "lib_fob_built", [ _fobname ] ] call BIS_fnc_showNotification;
};

if ( _status == 1 ) then {
    [ "lib_fob_attacked", [ _fobname ] ] call BIS_fnc_showNotification;
    "opfor_capture_marker" setMarkerPosLocal _fob;
    sector_timer = GRLIB_vulnerability_timer;
};

if ( _status == 2 ) then {
    [ "lib_fob_lost", [ _fobname ] ] call BIS_fnc_showNotification;
    "opfor_capture_marker" setMarkerPosLocal markers_reset;
    sector_timer = 0;
};

if ( _status == 3 ) then {
    [ "lib_fob_safe", [ _fobname ] ] call BIS_fnc_showNotification;
    "opfor_capture_marker" setMarkerPosLocal markers_reset;
    sector_timer = 0;
};
