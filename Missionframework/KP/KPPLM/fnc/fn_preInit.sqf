/*
    KPPLM_fnc_preInit

    File: fn_preInit.sqf
    Author: Wyqer - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2020-04-17
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The preInit function defines global variables, adds event handlers and set some vital settings which are used in this module.

    Parameter(s):
        NONE

    Returns:
        Module preInit finished [BOOL]
*/

// Check if CBA is running
KPPLM_CBA = isClass (configFile >> "CfgPatches" >> "cba_main");

// Check if KP Ranks is running
KPPLM_KPR = isClass (configFile >> "CfgPatches" >> "KP_Ranks");

// View distance on foot
KPPLM_viewFoot = viewDistance;

// View distance in land vehicle
KPPLM_viewVeh = viewDistance;

// View distance in air vehicle
KPPLM_viewAir = viewDistance;

// Terrain detail setting
KPPLM_terrain = 2;

// Auto 3rd Person setting
KPPLM_tpv = 0;

// Disable radio chatter setting
KPPLM_radio = 0;

// Sound volume inside a vehicle
KPPLM_soundVeh = soundVolume;

true
