if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Spawning building squad at %1", time];_text remoteExec ["diag_log",2];};

params [ "_infsquad", "_building_ai_max", "_buildingpositions", "_sectorpos", [ "_sector", "" ] ];
private [ "_squadtospawnnn", "_infsquad_classnames", "_usedposits", "_nextposit", "_remainingposits", "_grp", "_everythingspawned", "_nextunit", "_position_indexes", "_position_count", "_idxposit", "_groupunitscount" ];

_everythingspawned = [];

_infsquad_classnames = [];
if ( _infsquad == "militia" ) then {
	_infsquad_classnames = militia_squad;
} else {
	_infsquad_classnames = ([] call F_getAdaptiveSquadComp);
};

if ( _building_ai_max > floor ((count _buildingpositions) * GRLIB_defended_buildingpos_part)) then { _building_ai_max = floor ((count _buildingpositions) * GRLIB_defended_buildingpos_part)};
_squadtospawnnn = [];
while { (count _squadtospawnnn) < _building_ai_max } do { _squadtospawnnn pushback ( _infsquad_classnames call BIS_fnc_selectRandom ); };

_position_indexes = [];
_position_count = count _buildingpositions;
while { count _position_indexes < count _squadtospawnnn } do {
	_nextposit = floor (random _position_count);
	if ( !(_nextposit in _position_indexes) ) then {
		_position_indexes pushback _nextposit;
	}
};

_grp = createGroup GRLIB_side_enemy;
_idxposit = 0;
{
	_x createUnit [ _sectorpos, _grp ];
	_nextunit = (units _grp) select ((count (units _grp)) -1);
	_nextunit addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
	_nextunit setpos (_buildingpositions select (_position_indexes select _idxposit));
	_nextunit setdir (random 360);
	[ _nextunit, _sector ] spawn building_defence_ai;
	if ( _infsquad == "militia" ) then {
		if ( (typeof _nextunit) in original_resistance ) then {
			[ _nextunit ] spawn ( militia_standard_squad call BIS_fnc_selectRandom );
			if ( random 100 < 40 ) then {
				_nextunit addPrimaryWeaponItem "acc_flashlight";
			};
		};
	};

	_idxposit = _idxposit + 1;

	if ( count units _grp > 10 ) then {
		_everythingspawned = _everythingspawned + (units _grp);
		_grp = createGroup GRLIB_side_enemy;
	};
} foreach _squadtospawnnn;

if ( !(isNull _grp)) then {
	_everythingspawned = _everythingspawned + (units _grp);
};

if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Done Spawning building squad at %1 - Owner: %2", time, debug_source];_text remoteExec ["diag_log",2];};

_everythingspawned