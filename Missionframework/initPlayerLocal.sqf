diag_log format ["[KP LIBERATION] [INIT] Time: %1 - Receiving data...", diag_tickTime];

// Receive initialization data
private _receive = [] spawn KPLIB_fnc_init_receiveInit;

waitUntil {scriptDone _receive};

diag_log format ["[KP LIBERATION] [INIT] Time: %1 - All data received", diag_tickTime];

if (hasInterface) then {
	// Preload the arsenal to speed up arsenal opening during the game
	["Preload"] call BIS_fnc_arsenal;
	// Create needed local markers
	call KPLIB_fnc_init_clientMarkers;
};

KPLIB_initClientDone = true;
