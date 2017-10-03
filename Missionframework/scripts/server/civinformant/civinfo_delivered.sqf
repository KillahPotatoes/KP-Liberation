params ["_informant"];

if (isServer && alive _informant) then {
	resources_intel = resources_intel + KP_liberation_civinfo_intel;
	[1] remoteExec ["civinfo_notifications"];
};
