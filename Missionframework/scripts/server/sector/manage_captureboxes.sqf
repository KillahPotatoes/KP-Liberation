params ["_sector"];
private ["_crates_amount", "_spawnpos", "_i", "_spawnclass", "_newbox", "_nearbuildings", "_compatible_classnames", "_intel_range", "_building_positions", "_nbintel", "_used_positions", "_buildingposition", "_inteldir", "_intelclassname", "_intelobject"];

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

if (isNil "KP_capture_sectors_already_activated") then {KP_capture_sectors_already_activated = []};

if (!(_sector in KP_capture_sectors_already_activated)) then {

	KP_capture_sectors_already_activated pushback _sector;

	_crates_amount = (ceil (random 3)) * GRLIB_resources_multiplier;

	for [{_i=0},{_i < _crates_amount},{_i=_i+1}] do {

		_spawnpos = zeropos;
		while { _spawnpos distance zeropos < 1000 } do {
			_spawnpos =  ( [ ( markerpos _sector), random 50, random 360 ] call BIS_fnc_relPos ) findEmptyPosition [10, 100, 'B_Heli_Transport_01_F'];
			if ( count _spawnpos == 0 ) then { _spawnpos = zeropos; };
		};

		_spawnclass = selectRandom KP_liberation_crates;

		_newbox = _spawnclass createVehicle _spawnpos;
		_newbox setpos _spawnpos;
		_newbox setdir (random 360);
		clearWeaponCargoGlobal _newbox;
		clearMagazineCargoGlobal _newbox;
		clearItemCargoGlobal _newbox;
		clearBackpackCargoGlobal _newbox;
		
		_newbox setVariable ["KP_liberation_crate_value", 100, true];
		[_newbox, 500] remoteExec ["F_setMass",_newbox];
	};

	if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] %1 Crates spawned at %2", _crates_amount, _sector];_text remoteExec ["diag_log",2];};

	if (_sector in sectors_military) then {
		
		_nearbuildings = [nearestObjects [markerpos _sector, _compatible_classnames, _intel_range], {alive _x}] call BIS_fnc_conditionalSelect;

		if ((count _nearbuildings) > 0) then {
			_building_positions = [];

			{_building_positions = _building_positions + ([_x] call BIS_fnc_buildingPositions);} foreach _nearbuildings;

			_building_positions = [_building_positions, {(_x select 2) < 2 }] call BIS_fnc_conditionalSelect;

			if ((count _building_positions) >= (_nbintel * 4)) then {

				_used_positions = [];

				if (KP_liberation_debug) then {private _text = format ["[KP LIBERATION] [DEBUG] %1 Intelobjects spawned at %2", _nbintel, _sector];_text remoteExec ["diag_log",2];};

				while {_nbintel > 0} do {

					_buildingposition = _building_positions call BIS_fnc_selectRandom;
					
					while {_buildingposition in _used_positions} do {
						_buildingposition = _building_positions call BIS_fnc_selectRandom;
					};

					_used_positions pushback _buildingposition;
					
					_inteldir = random 360;

					_intelclassname = [GRLIB_intel_file, GRLIB_intel_laptop] call BIS_fnc_selectRandom;
					_intelobject = _intelclassname createVehicle _buildingposition;
					_intelobject setPosATL [_buildingposition select 0, _buildingposition select 1, (_buildingposition select 2) - 0.15];
					_intelobject enableSimulationGlobal false;
					_intelobject allowDamage false;
					_intelobject setdir _inteldir;

					_nbintel = _nbintel - 1;
				};
			};
		};
	};
};
