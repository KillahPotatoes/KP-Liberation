private _source = "";

if (isDedicated) then {
	_source = "Server";
} else {
	_source = name player;
};

diag_log format ["[KP LIBERATION] [MISSIONSTART] Missionfile: %1 - World Name: %2 - Version: %3 - Blufor: %4 - Opfor: %5 - Resistance: %6 - Civilians: %7 - Arsenal: %8",(localize "STR_MISSION_TITLE"), worldName, (localize "STR_MISSION_VERSION"),KP_liberation_preset_blufor, KP_liberation_preset_opfor, KP_liberation_preset_resistance, KP_liberation_preset_civilians, KP_liberation_arsenal];

waitUntil {sleep 1; !isNil "active_sectors"};

while {true} do {
	if (isServer) then {
		diag_log format ["[KP LIBERATION] [STATS] Source: %1 - FPS: %2 - Total units: %3 - Hostile units: %4 - Local units: %5 - Vehicles: %6 - Active Sectors: %7",
		_source,
		((round (diag_fps * 100.0)) / 100.0),
		count allUnits,
		{side group _x == GRLIB_side_enemy} count allUnits,
		{local _x} count allUnits,
		count vehicles,
		count active_sectors];
	} else {
		private _text = format ["[KP LIBERATION] [STATS] Source: %1 - FPS: %2 - Local units: %3",
		_source,
		((round (diag_fps * 100.0)) / 100.0),
		{local _x} count allUnits];
		_text remoteExec ["diag_log",2];
	};
	sleep 60;
};
