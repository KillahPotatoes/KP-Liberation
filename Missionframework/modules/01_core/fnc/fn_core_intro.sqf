/*
    KPLIB_fnc_core_intro

    File: fn_core_intro.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-12-31
    Last Update: 2018-03-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Starts the intro cinematic with the optional credit introduction line.

    Parameter(s):
    NONE

    Returns:
    BOOL
*/

// Wait until mission is loaded
waitUntil {time > 0};

// Spawn cinematic camera procedure
[] spawn KPLIB_fnc_core_cinematic;

// If intro is enabled, show intro texts. Otherwise skip.
if (KPLIB_param_intro == 1) then {
    sleep 1;
    cutRsc ["intro1", "PLAIN", 1, true];
    sleep 5.5;
    cutRsc ["intro2", "PLAIN", 1, true];
    sleep 10;
};

// Show the intro dialog for play or tutorial
createDialog "KPLIB_introMenu";
waitUntil {dialog};
waitUntil {KPLIB_intro_startGame == 1 || KPLIB_intro_tutorial == 1 || !dialog};
closeDialog 0;

// Show tutorial, if selected
if (KPLIB_intro_tutorial == 0) then {
    KPLIB_intro_started = false;
};

// Finish the intro
KPLIB_intro_done = true;

true
