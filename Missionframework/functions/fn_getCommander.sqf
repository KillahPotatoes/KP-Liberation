/*
    File: fn_getCommander.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Returns the actual commander object.

    Parameter(s):
        NONE

    Returns:
        Commander [OBJECT]
*/

if (!isNil "commandant") then {
    {
        if (_x == commandant) exitWith {_x};
    } forEach allPlayers;
} else {
    objNull
};
