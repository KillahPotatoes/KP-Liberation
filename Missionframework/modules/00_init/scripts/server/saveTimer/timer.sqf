/*
    KP Liberation periodic save trigger script

    File: timer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-03-29
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Repeatedly triggers the save process depending on configured time interval.
*/

waitUntil {KPLIB_save_loaded};

while {KPLIB_campaignRunning} do {
    uiSleep KPLIB_save_interval;
    call KPLIB_fnc_init_save;
};

diag_log "[KP LIBERATION] [IMPORTANT] Save timer deactivated due to KPLIB_campaignRunning false.";
