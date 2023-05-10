/*
    File: fn_getOpforFactor.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2023-05-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the opfor factor to scale down enemy forces, if "adapt to player count" mission param is enabled.

    Parameter(s):
        NONE

    Returns:
        Opfor factor [NUMBER]
*/

if !(KPLIB_param_adaptive) exitWith {1};

private _bluforcount = (0.2 * (count (units KPLIB_side_player))) + ([] call KPLIB_fnc_getPlayerCount);

(0.5 + (_bluforcount / 25.0)) min 1
