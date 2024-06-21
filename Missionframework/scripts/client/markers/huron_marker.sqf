scriptName "huron_marker";

private [ "_huronlocal" ];

"huronmarker" setMarkerTextLocal localize "STR_HURON01_NAME";

while { true } do {
    _huronlocal = [] call KPLIB_fnc_potatoScan;
    if ( !( isNull _huronlocal) ) then {
        "huronmarker" setmarkerposlocal (getpos _huronlocal);
    } else {
        "huronmarker" setmarkerposlocal markers_reset;
    };
    sleep 4.9;
};
