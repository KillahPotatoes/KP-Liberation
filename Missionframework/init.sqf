waitUntil {!isNil "KPLIB_initServerDone"};
waitUntil {KPLIB_initServerDone};
waitUntil {!isNil "KPLIB_save_loaded"};
waitUntil {KPLIB_save_loaded};

if (!isDedicated) then {
	waitUntil {!isNil "KPLIB_initClientDone"};
	waitUntil {KPLIB_initClientDone};
};

diag_log format [
	"[KP LIBERATION] [MISSIONSTART] Missionfile: %1 - World Name: %2 - Version: %3 - Blufor: %4 - Opfor: %5 - Resistance: %6 - Civilians: %7 - Arsenal: %8 - ACE: %9",
	(localize "STR_MISSION_TITLE"),
	worldName,
	(localize "STR_MISSION_VERSION"),
	KPLIB_preset_blufor,
	KPLIB_preset_opfor,
	KPLIB_preset_resistance,
	KPLIB_preset_civilians,
	KPLIB_preset_arsenal,
	KPLIB_aceEnable
];

// Call module inits
call compile preprocessFileLineNumbers "modules\01_core\initModule.sqf";

KPLIB_initDone = true;
