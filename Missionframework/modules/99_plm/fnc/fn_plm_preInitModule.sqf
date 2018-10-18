/*
    KPLIB_fnc_plm_preInitModule

    File: fn_plm_preInitModule.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-18
    Last Update: 2018-10-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    This preInit function defines just the global variables which are added due to this module.

    Dependencies:
        * KP GUI system

    Returns:
    BOOL
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [PLM] Module initializing...", diag_tickTime];};

/*
    ----- Module Globals -----
*/

// View distance on foot
KPLIB_plm_viewFoot = viewDistance;

// View distance in land vehicle
KPLIB_plm_viewVeh = viewDistance;

// View distance in air vehicle
KPLIB_plm_viewAir = viewDistance;

// Terrain detail setting
KPLIB_plm_terrain = 2;

// Auto 3rd Person setting
KPLIB_plm_tpv = 0;

// Disable radio chatter setting
KPLIB_plm_radio = 0;

// Sound volume inside a vehicle
KPLIB_plm_soundVeh = soundVolume;

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [PRE] [PLM] Module initialized", diag_tickTime];};

true
