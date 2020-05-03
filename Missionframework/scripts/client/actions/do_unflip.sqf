params [ "_veh" ];

if ( !isNull _veh ) then {
    _veh setpos [(getpos _veh) select 0,(getpos _veh) select 1, 0.5];
    _veh setVectorUp surfaceNormal position _veh;
};
