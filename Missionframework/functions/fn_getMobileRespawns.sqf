/*
    File: fn_getMobileRespawns.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
private _respawn_trucks_unsorted = vehicles select {
    (typeof _x == Respawn_truck_typename || typeof _x == huron_typename ) &&
    _x distance2d startbase > 500 &&
    !surfaceIsWater (getpos _x) &&
    (isTouchingGround _x || {5 > ((getPos _x) select 2)}) &&
    alive _x &&
    speed _x < 5
};

[_respawn_trucks_unsorted, [], {(getpos _x) select 0}, 'ASCEND'] call BIS_fnc_sortBy
