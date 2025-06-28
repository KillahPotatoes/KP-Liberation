/*
    KPLIB_fnc_cratefiller_postInit

    File: fn_cratefiller_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-05
    Last Update: 2020-10-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html


    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {

    // create cratefiller presets on startup
    [] call KPLIB_fnc_cratefiller_presets;
};

// Player section
if (hasInterface) then {

    // Add CBA event handler to the base objects
    [KPLIB_b_logiStation,
    "init",
    {
        (_this select 0) addAction [
        ["<t color='#FFFF00'>", localize "STR_KPLIB_CRATEFILLER_ACTIONOPEN", "</t>"] joinString "",
        {[] call KPLIB_fnc_cratefiller_openDialog},
        nil,
        -850,
        false,
        true,
        "",
        ""
    ];
    },
    nil,
    nil,
    true
] call CBA_fnc_addClassEventHandler;

};

true
