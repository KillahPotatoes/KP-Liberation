/*
    File: fn_getNearestFob.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2020-05-17
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the nearest FOB position to given position.

    Parameter(s):
        _pos - Position to find the nearest FOB from [POSITION, defaults to getPos player]

    Returns:
        Nearest FOB position [POSITION]
*/

params [
    ["_pos", getPos player, [[]], [2, 3]]
];

if !(KPLIB_sectors_fob isEqualTo []) then {
    private _fobs = KPLIB_sectors_fob apply {[_pos distance2d _x, _x]};
    _fobs sort true;
    (_fobs select 0) select 1
} else {
    []
};
