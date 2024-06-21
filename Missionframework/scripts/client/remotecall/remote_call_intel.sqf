scriptName "remote_call_intel";

if (isDedicated) exitWith {};

params ["_notiftype", ["_obj_position", getpos player]];

switch (_notiftype) do {
    case 0: {["lib_intel_prisoner"] call BIS_fnc_showNotification;};
    case 1: {["lib_intel_document"] call BIS_fnc_showNotification;};
    case 2: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_fob", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal KPLIB_color_enemyActive;
        _secondary_marker setMarkerTypeLocal "hd_unknown";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal KPLIB_color_enemyActive;
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
    case 4: {["lib_intel_convoy", [markertext ([10000, _obj_position] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;};
    case 5: {["lib_secondary_convoy_destroyed"] call BIS_fnc_showNotification;};
    case 6: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_sar", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal KPLIB_color_enemyActive;
        _secondary_marker setMarkerTypeLocal "hd_unknown";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal KPLIB_color_enemyActive;
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
    // civ-supplies mission
    case 9: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_civ_supplies", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal "ColorGREEN";
        _secondary_marker setMarkerTypeLocal "hd_end";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal "ColorGREEN";
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [50,50];
    };
    case 10: {
        ["lib_secondary_civ_supplies_complete"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };
    case 11: {
        //notify there are no friendly towns
        ["lib_secondary_civ_supplies_no_room"] call BIS_fnc_showNotification;
        //return intel points used
        resources_intel = resources_intel + ( KPLIB_secondary_missions_costs select 3);
    };
    // bingo-fuel mission
    case 12: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_bingo_fuel", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal "ColorGREEN";
        _secondary_marker setMarkerTypeLocal "hd_end";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal "ColorGREEN";
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [50,50];
    };
    case 13: {
        ["lib_secondary_bingo_fuel_complete"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };
    case 14: {
        //notify there are no friendly factory
        ["lib_secondary_bingo_fuel_no_room"] call BIS_fnc_showNotification;
        //return intel points used
        resources_intel = resources_intel + ( KPLIB_secondary_missions_costs select 4);
    };
    // rearm-outpost mission
    case 15: {
        waitUntil {!isNil "secondary_objective_position_marker"};
        waitUntil {count secondary_objective_position_marker > 0};
        waitUntil {secondary_objective_position_marker distance zeropos > 1000};
        ["lib_intel_rearm_outpost", [markertext ([10000, secondary_objective_position_marker] call KPLIB_fnc_getNearestSector)]] call BIS_fnc_showNotification;
        _secondary_marker = createMarkerLocal ["secondarymarker", secondary_objective_position_marker];
        _secondary_marker setMarkerColorLocal "ColorGREEN";
        _secondary_marker setMarkerTypeLocal "hd_end";

        _secondary_marker_zone = createMarkerLocal ["secondarymarkerzone", secondary_objective_position_marker];
        _secondary_marker_zone setMarkerColorLocal "ColorGREEN";
        _secondary_marker_zone setMarkerShapeLocal "ELLIPSE";
        _secondary_marker_zone setMarkerBrushLocal "FDiagonal";
        _secondary_marker_zone setMarkerSizeLocal [50,50];
    };
    case 16: {
        ["lib_secondary_rearm_outpost_complete"] call BIS_fnc_showNotification;
        deleteMarkerLocal "secondarymarker";
        deleteMarkerLocal "secondarymarkerzone";
        secondary_objective_position_marker = [];
    };
    case 17: {
        //notify there are no friendly outpost
        ["lib_secondary_rearm_outpost_no_room"] call BIS_fnc_showNotification;
        //return intel points used
        resources_intel = resources_intel + ( KPLIB_secondary_missions_costs select 5);
    };
    default {[format ["remote_call_intel.sqf -> no valid value for _notiftype: %1", _notiftype], "ERROR"] remoteExecCall ["KPLIB_fnc_log", 2];};
};
