private _source = "";

diag_log text "[KP LIBERATION] [MISSIONSTART] ------------------------------------";
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Name: %1", (localize "STR_MISSION_TITLE")];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] World: %1", worldName];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Version: %1", (localize "STR_MISSION_VERSION")];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Author: %1", [missionConfigFile] call BIS_fnc_overviewAuthor];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Blufor: %1", KP_liberation_preset_blufor];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Opfor: %1", KP_liberation_preset_opfor];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Resistance: %1", KP_liberation_preset_resistance];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Civilians: %1", KP_liberation_preset_civilians];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] Arsenal: %1", KP_liberation_arsenal];
diag_log text format ["[KP LIBERATION] [MISSIONSTART] ACE: %1", KP_liberation_ace];
diag_log text "[KP LIBERATION] [MISSIONSTART] ------------------------------------";

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
