scriptName "KPLIB_uiManager";

disableSerialization;

private _sectorcontrols = [
    201,    // BG Picture Sector
    202,    // Capture Frame
    203,    // Capture Frame OPFOR
    205,    // Label Point
    244     // Capture Frame BLUFOR
];

KPLIB_ui_notif = "";
KPLIB_supplies = 0;
KPLIB_ammo = 0;
KPLIB_fuel = 0;
KPLIB_b_airControl_near = false;
KPLIB_b_logiStation_near = false;
KPLIB_medical_facilities_near = false;

waitUntil { !isNil "synchro_done" };
waitUntil { synchro_done };

if (isNil "cinematic_camera_started") then {cinematic_camera_started = false;};
if (isNil "halojumping") then {halojumping = false;};

private _uiticks = 0;
private _KPLIB_sectors_active_hint = false;
private _attacked_string = "";
private _nearest_active_sector = "";
private _zone_size = 0;
private _colorzone = "ColorGrey";
private _bar = controlNull;
private _barwidth = 0;

private _overlay = displayNull;
private _overlayVisible = false;
private _showHud = false;
private _showResources = false;
private _currentFob = "";

while {true} do {
    _currentFob = player getVariable ["KPLIB_fobName", ""];
    _showHud = alive player && {!dialog && {isNull curatorCamera && {!cinematic_camera_started && !halojumping}}};
    _visibleMap = visibleMap;

    if (_showHud && {!_overlayVisible}) then {
        "KPLIB_ui" cutRsc ["KPLIB_overlay", "PLAIN", 1];
        _uiticks = 0;
    };
    if (!_showHud && {_overlayVisible}) then {
        "KPLIB_ui" cutText ["", "PLAIN"];
    };

    _overlay = uiNamespace getVariable ["KPLIB_overlay", displayNull];
    _overlayVisible = !isNull _overlay;

    // Player is at FOB
    if (_currentFob != "" || {_visibleMap}) then {
        _showResources = true;

        private _nearestFob = player getVariable "KPLIB_fobPos";
        ([_nearestFob] call KPLIB_fnc_getFobResources) params ["", "_supplies", "_ammo", "_fuel", "_hasAir", "_hasRecycling", "_hasMedical"];

        if (KPLIB_resources_global || {_visibleMap}) then {
            // Overwrite FOB name in global mode
            _currentFob = localize "STR_RESOURCE_GLOBAL";

            KPLIB_supplies = KPLIB_supplies_global;
            KPLIB_ammo = KPLIB_ammo_global;
            KPLIB_fuel = KPLIB_fuel_global;
        } else {
            KPLIB_supplies = _supplies;
            KPLIB_ammo = _ammo;
            KPLIB_fuel = _fuel;
        };
        // TODO this is used by build scripts, move to relevant places
        KPLIB_b_airControl_near = _hasAir;
        KPLIB_b_logiStation_near = _hasRecycling;
        KPLIB_medical_facilities_near = _hasMedical;
    } else {
        _showResources = false;
        KPLIB_supplies = 0;
        KPLIB_ammo = 0;
        KPLIB_fuel = 0;
        KPLIB_b_airControl_near = false;
        KPLIB_b_logiStation_near = false;
        KPLIB_medical_facilities_near = false;
    };

    if (_overlayVisible) then {

        (_overlay displayCtrl (266)) ctrlSetText format [ "%1", KPLIB_ui_notif ];
        (_overlay displayCtrl (267)) ctrlSetText format [ "%1", KPLIB_ui_notif ];

        if ((markerPos "opfor_capture_marker") distance markers_reset > 100 ) then {

            private [ "_attacked_string" ];
            _attacked_string = [markerpos "opfor_capture_marker"] call KPLIB_fnc_getLocationName;

            (_overlay displayCtrl (401)) ctrlShow true;
            (_overlay displayCtrl (402)) ctrlSetText _attacked_string;
            (_overlay displayCtrl (403)) ctrlSetText (markerText "opfor_capture_marker");
        } else {
            (_overlay displayCtrl (401)) ctrlShow false;
            (_overlay displayCtrl (402)) ctrlSetText "";
            (_overlay displayCtrl (403)) ctrlSetText "";
        };

        // Update resources overlay
        [
            _overlay,
            _showResources,
            _uiticks % 5 == 0,  // update values
            _currentFob         // area title
        ] call KPLIB_fnc_overlayUpdateResources;

        if (_uiticks % 25 == 0) then {

            if (!isNil "KPLIB_sectors_active" && ([] call KPLIB_fnc_getOpforCap >= KPLIB_cap_enemySide)) then {

                (_overlay displayCtrl (517)) ctrlShow true;

                if (!_KPLIB_sectors_active_hint) then {
                    hint localize "STR_OVERLOAD_HINT";
                    _KPLIB_sectors_active_hint = true;
                };

                _KPLIB_sectors_active_string = "<t align='right' color='#e0e000'>" + (localize "STR_ACTIVE_SECTORS") + "<br/>";
                {
                    _KPLIB_sectors_active_string = [_KPLIB_sectors_active_string, markerText _x, "<br/>"] joinString "";
                } forEach KPLIB_sectors_active;
                _KPLIB_sectors_active_string = [_KPLIB_sectors_active_string, "</t>"] joinString "";
                (_overlay displayCtrl (516)) ctrlSetStructuredText parseText _KPLIB_sectors_active_string;

            } else {
                (_overlay displayCtrl (516)) ctrlSetStructuredText parseText " ";
                (_overlay displayCtrl (517)) ctrlShow false;
            };

            _nearest_active_sector = [KPLIB_range_sectorActivation] call KPLIB_fnc_getNearestSector;
            if ( _nearest_active_sector != "" ) then {
                _zone_size = KPLIB_range_sectorCapture;
                if ( _nearest_active_sector in KPLIB_sectors_capital ) then {
                    _zone_size = KPLIB_range_sectorCapture * 1.4;
                };

                "zone_capture" setmarkerposlocal (markerpos _nearest_active_sector);
                _colorzone = "ColorGrey";
                private _sectorOwner = [markerPos _nearest_active_sector, _zone_size] call KPLIB_fnc_getSectorOwnership;
                if ( _sectorOwner == KPLIB_side_player ) then { _colorzone = KPLIB_color_player };
                if ( _sectorOwner == KPLIB_side_enemy ) then { _colorzone = KPLIB_color_enemy };
                if ( _sectorOwner == KPLIB_side_resistance ) then { _colorzone = "ColorCivilian" };
                "zone_capture" setmarkercolorlocal _colorzone;

                _ratio = [_nearest_active_sector] call KPLIB_fnc_getBluforRatio;
                _barwidth = 0.084 * safezoneW * _ratio;
                _bar = _overlay displayCtrl (244);
                _bar ctrlSetPosition [(ctrlPosition _bar) select 0,(ctrlPosition _bar) select 1,_barwidth,(ctrlPosition _bar) select 3];
                _bar ctrlCommit ([0, 2] select ctrlShown _bar);

                (_overlay displayCtrl (205)) ctrlSetText (markerText _nearest_active_sector);
                {(_overlay displayCtrl (_x)) ctrlShow true;} forEach _sectorcontrols;
                if (_nearest_active_sector in KPLIB_sectors_player) then {
                    (_overlay displayCtrl (205)) ctrlSetTextColor [0,0.3,1.0,1];
                } else {
                    (_overlay displayCtrl (205)) ctrlSetTextColor [0.85,0,0,1];
                };

                "zone_capture" setMarkerSizeLocal [ _zone_size,_zone_size ];
            } else {
                {(_overlay displayCtrl (_x)) ctrlShow false;} forEach _sectorcontrols;
                "zone_capture" setmarkerposlocal markers_reset;
            };
        };
    };

    _uiticks = _uiticks + 1;
    if (_uiticks > 1000) then {_uiticks = 0;};
    uiSleep 0.25;
};
