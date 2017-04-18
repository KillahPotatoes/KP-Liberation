waitUntil { time > 1 };
waitUntil { !isNil "huron" };
waitUntil { !isNil "GRLIB_isAtlasPresent" };

private ["_KP_liberation_little_bird","_KP_liberation_little_bird_pad"];

if (GRLIB_isAtlasPresent) then {
	for [{_i=0}, {_i < (count KP_liberation_little_bird_positions)}, {_i = _i + 1}] do {
		_KP_liberation_little_bird = KP_liberation_little_bird_classname createVehicle (getmarkerpos "ghost_spot");
		_KP_liberation_little_bird enableSimulationGlobal false;
		_KP_liberation_little_bird allowdamage false;
		_KP_liberation_little_bird setDir 270;
		_KP_liberation_little_bird setposasl (KP_liberation_little_bird_positions select _i);
		
		clearWeaponCargoGlobal _KP_liberation_little_bird;
		clearMagazineCargoGlobal _KP_liberation_little_bird;
		clearItemCargoGlobal _KP_liberation_little_bird;
		clearBackpackCargoGlobal _KP_liberation_little_bird;
		_KP_liberation_little_bird setDamage 0;
		uiSleep 0.5;
		_KP_liberation_little_bird enableSimulationGlobal true;
		_KP_liberation_little_bird setDamage 0;
		_KP_liberation_little_bird allowdamage true;
		_KP_liberation_little_bird setVariable ["KP_liberation_preplaced", true, true];
	};
} else {
	for [{_i=0}, {!isNil ("kp_chimera_pad_" + str _i)}, {_i = _i + 1}] do {
		_KP_liberation_little_bird_pad = missionNamespace getVariable ("kp_chimera_pad_" + str _i);
		_KP_liberation_little_bird = KP_liberation_little_bird_classname createVehicle (getpos _KP_liberation_little_bird_pad);
		_KP_liberation_little_bird allowdamage false;
		_KP_liberation_little_bird setpos (getpos _KP_liberation_little_bird_pad);
		_KP_liberation_little_bird setDir (getDir _KP_liberation_little_bird_pad);
		uiSleep 0.5;
		_KP_liberation_little_bird setDamage 0;
		_KP_liberation_little_bird allowdamage true;
		_KP_liberation_little_bird setVariable ["KP_liberation_preplaced", true, true];
	};
};
