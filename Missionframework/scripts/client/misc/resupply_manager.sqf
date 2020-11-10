private [ "_resupply_dist", "_repair_increment", "_repair_speed", "_repair_altitude", "_veh", "_repaired", "_rearmed", "_refueled", "_average_damage", "_average_fuel", "_screenmsg", "_rearm_time", "_refuel_amount", "_rearm_ticker" ];

_repair_amount = 0.01;
_repair_speed = 2;
_repair_altitude = 2;
_resupply_dist = 30;
_rearm_time = 60;
_refuel_amount = 0.02;
_rearm_ticker = 0;

while { true } do {

    _repaired = false;
    _rearmed = false;
    _refueled = false;
    _average_damage = 0;
    _average_fuel = 0;
    _screenmsg = "";

    _veh = vehicle player;

    if ( _veh != player ) then {
        if ( effectiveCommander _veh == player ) then {
            if ( (speed _veh < _repair_speed) && (((getPosATL _veh) select 2) < _repair_altitude) ) then {

                if ( count ( (getpos _veh) nearEntities [ vehicle_repair_sources , _resupply_dist] ) > 0 ) then {
                    if ( damage _veh > 0 )  then {
                        _repaired = true;
                        _average_damage = (damage _veh) - _repair_amount;
                        if ( _average_damage < 0 ) then { _average_damage = 0 };
                        _veh setDamage _average_damage;
                    };
                };

                if ( ( count ( (getpos _veh) nearEntities [ vehicle_rearm_sources , _resupply_dist] ) > 0 ) && ( _rearm_ticker < _rearm_time ) ) then {
                    _rearmed = true;
                    _rearm_ticker = _rearm_ticker + 1;
                    if ( _rearm_ticker >= _rearm_time ) then {
                        [_veh, 1] remoteExecCall ["setVehicleAmmo", _veh];
                    };
                };

                if ( count ( (getpos _veh) nearEntities [ vehicle_refuel_sources , _resupply_dist] ) > 0 ) then {
                    if ( fuel _veh < ( 1 - _refuel_amount ) )  then {
                        _refueled = true;
                        [_veh, (fuel _veh + _refuel_amount)] remoteExecCall ["setFuel", _veh];
                    };
                };
            } else {
                _rearm_ticker = 0;
            };
        } else {
            _rearm_ticker = 0;
        };
    } else {
        _rearm_ticker = 0;
    };

    if ( _repaired ) then {
        _screenmsg =  format [ "%1 : %2%3", localize "STR_REPAIRING", round ( 100 - (_average_damage * 100) ), "%" ];
    };

    if ( _rearmed ) then {
        if ( _repaired ) then {
            _screenmsg = format [ "%1 - ", _screenmsg ];
        };
        _screenmsg = format [ "%1%2", _screenmsg, format [ localize "STR_REARMING", _rearm_time - _rearm_ticker  ] ];
    };

    if ( _refueled ) then {
        if ( _repaired || _rearmed ) then {
            _screenmsg = format [ "%1 - ", _screenmsg ];
        };
        _screenmsg = format [ "%1%2", _screenmsg, format [ "%1 : %2%3", localize "STR_REFUELING", round ( (fuel _veh) * 100 ), "%" ] ];
    };

    titleText [ _screenmsg, "PLAIN DOWN" ];

    sleep 1;
};
