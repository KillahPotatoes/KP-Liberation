if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Spawning regular squad start at %1", time];_text remoteExec ["diag_log",2];};

params [ "_sector", "_squadies_to_spawn" ];
private [ "_sectorpos", "_spawnpos", "_grp", "_unitidx", "_corrected_amount" ];

_sectorpos = [ getMarkerPos _sector, random 100, random 360 ] call BIS_fnc_relPos;

_spawnpos = zeropos;
while { _spawnpos distance zeropos < 1000 } do {
	_spawnpos = ( [ _sectorpos, random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [5, 100, "B_Heli_Light_01_F"];
	if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
};

_corrected_amount = round ( (count _squadies_to_spawn) * ([] call F_adaptiveOpforFactor) );
_grp = createGroup GRLIB_side_enemy;
{
	if ( ( count units _grp ) < _corrected_amount) then {
		_x createUnit [_spawnpos, _grp,'this addMPEventHandler ["MPKilled", {_this spawn kill_manager}]'];
	};
	sleep 0.1;
} foreach _squadies_to_spawn;

if ( _sector in sectors_capture ) then {
	_unitidx = 0;
	{
		if ( (typeof _x) in original_resistance ) then {
			[ _x ] spawn ( militia_standard_squad select _unitidx );
			if ( random 100 < 40 ) then {
				_x addPrimaryWeaponItem "acc_flashlight";
			};
		};
		_unitidx = _unitidx + 1;
		if ( _unitidx > 9 ) then { _unitidx = 0 };
	} foreach (units _grp);
};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Spawning regular squad done at %1 - Owner: %2", time, debug_source];_text remoteExec ["diag_log",2];};

_grp;
