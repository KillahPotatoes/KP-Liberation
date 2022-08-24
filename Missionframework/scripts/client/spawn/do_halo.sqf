private [ "_dialog", "_backpack", "_backpackcontents" ];

if ( isNil "GRLIB_last_halo_jump" ) then { GRLIB_last_halo_jump = -6000; };

if ( GRLIB_halo_param > 1 && ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) >= time ) exitWith {
    hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) - time ) / 60 ) ];
};

_dialog = createDialog "liberation_halo";
dojump = 0;
halo_position = getpos player;

_backpackcontents = [];

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
    "spawn_marker" setMarkerPosLocal halo_position;

    sleep 0.1;
};

if ( dialog ) then {
    closeDialog 0;
    sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";

[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 ) then {
    GRLIB_last_halo_jump = time;

    halojumping = true;
    cutRsc ["fasttravel", "PLAIN", 1];
    playSound "parasound";

    halo_position = halo_position getPos [random 250, random 360];
    halo_position = [ halo_position select 0, halo_position select 1, GRLIB_halo_altitude + (random 200) ];

    _player_pos = getPos player;
    _UnitList = units group player;
    _my_squad = player getVariable ["my_squad", nil];

    if (!isNil "_my_squad") then {
        { _UnitList pushBack _x } forEach units _my_squad;
    };
    
    [player,  halo_position] spawn paraDrop;
    {
        if ( round (_x distance2D _player_pos) <= 30 && lifestate _x != 'INCAPACITATED' && vehicle _x == _x && !(isPlayer _x) ) then {
            [_x,  halo_position] spawn paraDrop;
            sleep (1 + floor(random 3));
        };
    } forEach _UnitList;
};
