/*
	KP LIBERATION MODULE GLOBALS
	
	File: globals.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-28
	Last Update: 2018-03-28
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Initializes the global variables which are brought by this module.
*/

// Deploy button trigger for redeploy dialog
KPLIB_dialog_deploy = 0;
// Map scale trigger for redeploy dialog
KPLIB_dialog_mapTrigger = 0;
// Intro cinematic done
KPLIB_intro_done = false;
// Intro cinematic started
KPLIB_intro_started = false;
// Intro cinematic stopped
KPLIB_intro_stopped = false;
// Start game button state in intro cinematic
KPLIB_intro_startGame = 0;
// Tutorial button state in intro cinematic
KPLIB_intro_tutorial = 0;
// Last time a mobile respawn was done
KPLIB_respawn_time = time;
