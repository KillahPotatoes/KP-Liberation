private [ "_huronlocal" ];

"huronmarker" setMarkerTextLocal "Potato 01";

while { true } do {
	_huronlocal = [] call F_spartanScan;
	if ( !( isNull _huronlocal) ) then {
		"huronmarker" setmarkerposlocal (getpos _huronlocal);
	} else {
		"huronmarker" setmarkerposlocal markers_reset;
	};
	sleep 4.9;
};
