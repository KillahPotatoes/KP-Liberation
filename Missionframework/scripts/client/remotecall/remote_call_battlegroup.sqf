if ( !hasInterface ) exitWith {};

params [ "_battlegroup_position" ];

"opfor_bg_marker" setMarkerPosLocal ( markerPos _battlegroup_position );
[ "lib_battlegroup", [ markerText ( [ 10000, markerPos _battlegroup_position ] call KPLIB_fnc_getNearestSector ) ] ] call BIS_fnc_showNotification;

sleep 600;

"opfor_bg_marker" setMarkerPosLocal markers_reset;
