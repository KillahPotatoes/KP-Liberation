params [ "_vehicle" ];
private [ "_grp", "_vehcrew" ];

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Spawning militia crew at %1", time];_text remoteExec ["diag_log",2];};

_grp = createGroup GRLIB_side_enemy;
_vehcrew = [];
while { count units _grp < 3 } do {
	( militia_squad call BIS_fnc_selectRandom ) createUnit [ getpos _vehicle, _grp,'this addMPEventHandler [''MPKilled'', {_this spawn kill_manager}]', 0.5, 'private'];
};
((units _grp) select 0) moveInDriver _vehicle;
((units _grp) select 1) moveInGunner _vehicle;
((units _grp) select 2) moveInCommander _vehicle;
{
	if ( vehicle _x == _x ) then {
		deleteVehicle _x;
	} else {
		if ( (typeof _x) in original_resistance) then {
			[ _x ] call loadout_crewman;
		};
	};
} foreach (units _grp);

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Done Spawning militia crew at %1 - Owner: %2", time, debug_source];_text remoteExec ["diag_log",2];};
