params ["_mindist", "_maxdist", "_try_nearest", ["_spawn_target", ""]];

private _increment = 500;
private _opfor_spawn_point = "";
private _all_possible_sectors = sectors_opfor;
private _filtered_possible_sectors = [];

{
	private _current_sector = _x;
	private _accept_current_sector = true;
	private _current_sector_distance = 99999;

	if (!isNil "secondary_objective_position") then {
		if (count secondary_objective_position != 0) then {
			if (((markerpos _current_sector) distance secondary_objective_position) < 500) then {
				_accept_current_sector = false;
			};
		};
	};

	if (!isNil "used_positions") then {
		if (_current_sector in used_positions) then {
			_accept_current_sector = false;
		};
	};

	{
		if (((markerpos _current_sector) distance _x) < _mindist) then {
			_accept_current_sector = false;
		} else {
			if (((markerpos _current_sector) distance (_x)) < _current_sector_distance) then {
				_current_sector_distance = ((markerpos _current_sector ) distance (_x));
			};
		};
	} forEach GRLIB_all_fobs;

	if (_accept_current_sector) then {
		{
			if (((markerpos _current_sector) distance (markerpos _x)) < _mindist ) then {
				_accept_current_sector = false;
			} else {
				if (((markerpos _current_sector) distance (markerpos _x)) < _current_sector_distance) then {
					_current_sector_distance = ((markerpos _current_sector) distance (markerpos _x));
				};
			};
		} forEach blufor_sectors;
	};

	if (_accept_current_sector) then {
		private _one_opfor_sector_in_range = false;
		{
			if (((markerpos _current_sector) distance (markerpos _x)) < 2000) exitWith {_one_opfor_sector_in_range = true;}
		} forEach (sectors_allSectors - blufor_sectors);
		_accept_current_sector = _one_opfor_sector_in_range;
	};

	if (_accept_current_sector) then {
		if (([markerpos _current_sector, _mindist, GRLIB_side_friendly] call F_getUnitsCount) != 0) then {
			_accept_current_sector = false;
		};
	};

	if (_accept_current_sector) then {
		_filtered_possible_sectors pushback [_current_sector,_current_sector_distance];
	};
} forEach _all_possible_sectors;

if (count _filtered_possible_sectors != 0) then {

	private _nearest_possible_sectors = [];

	if (_try_nearest) then {
		private _maxsearchdist = _mindist + _increment;
		while {(count _nearest_possible_sectors == 0) && (_maxsearchdist <= _maxdist)} do {
			{
				_nextsector = _x select 0;
				_nextdistance = _x select 1;
				if (_nextdistance < _maxsearchdist) exitWith {_nearest_possible_sectors pushback _nextsector;};
			} forEach _filtered_possible_sectors;
			_maxsearchdist = _maxsearchdist + _increment;
		};
	} else {
		{
			_nextsector = _x select 0;
			_nextdistance = _x select 1;
			if (_nextdistance < _maxdist) then {
				_nearest_possible_sectors pushback _nextsector;
			};
		} foreach _filtered_possible_sectors;
	};

	if (count _nearest_possible_sectors != 0) then {
		if (_spawn_target == "") then {
			_opfor_spawn_point = _nearest_possible_sectors select (floor (random (count _nearest_possible_sectors)));
		} else {
			_opfor_spawn_point = ([_nearest_possible_sectors, [_spawn_target] , {(getmarkerpos _input0) distance (getmarkerpos _x)} , "ASCEND"] call BIS_fnc_sortBy) select 0;
		};
	} else {
		diag_log "[KP LIBERATION] [WARNING] No opfor spawn point found";
	};
};

_opfor_spawn_point
