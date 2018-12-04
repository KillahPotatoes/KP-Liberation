params ["_squadpos"];

private _spawned_units_local = [];

private _allposts = [nearestObjects [_squadpos, ["Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_Cargo_Patrol_V4_F"], GRLIB_capture_size] , {alive _x}] call BIS_fnc_conditionalSelect;
if (count _allposts > 0) then {
	private _grp = createGroup [GRLIB_side_enemy, true];

	{
		private _building_positions = [_x] call BIS_fnc_buildingPositions;
		private _unitclasspost = opfor_marksman;
		nextunit_post = objNull;
		if (random 100 > 60) then {
			_unitclasspost = opfor_machinegunner;
		};
		_unitclasspost createUnit [_squadpos, _grp, "nextunit_post = this; this addMPEventHandler [""MPKilled"", {_this spawn kill_manager}]"];
		nextunit_post setdir (180 + (getdir _x));
		nextunit_post setpos (_building_positions select 1);

	} forEach _allposts;

	private _totalx = 0;
	private _totaly = 0;

	{
		[_x] spawn building_defence_ai;
		_x setUnitPos 'UP';
		_spawned_units_local pushback _x;
		_totalx = _totalx + ((getpos _x) select 0);
		_totaly = _totaly + ((getpos _x) select 1);
	} forEach (units _grp);

	private _avgx = _totalx / (count (units _grp));
	private _avgy = _totaly / (count (units _grp));

	{
		private _vd = (getPosASL _x) vectorDiff [_avgx, _avgy, (getPosASL _x) select 2];
		private _newdir = (_vd select 0) atan2 (_vd select 1);
		if (_newdir < 0) then {_dir = 360 + _newdir};
		_x setdir (_newdir);
	} forEach (units _grp);

};

_spawned_units_local
