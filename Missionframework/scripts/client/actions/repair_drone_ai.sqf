waitUntil {!isNil "GRLIB_permissions"};
waitUntil {!(GRLIB_permissions isEqualTo []) || !GRLIB_permissions_param};

private [ "_already_marked_drones", "_detected_drones", "_next_vehicle", "_next_vehicle_already_in_list", "_idact_next" ];

_already_marked_drones = [];
veh_action_distance = 10;

while { true } do {

    if ([5] call KPLIB_fnc_hasPermission) then {

        _detected_drones = allUnitsUAV;
		
        {
            _next_vehicle = _x;
            _next_vehicle_already_in_list = false;
            {
                if ( (_x select 0) == _next_vehicle ) then {
                    _next_vehicle_already_in_list = true;
                };
            } foreach _already_marked_drones;

            if ( !_next_vehicle_already_in_list ) then {
                _idact_next = _next_vehicle addAction [ "<t color='#FFFF00'>" + localize "STR_REPAIR_DRONE_AI" + "</t>", "scripts\client\actions\do_repair_drone_ai.sqf", "", -1000, true, true, "", "build_confirmed == 0 && (_this distance _target < veh_action_distance) && (vehicle player == player)"];
                _already_marked_drones pushback [ _next_vehicle, _idact_next ] ;
            };
        } foreach _detected_drones;

        {
            _next_vehicle = _x;
            _next_vehicle_already_in_list = false;
            {
                if ( _x == (_next_vehicle select 0) ) then {
                    _next_vehicle_already_in_list = true;
                };
            } foreach _detected_drones;

            if ( !_next_vehicle_already_in_list ) then {
                (_next_vehicle select 0) removeAction (_next_vehicle select 1);
                _already_marked_drones = _already_marked_drones - [ _next_vehicle ];
            };

        } foreach _already_marked_drones;

    } else {
        {
            (_x select 0) removeAction (_x select 1);
            _already_marked_drones = _already_marked_drones - [ _x ];
        } foreach _already_marked_drones;
    };

    sleep 3;
};
