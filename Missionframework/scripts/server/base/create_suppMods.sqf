if (KP_liberation_suppMod_enb > 0) then {
	KP_liberation_suppMod_grp = createGroup sideLogic;
	KP_liberation_suppMod_req = KP_liberation_suppMod_grp createUnit ["SupportRequester", getPos huronspawn, [], 0, "NONE"];
	[KP_liberation_suppMod_req] execVM "A3\modules_f\supports\init_requester.sqf";
	{
		[KP_liberation_suppMod_req, _x, -1] call BIS_fnc_limitSupport;
	} forEach ["Artillery","CAS_Heli","CAS_Bombing","UAV","Drop","Transport"];

	KP_liberation_suppMod_arty = KP_liberation_suppMod_grp createUnit ["SupportProvider_Artillery", KP_liberation_suppMod_grp, [], 0, "NONE"];
	[KP_liberation_suppMod_arty] execVM "A3\modules_f\supports\init_provider.sqf";

	publicVariable "KP_liberation_suppMod_grp";
	publicVariable "KP_liberation_suppMod_arty";
	KP_liberation_suppMod_created = true; publicVariable "KP_liberation_suppMod_created";
	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] SUPP: SuppMods created by: %1 - Grp: %2 - Arty: %3", debug_source, KP_liberation_suppMod_grp, KP_liberation_suppMod_arty];_text remoteExec ["diag_log",2];};
};