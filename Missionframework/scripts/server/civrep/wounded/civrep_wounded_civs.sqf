params ["_sector"];

if (!(_sector in sectors_bigtown) && !(_sector in sectors_capture)) exitWith {};

if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] civrep_wounded_civs.sqf -> Spawned for %1 on: %2 - Time: %3", markerText _sector, debug_source, time];};

private _count = 2 + (ceil (random 2));
private _grp = creategroup [GRLIB_side_civilian, true];
private _civs = [];
private _markers = [];

for "_i" from 1 to _count do {
	private _pos = (markerPos _sector) getPos [(50 + (random 150)), (random 360)];
	while {(surfaceIsWater _pos) || ((count ([_pos, 30] call F_getNearbyPlayers)) > 0)} do {
		_pos = (markerPos _sector) getPos [(50 + (random 200)), (random 360)];
	};
	private _civ = _grp createUnit [(selectRandom civilians), _pos, [], 0, "NONE"];
	_civ addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
	_civ setDir (random 360);
	{_civ disableAI _x} forEach ["ANIM", "TARGET", "AUTOTARGET", "MOVE"];
	removeAllItems _civ;
	_civ setDamage 0.5;
	_civ call F_cr_woundedAnim;
	if (KP_liberation_ace) then {[_civ] remoteExec ["F_cr_ace_action"];};
	_civs pushBack _civ;
	private _marker = createMarker ["wounded_marker_" + str _i, [((_pos select 0) - 20 + (random 40)),((_pos select 1) - 20 + (random 40))]];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [25,25];
	_marker setMarkerColor "ColorCIV";
	_marker setMarkerAlpha 0.35;
	_markers pushBack _marker;
};

if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] civrep_wounded_civs.sqf -> Spawned %1 wounded civilians at %2 - Time: %3", _count, markerText _sector, time];};

private _units_near = [markerPos _sector, 300, GRLIB_side_friendly] call F_getUnitsCount;
private _healed_civs = [];

while {_units_near > 0} do {
	_units_near = [markerPos _sector, 300, GRLIB_side_friendly] call F_getUnitsCount;
	{
		if (((damage _x) < 0.5) && !(_x in _healed_civs)) then {
			(_markers select _forEachIndex) setMarkerAlpha 0;
			private _civ = _x;
			[_civ, "AinjPpneMstpSnonWnonDnon_kneel"] remoteExec ["switchMove"];
			sleep 2;
			{_civ enableAI _x} forEach ["ANIM", "TARGET", "AUTOTARGET", "MOVE"];
			[4, [(name _civ)]] remoteExec ["F_cr_globalMsg"];
			[KP_liberation_cr_wounded_gain] call F_cr_changeCR;
			_healed_civs pushBack _civ;
		}
	} forEach _civs;
	sleep 1;
};

sleep 60;

{
	deleteVehicle _x;
} forEach _civs;

{
	deleteMarker _x;
} forEach _markers;

if (KP_liberation_civrep_debug > 0) then {diag_log format ["[KP LIBERATION] [CIVREP] civrep_wounded_civs.sqf -> dropped at %1 - Time: %3", markerText _sector, time];};
