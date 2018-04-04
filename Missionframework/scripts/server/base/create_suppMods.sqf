if (KP_liberation_suppMod_enb > 0) then {
	KP_liberation_suppMod_grp = createGroup [sideLogic, true];
	KP_liberation_suppMod_req = KP_liberation_suppMod_grp createUnit ["SupportRequester", getPos huronspawn, [], 0, "NONE"];
	//KP_liberation_suppMod_req spawn BIS_fnc_moduleSupportsInitRequester;
	[KP_liberation_suppMod_req] execVM "A3\modules_f\supports\init_requester.sqf";
	{
		[KP_liberation_suppMod_req, _x, -1] call BIS_fnc_limitSupport;
	} forEach ["Artillery","CAS_Heli","CAS_Bombing","UAV","Drop","Transport"];

	KP_liberation_suppMod_arty = KP_liberation_suppMod_grp createUnit ["SupportProvider_Artillery", KP_liberation_suppMod_grp, [], 0, "NONE"];
	//KP_liberation_suppMod_arty spawn BIS_fnc_moduleSupportsInitProvider;
	[KP_liberation_suppMod_arty] execVM "A3\modules_f\supports\init_provider.sqf";

	publicVariable "KP_liberation_suppMod_grp";
	publicVariable "KP_liberation_suppMod_arty";
	KP_liberation_suppMod_created = true; publicVariable "KP_liberation_suppMod_created";
};