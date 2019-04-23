/*
    KPLIB_fnc_virtual_postInit

    File: fn_virtual_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        The postInit function of a module takes care of starting/executing the modules functions or scripts.
        Basically it starts/initializes the module functionality to make all provided features usable.

    Parameter(s):
        NONE

    Returns:
        Module postInit finished [BOOL]
*/

if (isServer) then {["Module initializing...", "POST] [VIRTUAL", true] call KPLIB_fnc_common_log;};

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

if (isServer) then {["Module initialized", "POST] [VIRTUAL", true] call KPLIB_fnc_common_log;};

true
