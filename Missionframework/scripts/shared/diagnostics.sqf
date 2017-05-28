private [ "_source" ];

_source = "";
if ( isServer ) then {
	_source = "Server";
} else {
	_source = name player;
};

diag_log format ["[KP LIBERATION] [MISSIONSTART] Missionfile: %1 - World Name: %2 - Version: %3 - Unit Preset: %4 - Arsenal Preset: %5",(localize "STR_MISSION_TITLE"), worldName, (localize "STR_MISSION_VERSION"),KP_liberation_preset, KP_liberation_arsenal];

while { true } do {
	diag_log format [ "[KP LIBERATION] [STATS] Source: %1 - Time: %2 - FPS: %3 - Total units: %4 - Hostile units: %5 - Local units: %6 - Vehicles: %7 - Unitcap: %8",
	_source,
	time,
	diag_fps,
	count allUnits,
	{ side group _x == GRLIB_side_enemy } count allUnits,
	{ local _x } count allUnits,
	count vehicles,
	GRLIB_sector_cap ];
	sleep 60;
};