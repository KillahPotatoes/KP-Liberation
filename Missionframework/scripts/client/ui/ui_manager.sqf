disableSerialization;

private [ "_overlayshown", "_sectorcontrols", "_resourcescontrols", "_active_sectors_hint", "_uiticks", "_attacked_string", "_active_sectors_string", "_color_readiness", "_nearest_active_sector", "_zone_size", "_colorzone", "_bar", "_barwidth", "_first_iteration", "_distfob", "_nearfob", "_fobdistance", "_resources", "_notNearFOB", "_resource_area"];

_overlayshown = false;
_sectorcontrols = [201,202,203,244,205];
_resourcescontrols = [101,102,103,104,105,106,107,108,109,135,758001,758002,758003,758004,758005,758006,758007,758008,758009,758010,758011,758012,758020,758021,758022,758023,758024,758025];
_active_sectors_hint = false;
_first_iteration = true;
_distfob = 100;
_notNearFOB = false;
_resource_area = "";
GRLIB_ui_notif = "";
KP_liberation_supplies = 0;
KP_liberation_ammo = 0;
KP_liberation_fuel = 0;
KP_liberation_air_vehicle_building_near = false;
KP_liberation_recycle_building_near = false;

_uiticks = 0;

waitUntil { !isNil "synchro_done" };
waitUntil { synchro_done };

if ( isNil "cinematic_camera_started" ) then { cinematic_camera_started = false };
if ( isNil "halojumping" ) then { halojumping = false };

while { true } do {

	if ( isNull ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (101)) && _overlayshown ) then {
		_overlayshown = false;
		_first_iteration = true;

	};
	if ( alive player && !dialog && !_overlayshown && !cinematic_camera_started && !halojumping ) then {
		cutRsc["statusoverlay", "PLAIN", 1];
		_overlayshown = true;
		_first_iteration = true;
		_uiticks = 0;
	};
	if ( ( !alive player || dialog || cinematic_camera_started ) && _overlayshown) then {
		cutRsc["blank", "PLAIN", 0];
		_overlayshown = false;
		_first_iteration = true;
	};
	
	_nearfob = [] call F_getNearestFob;
	_fobdistance = 9999;
	_actual_fob = [];
	if ( count _nearfob == 3 ) then {
		_fobdistance = player distance _nearfob;
		_actual_fob = [KP_liberation_fob_resources, {((_x select 0) distance _nearfob) < GRLIB_fob_range}] call BIS_fnc_conditionalSelect;
	};
	
	if (_fobdistance < _distfob) then {
		_resources = true;
		if (KP_liberation_resources_global) then {
			_resource_area = localize "STR_RESOURCE_GLOBAL";
			KP_liberation_supplies = KP_liberation_supplies_global;
			KP_liberation_ammo = KP_liberation_ammo_global;
			KP_liberation_fuel = KP_liberation_fuel_global;	
		} else {
			_resource_area = toUpper ([_nearfob] call F_getFobName);
			KP_liberation_supplies = ((_actual_fob select 0) select 1);
			KP_liberation_ammo = ((_actual_fob select 0) select 2);
			KP_liberation_fuel = ((_actual_fob select 0) select 3);	
		};
		KP_liberation_air_vehicle_building_near = ((_actual_fob select 0) select 4);
		KP_liberation_recycle_building_near = ((_actual_fob select 0) select 5);
	} else {
		_resources = false;
		KP_liberation_supplies = 0;
		KP_liberation_ammo = 0;
		KP_liberation_fuel = 0;
		KP_liberation_air_vehicle_building_near = false;
		KP_liberation_recycle_building_near = false;
	};
	
	if ( _overlayshown) then {

		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (266)) ctrlSetText format [ "%1", GRLIB_ui_notif ];
		((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (267)) ctrlSetText format [ "%1", GRLIB_ui_notif ];

		if ((getmarkerpos "opfor_capture_marker") distance markers_reset > 100 ) then {

			private [ "_attacked_string" ];
			_attacked_string = [ markerpos "opfor_capture_marker" ] call F_getLocationName;

			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (401)) ctrlShow true;
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (402)) ctrlSetText _attacked_string;
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (403)) ctrlSetText (markerText "opfor_capture_marker");
		} else {
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (401)) ctrlShow false;
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (402)) ctrlSetText "";
			((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (403)) ctrlSetText "";
		};

		if (_resources) then {
			{((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x)) ctrlShow true;} foreach  _resourcescontrols;
			// Fix for small script error that variables will be "any" for a second after an FOB has been build
			if (isNil "KP_liberation_supplies") then {KP_liberation_supplies = 0;};
			if (isNil "KP_liberation_ammo") then {KP_liberation_ammo = 0;};
			if (isNil "KP_liberation_fuel") then {KP_liberation_fuel = 0;};
			
			if ((_uiticks % 5 == 0) || _notNearFOB) then {

				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (101)) ctrlSetText format ["%1", (floor KP_liberation_supplies)];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (102)) ctrlSetText format ["%1", (floor KP_liberation_ammo)];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (103)) ctrlSetText format ["%1", (floor KP_liberation_fuel)];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (104)) ctrlSetText format ["%1/%2", unitcap,([] call F_localCap)];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (105)) ctrlSetText format ["%1%2", round(combat_readiness),"%"];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (106)) ctrlSetText format ["%1", round(resources_intel)];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (107)) ctrlSetText format ["%1/%2", KP_liberation_heli_count, KP_liberation_heli_slots];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (108)) ctrlSetText format ["%1/%2", KP_liberation_plane_count, KP_liberation_plane_slots];
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (109)) ctrlSetText format ["%1", _resource_area];

				_color_readiness = [0.8,0.8,0.8,1];
				if ( combat_readiness >= 25 ) then { _color_readiness = [0.8,0.8,0,1] };
				if ( combat_readiness >= 50 ) then { _color_readiness = [0.8,0.6,0,1] };
				if ( combat_readiness >= 75 ) then { _color_readiness = [0.8,0.3,0,1] };
				if ( combat_readiness >= 100 ) then { _color_readiness = [0.8,0,0,1] };

				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (105)) ctrlSetTextColor _color_readiness;
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (135)) ctrlSetTextColor _color_readiness;
				_notNearFOB = false;

			};
		} else {
			{((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x)) ctrlShow false;} foreach  _resourcescontrols;
			_notNearFOB = true;
		};
		
		if ( _uiticks % 25 == 0 ) then {

			if (!isNil "active_sectors" && ( [] call F_opforCap >= GRLIB_sector_cap)) then {

				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (517)) ctrlShow true;

				if ( !_active_sectors_hint ) then {
					hint localize "STR_OVERLOAD_HINT";
					_active_sectors_hint = true;
				};

				_active_sectors_string = "<t align='right' color='#e0e000'>" + (localize "STR_ACTIVE_SECTORS") + "<br/>";
				{
					_active_sectors_string = _active_sectors_string + (markertext _x) + "<br/>";
				} foreach active_sectors;
				_active_sectors_string = _active_sectors_string + "</t>";
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (516)) ctrlSetStructuredText parseText _active_sectors_string;

			} else {
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (516)) ctrlSetStructuredText parseText " ";
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (517)) ctrlShow false;
			};

			_nearest_active_sector = [ GRLIB_sector_size ] call F_getNearestSector;
			if ( _nearest_active_sector != "" ) then {
				_zone_size = GRLIB_capture_size;
				if ( _nearest_active_sector in sectors_bigtown ) then {
					_zone_size = GRLIB_capture_size * 1.4;
				};

				"zone_capture" setmarkerposlocal (markerpos _nearest_active_sector);
				_colorzone = "ColorGrey";
				if ( [ markerpos _nearest_active_sector, _zone_size ] call F_sectorOwnership == GRLIB_side_friendly ) then { _colorzone = GRLIB_color_friendly };
				if ( [ markerpos _nearest_active_sector, _zone_size ] call F_sectorOwnership == GRLIB_side_enemy ) then { _colorzone = GRLIB_color_enemy };
				if ( [ markerpos _nearest_active_sector, _zone_size ] call F_sectorOwnership == GRLIB_side_resistance ) then { _colorzone = "ColorCivilian" };
				"zone_capture" setmarkercolorlocal _colorzone;

				_ratio = [_nearest_active_sector] call F_getForceRatio;
				_barwidth = 0.084 * safezoneW * _ratio;
				_bar = (uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (244);
				_bar ctrlSetPosition [(ctrlPosition _bar) select 0,(ctrlPosition _bar) select 1,_barwidth,(ctrlPosition _bar) select 3];
				if ( _first_iteration ) then {
					_first_iteration = false;
					_bar ctrlCommit 0;
				} else {
					_bar ctrlCommit 2;
				};
				((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (205)) ctrlSetText (markerText _nearest_active_sector);
				{ ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x)) ctrlShow true; } foreach  _sectorcontrols;
				if ( _nearest_active_sector in blufor_sectors ) then {
					((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (205)) ctrlSetTextColor [0,0.3,1.0,1];
				} else {
					((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (205)) ctrlSetTextColor [0.85,0,0,1];
				};

				"zone_capture" setMarkerSizeLocal [ _zone_size,_zone_size ];
			} else {
				{ ((uiNamespace getVariable 'GUI_OVERLAY') displayCtrl (_x)) ctrlShow false; } foreach  _sectorcontrols;
				"zone_capture" setmarkerposlocal markers_reset;
			};
		};

	};
	_uiticks = _uiticks + 1;
	if ( _uiticks > 1000 ) then { _uiticks = 0 };
	uiSleep 0.25;
};