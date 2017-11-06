params ["_sector"];

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] asym_sector_ambush.sqf for %1 spawned on: %2 - Time: %3", markerText _sector, debug_source, time];_text remoteExec ["diag_log",2];};

waitUntil {sleep 1; _sector in KP_liberation_asymmetric_sectors};

private _buildings = [nearestObjects [(markerPos _sector), ["House"], 75], {(alive _x) && !((typeOf _x) in KP_liberation_cr_ign_buildings)}] call BIS_fnc_conditionalSelect;
private _positions = [];
{
	_positions = _positions + ([_x] call BIS_fnc_buildingPositions);
} forEach _buildings;

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] asym_sector_ambush.sqf -> Found %1 suitable buildings in %2 - Time: %3", count _buildings, markerText _sector, time];_text remoteExec ["diag_log",2];};

private _position_indexes = [];
private _position_count = count _positions;
while {count _position_indexes < 10} do {
	private _nextposit = floor (random _position_count);
	if !(_nextposit in _position_indexes) then {
		_position_indexes pushback _nextposit;
	};
};

private _grp = [(markerPos _sector)] call F_spawnGuerillaGroup;
_grp setBehaviour "STEALTH";
private _idxposit = 0;
{
	_x setpos (_positions select (_position_indexes select _idxposit));
	_x setUnitPos "UP";
	doStop _x;

	_idxposit = _idxposit + 1;
} forEach (units _grp);

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] asym_sector_ambush.sqf -> Units spawned in %1 - Time: %2", markerText _sector, time];_text remoteExec ["diag_log",2];};

private _attack = false;

while {(_sector in KP_liberation_asymmetric_sectors) && (!isNull _grp)} do {
	private _blufor_near = {alive _x && side _x == GRLIB_side_friendly} count ((getpos (leader _grp)) nearEntities [["LAND"], 140]);
	if ((_blufor_near > 0) && !_attack) then {
		_attack = true;
		{
			_x setUnitPos "AUTO";
		} forEach (units _grp);
		(units _grp) doFollow (leader _grp);
		_grp setBehaviour "COMBAT";
		_grp setCombatMode "RED"; 
		private _waypoint = _grp addWaypoint [markerpos _sector, 20];
		_waypoint setWaypointType "SAD";
		_waypoint setWaypointSpeed "FULL";
		_waypoint = _grp addWaypoint [markerpos _sector, 150];
		_waypoint setWaypointType "SAD";
		_waypoint = _grp addWaypoint [markerpos _sector, 150];
		_waypoint setWaypointType "SAD";
		_waypoint = _grp addWaypoint [markerpos _sector, 150];
		_waypoint setWaypointType "SAD";
	};
	sleep 1;
};

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] asym_sector_ambush.sqf -> Exit Loop in %1 - Time: %2", markerText _sector, time];_text remoteExec ["diag_log",2];};

sleep 60;

if (!isNull _grp) then {
	{
		if (alive _x) then {
			deleteVehicle _x;
		};
	} forEach (units _grp);
};

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] asym_sector_ambush.sqf -> Ambush dropped in %1 - Time: %2", markerText _sector, time];_text remoteExec ["diag_log",2];};
