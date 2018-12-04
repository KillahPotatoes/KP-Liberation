params ["_unit", ["_sector", ""]];

_unit setUnitPos "UP";
_unit disableAI "MOVE";
private _move_is_disabled = true;
private _resume_movement = false;

while {_move_is_disabled && local _unit && alive _unit && !(captive _unit)} do {
	private _hostilecount = {alive _x && side _x == GRLIB_side_friendly} count ((getpos _unit) nearEntities [["Man"], 40]);

	if ((_hostilecount > 0) || (damage _unit > 0.25)) then {
		_resume_movement = true;
	};

	if (_sector != "") then {
		if (_sector in blufor_sectors) then {
			_resume_movement = true;
		};
	};

	if (_resume_movement) then {
		if (_move_is_disabled) then {
			_move_is_disabled = false;
			_unit enableAI "MOVE";
			_unit setUnitPos "AUTO";
		};
	};

	if (_move_is_disabled) then {
		private _target = assignedTarget _unit;
		if(!(isnull _target)) then {
			private _vd = (getPosASL _target) vectorDiff (getpos _unit);
			private _newdir = (_vd select 0) atan2 (_vd select 1);
			if (_newdir < 0) then {_dir = 360 + _newdir};
			_unit setdir (_newdir);
		};
	};
	sleep 5;
};
