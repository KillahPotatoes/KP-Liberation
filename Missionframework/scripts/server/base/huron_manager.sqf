waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

firstloop = true;
huron = objNull;
_savedhuron = objNull;

while { true } do {

	{
		if ( typeof _x == huron_typename ) then {
			_savedhuron = _x;
		};
	} foreach vehicles;

	if ( firstloop && !isNull _savedhuron ) then {
		huron = _savedhuron;
	} else {
		huron = huron_typename createVehicle (getposATL huronspawn);
		huron enableSimulationGlobal false;
		huron allowdamage false;
		huron setPosATL (getposATL huronspawn);
		huron setDir (getDir huronspawn);
	};

	firstloop = false;

	huron AnimateDoor ["Door_rear_source", 1, true];
	publicVariable "huron";
	clearWeaponCargoGlobal huron;
	clearMagazineCargoGlobal huron;
	clearItemCargoGlobal huron;
	clearBackpackCargoGlobal huron;
	huron setDamage 0;
	sleep 0.5;
	huron enableSimulationGlobal true;
	huron setDamage 0;
	huron setVariable ["ace_medical_medicClass", 1, true];
	sleep 1.5;

	huron setDamage 0;
	huron allowdamage true;

	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] huron spawned by: %1", debug_source];_text remoteExec ["diag_log",2];};

	if ( alive huron ) then {

		waitUntil {
			sleep 1;
			!alive huron;
		};
		stats_spartan_respawns = stats_spartan_respawns + 1;
		sleep 15;

	};

	if (huron distance startbase < 500) then {
		deletevehicle huron;
	};
	sleep 0.25;

};