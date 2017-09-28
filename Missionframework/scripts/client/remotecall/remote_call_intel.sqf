if (isDedicated) exitWith {};

params ["_notiftype", ["_obj_position", getpos player]];

switch (_notiftype) do {
	case 0: {["lib_intel_prisoner"] call BIS_fnc_showNotification;};
	case 1: {["lib_intel_document"] call BIS_fnc_showNotification;};
	case 2: {
		waitUntil {!isNil "secondary_objective_position_marker"};
		waitUntil {count secondary_objective_position_marker > 0};
		waitUntil {secondary_objective_position_marker distance zeropos > 1000};
		["lib_intel_fob", [markertext ([10000, secondary_objective_position_marker] call F_getNearestSector)]] call BIS_fnc_showNotification;
		_secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
		_secondary_marker setMarkerColorLocal GRLIB_color_enemy_bright;
		_secondary_marker setMarkerTypeLocal "hd_unknown";

		_secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
		_secondary_marker_zone setMarkerColorLocal GRLIB_color_enemy_bright;
		_secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
		_secondary_marker_zone setMarkerBrushLocal "FDiagonal";
		_secondary_marker_zone setMarkerSizeLocal [1500,1500];
	};
	case 3: {
		["lib_secondary_fob_destroyed"] call BIS_fnc_showNotification;
		deleteMarkerLocal "secondarymarker";
		deleteMarkerLocal "secondarymarkerzone";
		secondary_objective_position_marker = [];
	};
	case 4: {["lib_intel_convoy", [markertext ([10000, _obj_position] call F_getNearestSector)]] call BIS_fnc_showNotification;};
	case 5: {["lib_secondary_convoy_destroyed"] call BIS_fnc_showNotification;};
	case 6: {
		waitUntil {!isNil "secondary_objective_position_marker"};
		waitUntil {count secondary_objective_position_marker > 0};
		waitUntil {secondary_objective_position_marker distance zeropos > 1000};
		["lib_intel_sar", [markertext ([10000, secondary_objective_position_marker] call F_getNearestSector)]] call BIS_fnc_showNotification;
		_secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
		_secondary_marker setMarkerColorLocal GRLIB_color_enemy_bright;
		_secondary_marker setMarkerTypeLocal "hd_unknown";

		_secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
		_secondary_marker_zone setMarkerColorLocal GRLIB_color_enemy_bright;
		_secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
		_secondary_marker_zone setMarkerBrushLocal "FDiagonal";
		_secondary_marker_zone setMarkerSizeLocal [1500,1500];
	};
	case 7: {
		["lib_intel_sar_failed"] call BIS_fnc_showNotification;
		deleteMarkerLocal "secondarymarker";
		deleteMarkerLocal "secondarymarkerzone";
		secondary_objective_position_marker = [];
	};
	case 8: {
		["lib_intel_sar_succeeded"] call BIS_fnc_showNotification;
		deleteMarkerLocal "secondarymarker";
		deleteMarkerLocal "secondarymarkerzone";
		secondary_objective_position_marker = [];
	};
	case 9: {
		["lib_civ_informant_start", [markertext ([10000, _obj_position] call F_getNearestSector)]] call BIS_fnc_showNotification;
		_informant_marker = createMarkerLocal ["informantmarker", _obj_position];
		_informant_marker setMarkerColorLocal "ColorCIV";
		_informant_marker setMarkerTypeLocal "mil_unknown";
	};
	case 10: {
		["lib_civ_informant_success"] call BIS_fnc_showNotification;
		deleteMarkerLocal "informantmarker";
	};
	case 11: {
		["lib_civ_informant_fail"] call BIS_fnc_showNotification;
		deleteMarkerLocal "informantmarker";
	};
	case 12: {
		["lib_civ_informant_death"] call BIS_fnc_showNotification;
		deleteMarkerLocal "informantmarker";
	};
	default {};
};
