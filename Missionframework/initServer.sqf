/*
	KP LIBERATION SERVER INIT FILE
	
	File: initServer.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Server initialization file for Liberation. Runs before everything else.
*/

diag_log format ["[KP LIBERATION] [INIT] Time: %1 - Mission initialization started", diag_tickTime];

// Deactivate vanilla saving
enableSaving [false, false];

// Initialize mission
call compile preprocessFileLineNumbers "modules\00_init\initModule.sqf";

diag_log format ["[KP LIBERATION] [INIT] Time: %1 - Mission initialization finished", diag_tickTime];

KPLIB_initServerDone = true;
publicVariable "KPLIB_initServerDone";
