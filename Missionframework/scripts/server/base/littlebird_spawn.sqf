waitUntil { time > 1 };
waitUntil { !isNil "huron" };
waitUntil { !isNil "GRLIB_isAtlasPresent" };

if (GRLIB_isAtlasPresent) then {
	for [{_i=0}, {_i < (count KP_liberation_little_bird_positions)}, {_i = _i + 1}] do {
		KP_liberation_little_bird = KP_liberation_little_bird_classname createVehicle (getmarkerpos "ghost_spot");
		KP_liberation_little_bird enableSimulationGlobal false;
		KP_liberation_little_bird allowdamage false;
		KP_liberation_little_bird setDir 270;
		KP_liberation_little_bird setposasl (KP_liberation_little_bird_positions select _i);
		
		clearWeaponCargoGlobal KP_liberation_little_bird;
		clearMagazineCargoGlobal KP_liberation_little_bird;
		clearItemCargoGlobal KP_liberation_little_bird;
		clearBackpackCargoGlobal KP_liberation_little_bird;
		KP_liberation_little_bird setDamage 0;
		uiSleep 0.5;
		KP_liberation_little_bird enableSimulationGlobal true;
		KP_liberation_little_bird setDamage 0;
		KP_liberation_little_bird allowdamage true;
	};
};
