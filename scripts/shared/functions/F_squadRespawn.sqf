private [ "_member_to_respawn" ];

_member_to_respawn = objNull;

{
	if ( isnull _member_to_respawn && !isPlayer _x && alive _x && ( _x distance (getmarkerpos 'respawn')) > 200 &&  (_x distance startbase) > 500 && !(surfaceIsWater (getpos _x)) )then {
		_member_to_respawn = _x;
	}
} foreach (units (group player));

_member_to_respawn
