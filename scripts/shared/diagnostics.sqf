private _source = "";

diag_log format ["[KP LIBERATION] [MISSIONSTART] Missionfile: %1 - World Name: %2 - Version: %3 - Blufor: %4 - Opfor: %5 - Resistance: %6 - Civilians: %7 - Arsenal: %8",(localize "STR_MISSION_TITLE"), worldName, (localize "STR_MISSION_VERSION"),KP_liberation_preset_blufor, KP_liberation_preset_opfor, KP_liberation_preset_resistance, KP_liberation_preset_civilians, KP_liberation_arsenal];

waitUntil {sleep 1; !isNil "active_sectors"};

while {true} do {
	if (isDedicated) then {
		_source = "Server";
	} else {
		_source = name player;
	};
	
	if (isServer) then {
		diag_log format ["[KP LIBERATION] [STATS] Source: %1 - FPS: %2 - Local groups: %3 - Local units: %4 - Total units: %5 - Vehicles: %6 - Active Sectors: %7 - Active Scripts: %8",
		_source,
		((round (diag_fps * 100.0)) / 100.0),
		{local _x} count allGroups,
		{local _x} count allUnits,
		count allUnits,
		count vehicles,
		count active_sectors,
		diag_activeScripts];
	} else {
		private _text = format ["[KP LIBERATION] [STATS] Source: %1 - FPS: %2 - Local groups: %3 - Local units: %4 - Active Scripts: %5",
		_source,
		((round (diag_fps * 100.0)) / 100.0),
		{local _x} count allGroups,
		{local _x} count allUnits,
		diag_activeScripts];
		_text remoteExec ["diag_log",2];
	};
	sleep 60;
};
