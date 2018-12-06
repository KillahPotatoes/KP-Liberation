/*
    KPLIB_fnc_plm_apply

    File: fn_plm_apply.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-04
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Applies and saves the selected settings from the player menu dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Apply current view distance and sound volume
[] call KPLIB_fnc_plm_getInOut;

// Apply terrain detail setting
switch (KPLIB_plm_terrain) do {
    case 0: {setTerrainGrid 50;};
    case 1: {setTerrainGrid 25;};
    case 2: {setTerrainGrid 12.5;};
    case 3: {setTerrainGrid 6.25;};
    case 4: {setTerrainGrid 3.125;};
    default {setTerrainGrid 10;};
};

// Apply radio chatter setting
switch (KPLIB_plm_radio) do {
    case 1: {enableRadio true; 1 fadeRadio 0;};
    case 2: {enableRadio false; 1 fadeRadio 0;};
    default {enableRadio true; 1 fadeRadio 1;};
};

true
