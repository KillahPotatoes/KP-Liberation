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

	} else {
		while { count GRLIB_all_fobs == 0 } do {

			if ( GRLIB_isAtlasPresent ) then {
				_fobbox = FOB_box_typename createVehicle [0,0,50];
				_fobbox enableSimulationGlobal false;
				_fobbox allowDamage false;
				_fobbox setposasl [(getpos lhd select 0) + 10, (getpos lhd select 1) + 62, 16.75];
				clearItemCargoGlobal _fobbox;
				_fobbox setDir 130;
				sleep 1;
				_fobbox enableSimulationGlobal true;
				_fobbox allowDamage true;
			} else {
				_fobbox = FOB_box_typename createVehicle (getpos base_boxspawn);
				_fobbox setpos (getpos base_boxspawn);
				_fobbox setdir 215;
			};

			[_fobbox, 3000] remoteExec ["F_setMass",_fobbox];

			sleep 3;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || count GRLIB_all_fobs > 0
			};

			sleep 15;

		};

		deleteVehicle _fobbox;
	};

	waitUntil {sleep 5; (count GRLIB_all_fobs) > 0};

	private ["_crate","_crateArray", "_smoke"];

	diag_log "[KP LIBERATION] [INFO] First FOB built. Sending resource package.";

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
	} forEach _crateArray

};