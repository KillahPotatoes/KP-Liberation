/*
    KPLIB_fnc_core_checkWinCond

    File: fn_core_checkWinCond.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-05-10
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks if the selected win conditions are met and end the mission.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// In the next steps we'll implement a parameter for more win conditions. For now the "old one" will be used.
if (({_x in KPLIB_sectors_blufor} count KPLIB_sectors_metropolis) == count KPLIB_sectors_metropolis) then {
    KPLIB_campaignRunning = false;
    [] call KPLIB_fnc_init_wipe;
    "KPLIB_win" call BIS_fnc_endMissionServer;
};

true
