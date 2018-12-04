params ["_sector"];

private _intel_range = 150;
private _nbintel = 2 + (floor (random 3));
private _compatible_classnames = [
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

if (isNil "KP_military_sectors_already_activated") then {KP_military_sectors_already_activated = []};

if (!(_sector in KP_military_sectors_already_activated)) then {

	KP_military_sectors_already_activated pushback _sector;

	private _nearbuildings = [nearestObjects [markerpos _sector, _compatible_classnames, _intel_range], {alive _x}] call BIS_fnc_conditionalSelect;

	if ((count _nearbuildings) > 0) then {
		private _building_positions = [];

		{_building_positions = _building_positions + ([_x] call BIS_fnc_buildingPositions);} foreach _nearbuildings;

		_building_positions = [_building_positions, {(_x select 2) < 2 }] call BIS_fnc_conditionalSelect;

		if ((count _building_positions) >= (_nbintel * 4)) then {

			private _used_positions = [];

			while {_nbintel > 0} do {

				private _buildingposition = selectRandom _building_positions;
				
				while {_buildingposition in _used_positions} do {
					_buildingposition = selectRandom _building_positions;
				};

				_used_positions pushback _buildingposition;

				_intelobject = (selectRandom [GRLIB_intel_file, GRLIB_intel_laptop]) createVehicle _buildingposition;
				_intelobject setPosATL [_buildingposition select 0, _buildingposition select 1, (_buildingposition select 2) - 0.15];
				_intelobject enableSimulationGlobal false;
				_intelobject allowDamage false;
				_intelobject setdir (random 360);

				_nbintel = _nbintel - 1;
			};
		};
	};
};
