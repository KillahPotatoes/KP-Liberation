/*
	KP Liberation periodic save trigger script
	
	File: saveManager_timeTrigger.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Repeatedly triggers the save process depending on configured time interval.
*/

while {KPLIB_campaignRunning} do {
	uiSleep KPLIB_save_interval;
	KPLIB_save_trigger = true;
};
