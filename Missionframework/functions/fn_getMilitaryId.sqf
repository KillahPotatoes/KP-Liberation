/*
    File: fn_getMilitaryId.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-09-14
    Last Update: 2019-12-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Converts a number to an ID string.

    Parameter(s):
        _number - ID number to convert (starts with 0 as first character) [NUMBER, defaults to -1]

    Returns:
        Military ID [STRING]
*/

params [
    ["_number", -1, [0]]
];

if (_number isEqualTo -1) exitWith {["No valid number given"] call BIS_fnc_error; ""};

_number = _number + 1;
private _return = [];
private _alphabetCount = count military_alphabet;
private _remain = 0;

while {_number > 0} do {
    _remain = _number % _alphabetCount;
    _number = floor (_number / _alphabetCount);
    _return append [_remain - 1];
};

reverse _return;

(_return apply {military_alphabet select _x}) joinString " "
