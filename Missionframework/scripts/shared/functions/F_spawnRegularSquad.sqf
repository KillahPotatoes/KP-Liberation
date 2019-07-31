params [ "_sector", "_squadies_to_spawn" ];

private _sectorpos = (getMarkerPos _sector) getPos [random 100, random 360];

private _spawnpos = zeropos;
while {_spawnpos distance zeropos < 1000} do {
	_spawnpos = (_sectorpos getPos [random 50, random 360]) findEmptyPosition [5, 100, "B_Heli_Light_01_F"];
	if (count _spawnpos == 0) then {_spawnpos = zeropos;};
};

private _corrected_amount = round ((count _squadies_to_spawn) * ([] call F_adaptiveOpforFactor));
private _grp = createGroup [GRLIB_side_enemy, true];

{
	if ((count (units _grp)) < _corrected_amount) then {
		_x createUnit [_spawnpos, _grp, "this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]"];
	};
	sleep 0.1;
} forEach _squadies_to_spawn;

_grp;
