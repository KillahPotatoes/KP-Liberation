params [ "_fob" ];
private [ "_fobindex", "_currentidx", "_fobname" ];

_fobname = "";
_fobindex = -1;
_currentidx = 0;
{
	if ( _x distance _fob < 100 ) then {
		_fobindex = _currentidx;
	};
	_currentidx = _currentidx + 1;
} foreach GRLIB_all_fobs;

_fobname = "";
if ( _fobindex != -1 ) then {
	_fobname = military_alphabet select _fobindex;
};

_fobname