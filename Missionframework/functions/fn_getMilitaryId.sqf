/*
    File: fn_getMilitaryId.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-09-14
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Converts a number to an ID string.

    Parameter(s):
        _count - ID number to convert [NUMBER, defaults to 0]

    Returns:
        Military ID [STRING]
*/
// TODO
params ["_count"];
private _level = 0;
private _return = "";

for [{_i = (count military_alphabet)}, {(_count + 1) > _i}, {_i = _i + (count military_alphabet)}] do {
    _level = _level + 1;
};

if (_level == 0) then {
    _return = military_alphabet select _count;
} else {
    _return = format ["%1 %2", [(_level - 1)] call KPLIB_fnc_getMilitaryId, [(_count - (_level * (count military_alphabet)))] call KPLIB_fnc_getMilitaryId];
};

_return
