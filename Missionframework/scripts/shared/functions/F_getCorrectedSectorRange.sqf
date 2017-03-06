params [ "_opforcount" ];
private [ "_corrected_sector_size" ];

if ( _opforcount < 0.5 * GRLIB_sector_cap ) then {
	_corrected_sector_size = GRLIB_sector_size;
} else {
	if ( _opforcount <= GRLIB_sector_cap ) then {
		_corrected_sector_size = GRLIB_sector_size - ( GRLIB_sector_size * 0.5 * (( _opforcount / GRLIB_sector_cap ) - 0.5));
	} else {
		_corrected_sector_size = GRLIB_sector_size * 0.75;
	};
};

_corrected_sector_size