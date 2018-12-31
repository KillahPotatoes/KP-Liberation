/*
    KPLIB_fnc_init_loadPresets

    File: fn_init_loadPresets.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-12-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Loads the configured preset files, checks if classnames are available with current modset and initialize global arrays which are dependent on the presets.
        Distributes the cleaned arrays to the clients.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]

    NOTE:
        Still not sure about this whole publicVariable method in the preset initialization.
        Idea was that the server will first initialize all vital stuff and distribute it to the clients.
        This would avoid that clients check all arrays for mods etc. to ensure equality in these arrays.
        As it would catch errors if a client has for example RHS loaded but not the server (due to verifySignatures 0 for example).
*/

// Load friendly (player side) preset
switch (KPLIB_param_presetF) do {
    case 0: {[true] call compile preprocessFileLineNumbers "presets\armies\customEast.sqf";};
    case 1: {[true] call compile preprocessFileLineNumbers "presets\armies\csat.sqf";};
    case 2: {[true] call compile preprocessFileLineNumbers "presets\armies\customWest.sqf";};
    case 3: {[true] call compile preprocessFileLineNumbers "presets\armies\nato.sqf";};
    default {[true] call compile preprocessFileLineNumbers "presets\armies\customWest.sqf";};
};

// Load enemy preset
switch (KPLIB_param_presetE) do {
    case 0: {[] call compile preprocessFileLineNumbers "presets\armies\customEast.sqf";};
    case 1: {[] call compile preprocessFileLineNumbers "presets\armies\csat.sqf";};
    case 2: {[] call compile preprocessFileLineNumbers "presets\armies\customWest.sqf";};
    case 3: {[] call compile preprocessFileLineNumbers "presets\armies\nato.sqf";};
    default {[] call compile preprocessFileLineNumbers "presets\armies\customEast.sqf";};
};

// Load resistance preset
switch (KPLIB_param_presetR) do {
    case 0: {[] call compile preprocessFileLineNumbers "presets\resistance\custom.sqf";};
    case 1: {[] call compile preprocessFileLineNumbers "presets\resistance\fia.sqf";};
    default {[] call compile preprocessFileLineNumbers "presets\resistance\custom.sqf";};
};

// Load civilian preset
switch (KPLIB_param_presetC) do {
    case 0: {[] call compile preprocessFileLineNumbers "presets\civilians\custom.sqf";};
    case 1: {[] call compile preprocessFileLineNumbers "presets\civilians\vanilla.sqf";};
    default {[] call compile preprocessFileLineNumbers "presets\civilians\custom.sqf";};
};

// Prepare preset packages
KPLIB_preset_packageF = [
    ["KPLIB_preset_nameF", KPLIB_preset_nameF],
    ["KPLIB_preset_alphabetF", KPLIB_preset_alphabetF]
];
KPLIB_preset_packageE = [
    ["KPLIB_preset_nameE", KPLIB_preset_nameE],
    ["KPLIB_preset_alphabetE", KPLIB_preset_alphabetE]
];
KPLIB_preset_packageR = [];
KPLIB_preset_packageC = [];

// Process all preset variables
private _suffix = "";
{
    _suffix = _x;
    {
        [_x, _suffix] call KPLIB_fnc_init_processPresetVar;
    } forEach KPLIB_preset_allVariables;
} forEach ["F", "E", "R", "C"];

// Pack all preset packages and publish them to the clients
KPLIB_preset_allData = [KPLIB_preset_packageF, KPLIB_preset_packageE, KPLIB_preset_packageR, KPLIB_preset_packageC];
publicVariable "KPLIB_preset_allData";

true
