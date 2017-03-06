params [ "_mindist", "_maxdist", "_try_nearest", ["_spawn_target", ""] ];
private [ "_increment", "_opfor_spawn_point", "_all_possible_sectors", "_filtered_possible_sectors", "_current_sector", "_accept_current_sector", "_current_sector_distance", "_nearest_possible_sectors" ];

_increment = 500;
_opfor_spawn_point = '';
_all_possible_sectors = sectors_opfor;
_filtered_possible_sectors = [];

{
	_current_sector = _x;
	_accept_current_sector = true;
	_current_sector_distance = 99999;

	if ( !isNil 'secondary_objective_position' ) then {
		if ( count secondary_objective_position != 0 ) then {
			if ( (( markerpos _current_sector ) distance secondary_objective_position) < 500 ) then {
				_accept_current_sector = false;
			};
		};
	};

	if ( !isNil 'used_positions' ) then {
		if ( _current_sector in used_positions ) then {
			_accept_current_sector = false;
		};
	};

	{
		if ( (( markerpos _current_sector ) distance _x) < _mindist ) then {
			_accept_current_sector = false;
		} else {
			if ( (( markerpos _current_sector ) distance (_x)) < _current_sector_distance ) then {
				_current_sector_distance = (( markerpos _current_sector ) distance (_x));
			};
		};
	} foreach GRLIB_all_fobs;

	if ( _accept_current_sector ) then {
		{
			if ( (( markerpos _current_sector ) distance (markerpos _x)) < _mindist ) then {
				_accept_current_sector = false;
			} else {
				if ( (( markerpos _current_sector ) distance (markerpos _x)) < _current_sector_distance ) then {
					_current_sector_distance = (( markerpos _current_sector ) distance (markerpos _x));
				};
			};
		} foreach blufor_sectors;
	};

	if ( _accept_current_sector ) then {
		_one_opfor_sector_in_range = false;
		{
			if ( (( markerpos _current_sector ) distance (markerpos _x)) < 2000 ) then {
				_one_opfor_sector_in_range = true;
			}
		} foreach (sectors_allSectors - blufor_sectors);
		_accept_current_sector = _one_opfor_sector_in_range;
	};

	if ( _accept_current_sector ) then {
		if ( ( [markerpos _current_sector, _mindist, GRLIB_side_friendly ] call F_getUnitsCount ) != 0 ) then {
			_accept_current_sector = false;
		};
	};

	if (_accept_current_sector) then {
		_filtered_possible_sectors pushback [_current_sector,_current_sector_distance];
	};
} foreach _all_possible_sectors;

if ( count _filtered_possible_sectors != 0 ) then {

	_nearest_possible_sectors = [];

	if ( _try_nearest ) then {
		_maxsearchdist = _mindist + _increment;
		while { (count _nearest_possible_sectors == 0) && (_maxsearchdist <= _maxdist) } do {
			{
				_nextsector = _x select 0;
				_nextdistance = _x select 1;
				if ( _nextdistance < _maxsearchdist ) then {
					_nearest_possible_sectors pushback _nextsector;
				};
			} foreach _filtered_possible_sectors;
			_maxsearchdist = _maxsearchdist + _increment;
		};
	} else {
		{
			_nextsector = _x select 0;
			_nextdistance = _x select 1;
			if ( _nextdistance < _maxdist ) then {
				_nearest_possible_sectors pushback _nextsector;
			};
		} foreach _filtered_possible_sectors;
	};

	if ( count _nearest_possible_sectors != 0 ) then {
		if ( _spawn_target == '' ) then {
			_opfor_spawn_point = _nearest_possible_sectors select (floor (random (count _nearest_possible_sectors)));
		} else {
			_opfor_spawn_point = ( [ _nearest_possible_sectors , [ _spawn_target ] , { ( getmarkerpos _input0 ) distance ( getmarkerpos _x ) } , 'ASCEND' ] call BIS_fnc_sortBy ) select 0;
		};
	};
};

_opfor_spawn_point
