/*
    File: fn_getNearbyPlayers.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-12-05
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets all alive players inside given radius to given position.

    Parameter(s):
        _pos    - Center position to search from                [POSITION, defaults to [0, 0, 0]]
        _radius - Radius from center position to search from    [NUMBER, defaults to 100]

    Returns:
        Nearby alive players [ARRAY]
*/

params [
    ["_pos", [0, 0, 0], [[2, 3]]],
    ["_radius", 100, [0]]
];

allPlayers select {alive _x && {(_x distance2d _pos) < _radius}}
