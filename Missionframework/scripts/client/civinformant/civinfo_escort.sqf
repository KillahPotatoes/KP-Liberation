params ["_informant"];

if (isDedicated) exitWith {};

if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_escort called on: %1 - Parameters: [%2]", debug_source, _informant];_text remoteExec ["diag_log",2];};

waitUntil {sleep 0.5; local _informant || !alive _informant};

if !(alive _informant) exitWith {if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_escort exited by: %1 - Informant isn't alive", debug_source];_text remoteExec ["diag_log",2];};};

private _is_near_fob = false;

sleep 1;
_informant playmove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
sleep 2;
_informant enableAI "ANIM";
_informant enableAI "MOVE";
sleep 2;
[_informant] remoteExec ["remote_call_switchmove"];

waitUntil {sleep 5;
	_nearestfob = [getpos _informant] call F_getNearestFob;
	if (count _nearestfob == 3) then {
		if ((_informant distance _nearestfob) < 30) then {
			_is_near_fob = true;
		};
	};
	!alive _informant || (_is_near_fob && (vehicle _informant == _informant))
};

if (alive _informant) then {
	if (_is_near_fob) then {
		sleep 5;
		private _grp = createGroup [GRLIB_side_friendly, true];
		[_informant] joinSilent _grp;
		_informant playmove "AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground";
		_informant disableAI "ANIM";
		_informant disableAI "MOVE";
		sleep 5;
		[_informant, "AidlPsitMstpSnonWnonDnon_ground00"] remoteExec ["remote_call_switchmove"];
		[_informant] remoteExec ["civinfo_delivered",2];
		if (KP_liberation_civinfo_debug > 0) then {private _text = "[KP LIBERATION] [CIVINFO] civinfo_escort -> Informant at FOB";_text remoteExec ["diag_log",2];};
		sleep 600;
		deleteVehicle _informant;
		if (KP_liberation_civinfo_debug > 0) then {private _text = format ["[KP LIBERATION] [CIVINFO] civinfo_escort finished by: %1", debug_source];_text remoteExec ["diag_log",2];};
	};
};
