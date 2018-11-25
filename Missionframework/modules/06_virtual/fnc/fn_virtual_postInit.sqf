/*
    KPLIB_fnc_virtual_postInit

    File: fn_virtual_postInit.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-18
    Last Update: 2018-11-25
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
        [player, "respawn", {
            ["KPLIB_player_giveZeus", [player, KPLIB_param_commanderZeusMode]] call CBA_fnc_serverEvent;

            player removeEventHandler ["respawn", _thisID];
        }] call CBA_fnc_addBISEventHandler;

        // Listen for CBA event to allow changing of zeus when mission is running
        ["CBA_SettingChanged", {
            params ["_setting", "_value"];

            if !(_setting isEqualTo "KPLIB_param_commanderZeusMode") exitWith {};

            ["KPLIB_player_giveZeus", [player, _value]] call CBA_fnc_serverEvent;
        }] call CBA_fnc_addEventHandler;
    };

    // Add zeus to sub-commander
    if (vehicleVarName player isEqualTo "KPLIB_eden_subCommander") then {
        [player, "respawn", {
            ["KPLIB_player_giveZeus", [player, KPLIB_param_subCommanderZeusMode]] call CBA_fnc_serverEvent;

            player removeEventHandler ["respawn", _thisID];
        }] call CBA_fnc_addBISEventHandler;

        // Listen for CBA event to allow changing of zeus when mission is running
        ["CBA_SettingChanged", {
            params ["_setting", "_value"];

            if !(_setting isEqualTo "KPLIB_param_subCommanderZeusMode") exitWith {};

            ["KPLIB_player_giveZeus", [player, _value]] call CBA_fnc_serverEvent;
        }] call CBA_fnc_addEventHandler;
    };

};

if (isServer) then {diag_log format ["[KP LIBERATION] [%1] [POST] [VIRTUAL] Module initialized", diag_tickTime];};

true
