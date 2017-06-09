waitUntil { time > 1 };
waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

private [ "_fobbox" ];

if ( count GRLIB_all_fobs == 0 ) then {

	if ( GRLIB_build_first_fob ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 800 ) then {
					_acceptsector = false;
				};
			} foreach sectors_allSectors;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = _potentialplaces call BIS_fnc_selectRandom;
		[markerPos _spawnplace, true] remoteExec ["build_fob_remote_call",2];

		if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Preplaced FOB placed by: %1", debug_source];_text remoteExec ["diag_log",2];};

	} else {
		while { count GRLIB_all_fobs == 0 } do {
			_fobbox = FOB_box_typename createVehicle (getposATL base_boxspawn);
			_fobbox setposATL (getposATL base_boxspawn);
			_fobbox setdir getDir base_boxspawn;

			[_fobbox, 3000] remoteExec ["F_setMass",_fobbox];

			if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] FOB Box placed by: %1", debug_source];_text remoteExec ["diag_log",2];};

			sleep 3;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || ((count GRLIB_all_fobs) > 0) || (((getPosASL _fobbox) select 2) < 0)
			};

			sleep 15;
			
		};

		deleteVehicle _fobbox;
	};

	waitUntil {sleep 5; (count GRLIB_all_fobs) > 0};

	private ["_crate","_crateArray", "_smoke"];

	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] First FOB built at %1. Sending resource package.", (GRLIB_all_fobs select 0)];_text remoteExec ["diag_log",2];};

	_crateArray = [];

	uiSleep 10;

	for [{_i = 0;}, {_i < 6}, {_i = _i + 1;}] do {
		_crate = createVehicle [
			(KP_liberation_crates select (_i % 3)),
			[((GRLIB_all_fobs select 0) select 0), ((GRLIB_all_fobs select 0) select 1), 150],
			[],
			80,
			"FLY"
		];
		clearWeaponCargoGlobal _crate;
		clearMagazineCargoGlobal _crate;
		clearItemCargoGlobal _crate;
		clearBackpackCargoGlobal _crate;
		_crate addMPEventHandler ['MPKilled', {_this spawn kill_manager}];
		_crate setVariable ["KP_liberation_crate_value", 100, true];
		[_crate, 500] remoteExec ["F_setMass",_crate];
		[objNull, _crate] call BIS_fnc_curatorObjectEdited;
		_crateArray pushBack _crate;
	};
	uiSleep 25;
	{
		_smoke = "SmokeShellGreen" createVehicle (getPos _x);
		_smoke attachTo [_x];
	} forEach _crateArray;

	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] Startresources dropped by: %1", debug_source];_text remoteExec ["diag_log",2];};

};