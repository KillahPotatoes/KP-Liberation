/*
    File: fn_secondsToTimer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-04-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Converts given amount of seconds to a MM:SS string.

    Parameter(s):
        _amount - Amount of seconds to convert [NUMBER, defaults to 0]

    Returns:
        MM:SS [STRING]
*/

params [
    ["_amount", 0, [0]]
];

if (_amount isEqualTo 0) exitWith {"00:00"};

private _minutes = floor (_amount / 60);
private _seconds = _amount % 60;

if (_minutes < 10) then {_minutes = ["0", _minutes] joinString "";};
if (_seconds < 10) then {_seconds = ["0", _seconds] joinString "";};

[_minutes, _seconds] joinString ":"
