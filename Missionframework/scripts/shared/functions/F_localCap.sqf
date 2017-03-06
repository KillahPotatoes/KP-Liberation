private [ "_unitcap_local" ];

_unitcap_local = (round (infantry_cap / 2));
if ( _unitcap_local > GRLIB_blufor_cap ) then {
	_unitcap_local = GRLIB_blufor_cap;
};

_unitcap_local
