waitUntil { !isNil "build_confirmed" };
waitUntil { !isNil "one_synchro_done" };
waitUntil { one_synchro_done };

private [ "_managed_trucks", "_managed_boxes", "_next_truck", "_next_box", "_truck_load", "_checked_trucks", "_checked_boxes", "_action_id" ];

_managed_trucks = [];
_managed_boxes = [];

while { true } do {

	if ( [ player, 5 ] call F_fetchPermission ) then {

		_nearammoboxes = ((getpos player) nearEntities [ [ ammobox_b_typename, ammobox_o_typename ] ,10]);
		_neartransporttrucks = ((getpos player) nearEntities [ ammobox_transports_typenames ,10]);

		_checked_trucks = [];

		{
			_next_truck = _x;
			_truck_load = _next_truck getVariable ["GRLIB_ammo_truck_load", 0];

			if ( !(_next_truck in _managed_trucks) && (_truck_load > 0)) then {
					_action_id = _next_truck addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_UNLOAD_BOX" + "</t>","scripts\client\ammoboxes\do_unload_truck.sqf","",-500,true,true,"","build_confirmed == 0 && (_this distance _target < 7) && (vehicle player == player)"];
					_next_truck setVariable [ "GRLIB_ammo_truck_action", _action_id, false ];
					_managed_trucks pushback _next_truck;
			};

			if ( (_next_truck in _managed_trucks) && _truck_load == 0 ) then {
				_next_truck removeAction ( _next_truck getVariable ["GRLIB_ammo_truck_action", -1] );
				_managed_trucks = _managed_trucks - [_next_truck];
			};

			_checked_trucks pushback _next_truck;

		} foreach _neartransporttrucks;

		{
			_next_truck = _x;
			if ( !(_next_truck in _checked_trucks)) then {
				_managed_trucks = _managed_trucks - [_next_truck];
				_next_truck removeAction ( _next_truck getVariable ["GRLIB_ammo_truck_action", -1] );
			}

		} foreach _managed_trucks;

		_checked_boxes = [];

		{
			_next_box = _x;
			if ( !(_next_box in _managed_boxes) && ( isNull  attachedTo _next_box )) then {
				_action_id = _next_box addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_LOAD_BOX" + "</t>","scripts\client\ammoboxes\do_load_box_action.sqf","",-501,true,true,"","build_confirmed == 0 && (_this distance _target < 5) && (vehicle player == player)"];
				_next_box setVariable [ "GRLIB_ammo_box_action", _action_id, false ];
				_managed_boxes pushback _next_box;
			};

			_checked_boxes pushback _next_box;
		} foreach _nearammoboxes;

		{
			_next_box = _x;
			if ( !(_next_box in _managed_boxes) || !( isNull  attachedTo _next_box )) then {
				_managed_boxes = _managed_boxes - [_next_box];
				_next_box removeAction ( _next_box getVariable ["GRLIB_ammo_box_action", -1] );
			}
		} foreach _managed_boxes;

	};

	sleep 3;

};
