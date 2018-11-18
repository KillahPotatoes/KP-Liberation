/*
    KPLIB_fnc_virtual_postInit

    File: fn_virtual_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-18
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

    // Add zeus to
    if (player isEqualTo (missionNamespace getVariable ["KPLIB_eden_commander", objNull])) then {
        ["KPLIB_virtual_giveZeus", [player, KPLIB_param_virtual_commanderZeusMode]] call CBA_fnc_serverEvent;
    };

    if (player isEqualTo (missionNamespace getVariable ["KPLIB_eden_subCommander", objNull])) then {
        ["KPLIB_virtual_giveZeus", [player, KPLIB_param_virtual_subCommanderZeusMode]] call CBA_fnc_serverEvent;
    };

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [VIRTUAL] Module initialized", diag_tickTime];};

true
