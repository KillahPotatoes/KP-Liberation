private _respawn_trucks_unsorted = vehicles select {
    (typeof _x == Respawn_truck_typename || typeof _x == huron_typename ) &&
    _x distance2d startbase > 500 &&
    !surfaceIsWater (getpos _x) &&
    isTouchingGround _x &&
    alive _x &&
    speed _x < 5
};

[_respawn_trucks_unsorted, [], {(getpos _x) select 0}, 'ASCEND'] call BIS_fnc_sortBy
