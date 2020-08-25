/*
    File: fn_requestZeus.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-08-07
    Last Update: 2020-08-07
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Request Curator functionality from server.

    Parameter(s):
        _player - Player requesting Curator functionality [OBJECT, defaults to player]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_player", player, [objNull]]
];

[true, "KPLIB_createZeus", [_player, KP_liberation_limited_zeus]] remoteExecCall ["BIS_fnc_callScriptedEventHandler", 2];

true
