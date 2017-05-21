private [ "_unflippable_vehicles", "_detected_vehicles", "_next_vehicle", "_next_vehicle_already_in_list", "_idact_next" ];

_unflippable_vehicles = [];
veh_action_distance = 10;

while { true } do {

	if ( [ player, 5 ] call F_fetchPermission ) then {

		_detected_vehicles = [ (getpos player) nearEntities [["Tank","APC","IFV","Car"], veh_action_distance] , { (count crew _x) == 0 && ((locked _x == 0 || locked _x == 1)) && (_x distance startbase > 1000) } ] call BIS_fnc_conditionalSelect;

		{
			_next_vehicle = _x;
			_next_vehicle_already_in_list = false;
			{
				if ( (_x select 0) == _next_vehicle ) then {
					_next_vehicle_already_in_list = true;
				};
			} foreach _unflippable_vehicles;

			if ( !_next_vehicle_already_in_list ) then {
				_idact_next = _next_vehicle addAction [ "<t color='#FFFF00'>" + localize "STR_UNFLIP" + "</t> <img size='2' image='res\ui_flipveh.paa'/>", "scripts\client\actions\do_unflip.sqf", "", -950, true, true, "", "build_confirmed == 0 && (_this distance _target < veh_action_distance) && (vehicle player == player)"];
				_unflippable_vehicles pushback [ _next_vehicle, _idact_next ] ;
			};
		} foreach _detected_vehicles;

		{
			_next_vehicle = _x;
			_next_vehicle_already_in_list = false;
			{
				if ( _x == (_next_vehicle select 0) ) then {
					_next_vehicle_already_in_list = true;
				};
			} foreach _detected_vehicles;

			if ( !_next_vehicle_already_in_list ) then {
				(_next_vehicle select 0) removeAction (_next_vehicle select 1);
				_unflippable_vehicles = _unflippable_vehicles - [ _next_vehicle ];
			};

		} foreach _unflippable_vehicles;

		sleep 3;

	} else {
		{
			(_x select 0) removeAction (_x select 1);
			_unflippable_vehicles = _unflippable_vehicles - [ _x ];
		} foreach _unflippable_vehicles;
	};
};
