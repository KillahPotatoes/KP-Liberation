/*
    File: fn_setDiscordState.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-10
    Last Update: 2020-04-10
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Updated the Discord rich presence state with given string.

    Parameter(s):
        _state - New state which should be applied to rich presence [STRING, defaults to ""]

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_state", "", [""]]
];

[
    ["UpdateState", _state]
] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

true
