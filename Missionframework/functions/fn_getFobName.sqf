/*
    File: fn_getFobName.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-04-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the FOB name in accordance to the military alphabet set in init presets.

    Parameter(s):
        _fob - Position of FOB to get the name from [POSITION, defaults to [0, 0, 0]]

    Returns:
        FOB name [STRING]
*/

params [
    ["_fob", [0, 0, 0], [[]], [2, 3]]
];

military_alphabet param [GRLIB_all_fobs findIf {(_x distance2d _fob) < 100}, ""]
