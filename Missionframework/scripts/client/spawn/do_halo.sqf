private [ "_dialog", "_backpack", "_backpackcontents"];

//JTF-V Edit
private _playerCount = count call BIS_fnc_listPlayers;
private _haloLimiter = 10; 

if (_playerCount >= 1 && _playerCount <= 4) then { _haloLimiter = 5; };
if (_playerCount >= 5 && _playerCount <= 8) then { _haloLimiter = 10; };
if (_playerCount >= 9) then { _haloLimiter = 0; };

if ( isNil "GRLIB_last_halo_jump" ) then { GRLIB_last_halo_jump = -6000; };

if (_playerCount >= 9) exitWith { hint format [ localize "STR_HALO_DENIED_PLAYERCOUNT" ] };

if ( _haloLimiter > 1 && ( GRLIB_last_halo_jump + ( _haloLimiter * 60 ) ) >= time ) exitWith {
    hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( GRLIB_last_halo_jump + ( _haloLimiter * 60 ) ) - time ) / 60 ) ];
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
    halo_position = halo_position getPos [random 250, random 360];
    halo_position = [ halo_position select 0, halo_position select 1, GRLIB_halo_altitude + (random 200) ];
    halojumping = true;
    sleep 0.1;
    cutRsc ["fasttravel", "PLAIN", 1];
    playSound "parasound";
    sleep 2;
    _backpack = backpack player;
    if ( _backpack != "" && _backpack != "B_Parachute" ) then {
        _backpackcontents = backpackItems player;
        removeBackpack player;
        sleep 0.1;
    };
    player addBackpack "B_Parachute";

    player setpos halo_position;

    sleep 4;
    halojumping = false;
    waitUntil { !alive player || isTouchingGround player };
    if ( _backpack != "" && _backpack != "B_Parachute" ) then {
        sleep 2;
        player addBackpack _backpack;
        clearAllItemsFromBackpack player;
        { player addItemToBackpack _x } foreach _backpackcontents;
    };
};
