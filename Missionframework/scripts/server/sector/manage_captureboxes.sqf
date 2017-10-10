params ["_sector"];

if (isNil "KP_capture_sectors_already_activated") then {KP_capture_sectors_already_activated = []};

if (!(_sector in KP_capture_sectors_already_activated)) then {

	KP_capture_sectors_already_activated pushback _sector;

	private _crates_amount = ((ceil (random 3)) * GRLIB_resources_multiplier);

	for [{_i=0},{_i < _crates_amount},{_i=_i+1}] do {

		private _spawnpos = zeropos;
		while { _spawnpos distance zeropos < 1000 } do {
			_spawnpos =  ( [ ( markerpos _sector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [10, 100, 'B_Heli_Transport_01_F'];
			if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
		};

		private _spawnclass = selectRandom KP_liberation_crates;

		private _newbox = _spawnclass createVehicle _spawnpos;
		_newbox setdir (random 360);
		_newbox setpos _spawnpos;
		clearWeaponCargoGlobal _newbox;
		clearMagazineCargoGlobal _newbox;
		clearItemCargoGlobal _newbox;
		clearBackpackCargoGlobal _newbox;
		
		_newbox setVariable ["KP_liberation_crate_value", 100, true];
		[_newbox, 500] remoteExec ["F_setMass",_newbox];
	};
};
