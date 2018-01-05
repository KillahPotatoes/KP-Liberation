/*
	KP Liberation periodic save trigger script
	
	File: saveManager_timeTrigger.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-16
	Last Update: 2017-12-30

	Description:
	Repeatedly triggers the save process depending on configured time interval.
*/

while {KPLIB_campaignRunning} do {
	uiSleep KPLIB_save_interval;
	KPLIB_save_trigger = true;
};
