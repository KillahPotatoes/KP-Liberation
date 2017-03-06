params [ "_sector" ];
private [ "_crates_amount", "_spawnpos", "_i", "_spawnclass", "_nearbuildings", "_intel_range", "_building_positions", "_used_positions", "_buildingposition", "_nbintel", "_compatible_classnames" ];

_debug = false;
_intel_range = 150;
_nbintel = 2 + (floor (random 3));
_compatible_classnames = [
"Land_Cargo_House_V1_F",
"Land_Cargo_House_V2_F",
"Land_Cargo_House_V3_F",
"Land_Cargo_HQ_V1_F",
"Land_Cargo_HQ_V2_F",
"Land_Cargo_HQ_V3_F",
"Land_Medevac_house_V1_F",
"Land_Medevac_HQ_V1_F",
"Land_i_Barracks_V1_F",
"Land_i_Barracks_V1_dam_F",
"Land_i_Barracks_V2_F",
"Land_i_Barracks_V2_dam_F",
"Land_u_Barracks_V2_F",
"Land_MilOffices_V1_F",
"Land_Research_HQ_F",
"Land_Research_house_V1_F"
];

if ( isNil "GRLIB_military_sectors_already_activated" ) then { GRLIB_military_sectors_already_activated = [] };

if ( !( _sector in GRLIB_military_sectors_already_activated )) then {

	GRLIB_military_sectors_already_activated pushback _sector;

	if ( !GRLIB_passive_income ) then {
		_crates_amount = ceil (((0.5 * GRLIB_sector_military_value) + (random (0.5 * GRLIB_sector_military_value ))) * GRLIB_resources_multiplier);
		if ( _crates_amount > 6 ) then { _crates_amount = 6 };

		for [ {_i=0}, {_i < (_crates_amount + 1) }, {_i=_i+1} ] do {

			_spawnclass = ammobox_o_typename;
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

			if ( _i != 0 ) then {
				[ [_newbox, 500 ] , "F_setMass" ] call BIS_fnc_MP;
			};
		};
	};

	_nearbuildings = [ nearestObjects [ markerpos _sector , _compatible_classnames, _intel_range ], { alive _x } ] call BIS_fnc_conditionalSelect;

	if ( count _nearbuildings > 0 ) then {
		_building_positions = [];

		{ _building_positions = _building_positions + ( [_x] call BIS_fnc_buildingPositions ); } foreach _nearbuildings;

		_building_positions = [ _building_positions, { _x select 2 < 2 } ] call BIS_fnc_conditionalSelect;

		if ( count _building_positions >= (_nbintel * 4) ) then {

			_used_positions = [];

			while { _nbintel > 0 } do {


				_buildingposition = _building_positions call BIS_fnc_selectRandom;
				while { _buildingposition in _used_positions } do {
					_buildingposition = _building_positions call BIS_fnc_selectRandom;
				};
				_used_positions pushback _buildingposition;

				_inteldir = random 360;
				/*_nearbuildings = [ nearestObjects [ _buildingposition , _compatible_classnames, 25 ], { alive _x } ] call BIS_fnc_conditionalSelect;
				if ( count _nearbuildings > 0 ) then {
					_inteldir = getDir (_nearbuildings select 0);
				};*/

				// Code deactivated as it doesn't seem to work at all in multiplayer. AttachTo on buildings and furniture seems to be the problem. So intel now spawns on the ground. Doesn't make much sense but at least it works.
				/*
				_tableobject = GRLIB_intel_table createVehicle _buildingposition;
				_tableobject allowDamage false;
				_tableobject setpos _buildingposition;
				_tableobject setdir _inteldir;

				sleep 2;

				_tableobject enableSimulationGlobal false;
				_tableobject setVectorUp [0,0,1];

				_chairobject = GRLIB_intel_chair createVehicle _buildingposition;
				_chairobject enableSimulationGlobal false;
				_chairobject allowDamage false;
				_chairobject setdir _inteldir;
				_chairobject setVectorUp [0,0,1];
				_chairobject attachTo [ _tableobject, [0, 0.4, 0.13] ];
				*/

				_intelclassname = [ GRLIB_intel_file, GRLIB_intel_laptop ] call BIS_fnc_selectRandom;
				_intelobject = _intelclassname createVehicle _buildingposition;
				_intelobject setPosATL [_buildingposition select 0, _buildingposition select 1, (_buildingposition select 2) - 0.15];
				_intelobject enableSimulationGlobal false;
				_intelobject allowDamage false;
				_intelobject setdir _inteldir;

				if ( _debug ) then {
					_marker = createMarkerLocal [ format [ "markedveh%1" ,(getpos _intelobject) select 0 ], getpos _intelobject ];
					_marker setMarkerColorLocal GRLIB_color_enemy_bright;
					_marker setMarkerTypeLocal "mil_dot";
				};

				/**
				if ( _intelclassname == GRLIB_intel_file ) then {
					_intelobject attachTo [ _tableobject, [0, 0, 0.42] ];
				};

				if ( _intelclassname == GRLIB_intel_laptop ) then {
					_intelobject attachTo [ _tableobject, [0, 0, 0.56] ];
				};


				sleep 0.1;

				_chairobject setPosATL (getPosATL _chairobject);
				_intelobject setPosATL (getPosATL _intelobject);
				*/

				_nbintel = _nbintel - 1;
			};
		};
	};
};