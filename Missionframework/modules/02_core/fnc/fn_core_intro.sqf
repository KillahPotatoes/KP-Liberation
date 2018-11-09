/*
    KPLIB_fnc_core_intro

    File: fn_core_intro.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-31
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Starts the intro cinematic with the optional credit introduction line.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

/*
--- TODO IN SPRINT .... soon ^^ ---
Rework the intro and cinematic. Currently it doesn't work reliable. Mostly an endless loop of the cinematic.
Postponed, as it's not in the current scope of the sprint 5 tasks.
*/

// Spawn cinematic camera procedure
[] spawn KPLIB_fnc_core_cinematic;

if (KPLIB_param_intro > 0) then {
    // Show intro texts
    uiSleep 1;
    cutRsc ["intro1", "PLAIN", 1, true];
    uiSleep 5.5;
    cutRsc ["intro2", "PLAIN", 1, true];
    uiSleep 10;
};

// Show the intro dialog for play or tutorial
createDialog "KPLIB_introMenu";
// If we are not able to open introMenu we should continue
waitUntil {dialog};
waitUntil {KPLIB_intro_startGame == 1 || KPLIB_intro_tutorial == 1 || !dialog};
closeDialog 0;

// Show tutorial, if selected
if (KPLIB_intro_tutorial == 0) then {
    KPLIB_intro_running = false;
};

// Finish the intro
KPLIB_intro_done = true;

true
