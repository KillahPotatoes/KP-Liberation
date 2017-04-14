params [ "_sector" ];
private [ "_crates_amount", "_spawnpos", "_i", "_spawnclass" ];


if ( isNil "KP_capture_sectors_already_activated" ) then { KP_capture_sectors_already_activated = [] };

if ( !( _sector in KP_capture_sectors_already_activated )) then {

	KP_capture_sectors_already_activated pushback _sector;

	_crates_amount = ceil (((0.5 * GRLIB_sector_capture_value) + (random (0.5 * GRLIB_sector_capture_value ))) * GRLIB_resources_multiplier);
	if ( _crates_amount > 6 ) then { _crates_amount = 6 };

	for [ {_i=0}, {_i < (_crates_amount + 1) }, {_i=_i+1} ] do {

		_spawnclass = KP_liberation_supply_crate;
		if ( _i == 0 ) then {
			_spawnclass = opfor_ammobox_transport;
		};

		_spawnpos = zeropos;
		while { _spawnpos distance zeropos < 1000 } do {
			_spawnpos =  ( [ ( markerpos _sector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [10, 100, 'B_Heli_Transport_01_F'];
			if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
		};

		_newbox = _spawnclass createVehicle _spawnpos;
		_newbox setpos _spawnpos;
		_newbox setdir (random 360);
		clearWeaponCargoGlobal _newbox;
		clearMagazineCargoGlobal _newbox;
		clearItemCargoGlobal _newbox;
		clearBackpackCargoGlobal _newbox;
		_newbox addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
		
		_newbox setVariable ["KP_liberation_crate_value", 100, true];

		if ( _i != 0 ) then {
			[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;
		};
	};
};