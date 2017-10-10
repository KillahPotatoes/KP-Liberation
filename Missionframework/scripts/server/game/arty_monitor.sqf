params ["_vehicle"];

if (!isServer) exitWith {};

if (isNil "kp_supp_vehicles") then {
	kp_supp_vehicles = [];
};

if (_vehicle in kp_supp_vehicles) exitWith {};

private _id = count kp_supp_vehicles;
private _synced = false;
private _crew_grp = [];

kp_supp_vehicles pushBack _vehicle;

while {true} do {
	private _crew_old = ({alive _x} count (crew _vehicle));

	if ((_crew_old > 0) && !_synced) then {
		_synced = true;
		_vehicle synchronizeObjectsAdd [KP_liberation_suppMod_arty];
		KP_liberation_suppMod_arty synchronizeObjectsAdd [_vehicle];
		_crew_grp = group _vehicle;
	} else {
		if ((_crew_old == 0) && _synced) then {
			_synced = false;
			{
				_x synchronizeObjectsRemove [KP_liberation_suppMod_arty];
				KP_liberation_suppMod_arty synchronizeObjectsRemove [_x];
			} forEach (units _crew_grp);
		};
	};

	BIS_supp_refresh = TRUE;
	publicVariable "BIS_supp_refresh";

	waitUntil {
		sleep 1;
		({alive _x} count (crew _vehicle)) != _crew_old;
	};
};