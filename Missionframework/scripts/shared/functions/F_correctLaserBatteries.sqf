params [ "_unit" ];

if ( _unit hasWeapon "Laserdesignator" || _unit hasWeapon "Laserdesignator_02" || _unit hasWeapon "Laserdesignator_03"  ) then {
	if ( !("Laserbatteries" in (magazines _unit))) then {
		_unit addMagazine "Laserbatteries";
	};
};