/*
    KPLIB_fnc_virtual_postInit

    File: fn_virtual_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [VIRTUAL] Module initializing...", diag_tickTime];};

if(hasInterface) then {

    // Add zeus to commander
    if (vehicleVarName player isEqualTo "KPLIB_eden_commander") then {
        "KPLIB_param_commanderZeusMode" call KPLIB_fnc_virtual_initCuratorOnPlayer;
    };

    // Add zeus to sub-commander
    if (vehicleVarName player isEqualTo "KPLIB_eden_subCommander") then {
        "KPLIB_param_subCommanderZeusMode" call KPLIB_fnc_virtual_initCuratorOnPlayer;
    };

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [VIRTUAL] Module initialized", diag_tickTime];};

true
