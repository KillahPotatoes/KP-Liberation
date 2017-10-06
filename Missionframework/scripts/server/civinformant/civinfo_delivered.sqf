params ["_informant"];

if (isServer && alive _informant) then {
	resources_intel = resources_intel + KP_liberation_civinfo_intel;
	[2, false] spawn F_cr_changeCR;
	[1] remoteExec ["civinfo_notifications"];
};
