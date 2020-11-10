/*
    File: fn_getNearestTower.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-06
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets nearest radio tower marker occupied by given side inside given radius from given position.

    Parameter(s):
        _pos    - Position from which to look for the nearest radio tower   [POSITION, defaults to [0, 0, 0]]
        _side   - Side of owner for nearest radio tower                     [SIDE, defaults to GRLIB_side_enemy]
        _radius - Radius in which to look for the nearest radio tower       [NUMBER, defaults to 1000]

    Returns:
        Marker of nearest radio tower [STRING]
*/

params [
    ["_pos", [0, 0, 0], [[]], [2, 3]],
    ["_side", GRLIB_side_enemy, [sideEmpty]],
    ["_radius", 1000, [0]]
];

private _towers = [sectors_tower select {_x in blufor_sectors}, sectors_tower - blufor_sectors] select (_side == GRLIB_side_enemy);
_towers = (_towers apply {[(markerPos _x) distance2d _pos, _x]}) select {(_x select 0) <= _radius};
_towers sort true;

(_towers select 0) select 1
