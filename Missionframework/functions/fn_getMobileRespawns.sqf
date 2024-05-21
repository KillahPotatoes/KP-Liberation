/*
    File: fn_getMobileRespawns.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2020-05-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Gets all mobile respawn vehicles sorted by their positions X value.

    Parameter(s):
        NONE

    Returns:
        Mobile respawns [ARRAY]
*/

private _respawn_trucks = vehicles select {
    (typeOf _x) in [KPLIB_b_mobileRespawn, KPLIB_b_potato01] &&
    {alive _x} &&
    {_x distance2d startbase > 500} &&
    {abs (speed _x) < 5} &&
    {(isTouchingGround _x || {5 > ((getPos _x) select 2)})} &&
    {!surfaceIsWater (getPos _x)}
};

[_respawn_trucks, [], {(getPos _x) select 0}, 'ASCEND'] call BIS_fnc_sortBy
