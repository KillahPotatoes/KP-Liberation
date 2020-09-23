/*
    KPLIB_fnc_cratefiller_preInit

    File: fn_cratefiller_preInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-02
    Last Update: 2020-09-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html


    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

if (isServer) then {

    KPLIB_cratefiller_data = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_cratefiller_data";

    KPLIB_cratefiller_cache = true call CBA_fnc_createNamespace;
    publicVariable "KPLIB_cratefiller_cache";
};

// Process CBA Settings
[] call KPLIB_fnc_cratefiller_settings;

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
