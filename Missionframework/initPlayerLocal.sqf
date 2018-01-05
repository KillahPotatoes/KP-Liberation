/*
	KP LIBERATION PLAYER INIT FILE
	
	File: initPlayerLocal.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Playerside initialization file for Liberation. Runs after initServer.
*/

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
