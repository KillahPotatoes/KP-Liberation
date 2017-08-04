params ["_vehicle"];

if (isNil "KP_liberation_cr_vehicles") then {
	KP_liberation_cr_vehicles = [];
};

if (((typeOf _vehicle) in civilian_vehicles) && !(_vehicle in KP_liberation_cr_vehicles)) then {
	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] [CIVREP] Civil vehicle stolen by: %1", debug_source];_text remoteExec ["diag_log",2];};
	(localize "STR_CR_VEHICLEMSG") remoteExec ["systemChat"];
	[KP_liberation_cr_vehicle_penalty, true] remoteExec ["F_cr_changeCR", 2];

	KP_liberation_cr_vehicles pushBack _vehicle;
	publicVariable "KP_liberation_cr_vehicles";
};