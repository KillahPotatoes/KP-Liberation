private [ "_tutorial_titles", "_tutorial_pages", "_current_page", "_old_page", "_dialog" ];

if ( isNil "howtoplay" ) then { howtoplay = 0; };

_tutorial_titles = [
    localize "STR_TUTO_TITLE1",
    localize "STR_TUTO_TITLE2",
    localize "STR_TUTO_TITLE3",
    localize "STR_TUTO_TITLE4",
    localize "STR_TUTO_TITLE5",
    localize "STR_TUTO_TITLE6",
    localize "STR_TUTO_TITLE7",
    localize "STR_TUTO_TITLE8",
    localize "STR_TUTO_TITLE9",
    localize "STR_TUTO_TITLE10"
];

_tutorial_pages = [
    "STR_TUTO_TEXT1",
    "STR_TUTO_TEXT2",
    "STR_TUTO_TEXT3",
    "STR_TUTO_TEXT4",
    "STR_TUTO_TEXT5",
    "STR_TUTO_TEXT6",
    "STR_TUTO_TEXT7",
    "STR_TUTO_TEXT8",
    "STR_TUTO_TEXT9",
    "STR_TUTO_TEXT10"
];

_current_page = 0;
_old_page = -99;

while { true } do {
    waitUntil { sleep 0.3; howtoplay == 1 };
    waitUntil { !dialog };
    sleep 0.1;

    _dialog = createDialog "liberation_tutorial";
    if ( !cinematic_camera_started ) then {
        [] spawn cinematic_camera;
    };

    waitUntil { dialog };

    {
        lbAdd [ 513, _x];
    } foreach _tutorial_titles;

    lbSetCurSel [ 513, 0 ];

    while { howtoplay == 1 && alive player && dialog } do {
        _current_page = lbCurSel 513;
        if ( _current_page != _old_page ) then {
            ctrlSetText [ 514, _tutorial_titles select _current_page ];
            ((findDisplay 5353) displayCtrl (515)) ctrlSetStructuredText parseText localize (_tutorial_pages select _current_page);
            _old_page = _current_page;
        };
        sleep 0.2;
    };
    if ( dialog ) then { closeDialog 0 };

    cinematic_camera_started = false;
    howtoplay = 0;
}
