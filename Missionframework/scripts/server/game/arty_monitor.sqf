params ["_vehicle"];

if (!isServer) exitWith {};

private ["_id", "_synced", "_crew_old", "_crew_grp"];

if (isNil "kp_supp_vehicles") then {
	kp_supp_vehicles = [];
};

if (_vehicle in kp_supp_vehicles) exitWith {};

_id = count kp_supp_vehicles;
_synced = false;
if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] [SUPP] Arty Monitor for ID %1 started on: %2 - _vehicle: %3 ", _id, debug_source, typeOf _vehicle];_text remoteExec ["diag_log",2];};

kp_supp_vehicles pushBack _vehicle;

while {true} do {
	_crew_old = ({alive _x} count (crew _vehicle));

	if ((_crew_old > 0) && !_synced) then {
		_synced = true;
		_vehicle synchronizeObjectsAdd [KP_liberation_suppMod_arty];
		KP_liberation_suppMod_arty synchronizeObjectsAdd [_vehicle];
		_crew_grp = group _vehicle;
		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] [SUPP] ID %1 - %2 added to sync - group: %3", _id, typeOf _vehicle, _crew_grp];_text remoteExec ["diag_log",2];};
	} else {
		if ((_crew_old == 0) && _synced) then {
			_synced = false;
			{
				_x synchronizeObjectsRemove [KP_liberation_suppMod_arty];
				KP_liberation_suppMod_arty synchronizeObjectsRemove [_x];
			} forEach (units _crew_grp);
			if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] [SUPP] ID %1 - %2 removed from sync", _id, typeOf _vehicle];_text remoteExec ["diag_log",2];};
		};
	};

	BIS_supp_refresh = TRUE;
	publicVariable "BIS_supp_refresh";

	waitUntil {
		sleep 1;
		({alive _x} count (crew _vehicle)) != _crew_old;
	};
};