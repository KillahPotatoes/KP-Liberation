/*
    File: fn_getUnitsCount.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2023-05-11
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets the amount of units of given side inside given radius of given position.

    Parameter(s):
        _pos - Description [POSITION, defaults to [0, 0, 0]
        _radius - Description [NUMBER, defaults to 100]
        _side - Description [SIDE, defaults to KPLIB_side_player]

    Returns:
        Amount of units [NUMBER]
*/

params [
    ["_pos", [0, 0, 0], [[]], [2, 3]],
    ["_radius", 100, [0]],
    ["_side", KPLIB_side_player, [sideEmpty]]
];

private _amount = _side countSide ((_pos nearEntities ["CAManBase", _radius]) select {!(captive _x) && ((getpos _x) select 2 < 500) && lifeState _x != "INCAPACITATED"});
{
    _amount = _amount + (_side countSide (crew _x));
} forEach ((_pos nearEntities [["Car", "Tank", "Air", "Ship"], _radius]) select {((getpos _x) select 2 < 500) && count (crew _x) > 0});

_amount
