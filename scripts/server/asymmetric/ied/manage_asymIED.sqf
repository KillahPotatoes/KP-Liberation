params ["_sector", "_count"];

if (_count <= 0) exitWith {};

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] manage_asymIED.sqf for %1 spawned on: %2", markerText _sector, debug_source];_text remoteExec ["diag_log",2];};

waitUntil {sleep 1; _sector in KP_liberation_asymmetric_sectors};

if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] manage_asymIED.sqf -> spawning IED %1 at %2", _count, markerText _sector];_text remoteExec ["diag_log",2];};

private _activation_radius_infantry = 6.66;
private _activation_radius_vehicles = 10;
private _spread = 7;
private _infantry_trigger = 1 + (ceil (random 2));
private _vehicle_trigger = 1;
private _ied_type = selectRandom ["IEDLandBig_F","IEDLandSmall_F","IEDUrbanBig_F","IEDUrbanSmall_F"];
private _ied_obj = objNull;
private _roadobj = [(getmarkerpos (_sector) getPos [random (200), random (360)]), 200, []] call BIS_fnc_nearestRoad;
private _goes_boom = false;
private _ied_marker = "";

if (_count > 0) then {
	[_sector, _count - 1] spawn manage_asymIED;
};

if (!(isnull _roadobj)) then {
	private _roadpos = getpos _roadobj;
	_ied_obj = createMine [_ied_type, _roadpos getPos [_spread, random (360)], [], 0];
	_ied_obj setdir (random 360);

	if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] manage_asymIED.sqf -> IED %1 spawned at %2", _count, markerText _sector];_text remoteExec ["diag_log",2];};

	while {(_sector in KP_liberation_asymmetric_sectors) && (mineActive _ied_obj) && !_goes_boom} do {
		_nearinfantry = [(getpos _ied_obj) nearEntities ["Man", _activation_radius_infantry] , {side _x == GRLIB_side_friendly}] call BIS_fnc_conditionalSelect;
		_nearvehicles = [(getpos _ied_obj) nearEntities [["Car", "Tank", "Air"], _activation_radius_vehicles] , {side _x == GRLIB_side_friendly}] call BIS_fnc_conditionalSelect;
		if (count _nearinfantry >= _infantry_trigger || count _nearvehicles >= _vehicle_trigger) then {
			_ied_obj setDamage 1;
			stats_ieds_detonated = stats_ieds_detonated + 1; publicVariable "stats_ieds_detonated";
			_goes_boom = true;
		};
		sleep 1;
	};
} else {
	if (KP_liberation_asymmetric_debug > 0) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] manage_asymIED.sqf -> _roadobj is Null for IED %1 at %2", _count, markerText _sector];_text remoteExec ["diag_log",2];};
};

if ((KP_liberation_asymmetric_debug > 0) && !(isNull _roadobj)) then {private _text = format ["[KP LIBERATION] [ASYMMETRIC] manage_asymIED.sqf -> exit IED %1 loop at %2", _count, markerText _sector];_text remoteExec ["diag_log",2];};

sleep 60;

if (!(isNull _ied_obj)) then {deleteVehicle _ied_obj;};
