params [ "_unit" ];
private [ "_nearestfob", "_is_near_fob", "_is_near_blufor", "_grp", "_waypoint", "_nearblufor" ];

waitUntil {
    sleep 0.5;
    local _unit
};

_is_near_fob = false;
_is_near_blufor = true;

sleep 1;
_unit playmove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
sleep 2;
_unit enableAI "ANIM";
_unit enableAI "MOVE";
sleep 2;
[_unit, ""] remoteExecCall ["switchMove"];

if ( typeof _unit == pilot_classname ) exitWith {};

waitUntil { sleep 5;

    _nearestfob = [ getpos _unit ] call KPLIB_fnc_getNearestFob;
    if ( count _nearestfob == 3) then {
        if ( ( _unit distance _nearestfob ) < 30 ) then {
            _is_near_fob = true;
        };
    };

    _is_near_blufor = false;
    if ( !_is_near_blufor ) then {
        {
            if ((_x distance _unit) < 100) exitWith { _is_near_blufor = true };
        } forEach (allUnits select {!((toLower (typeof _x)) in KPLIB_o_inf_classes || (typeof _x) in militia_squad)});
    };

    !alive _unit || !(_is_near_blufor) || (_is_near_fob && (vehicle _unit == _unit))
};

if (alive _unit) then {

    if (_is_near_fob) then {

        sleep 5;
        _grp = createGroup [GRLIB_side_civilian, true];
        [_unit] joinSilent _grp;
        _unit playmove "AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground";
        _unit disableAI "ANIM";
        _unit disableAI "MOVE";
        sleep 5;
        [_unit, "AidlPsitMstpSnonWnonDnon_ground00"] remoteExecCall ["switchMove"];
        [_unit] remoteExec ["prisonner_remote_call",2];
        sleep 600;
        deleteVehicle _unit;

    } else {

        _grp = createGroup [GRLIB_side_enemy, true];
        [_unit] joinSilent _grp;
        _unit setUnitPos "AUTO";
        _unit setCaptive false;

        if ((vehicle _unit != _unit) && !(_unit isEqualTo (driver vehicle _unit))) then {
            unAssignVehicle _unit;
            _unit action ["eject", vehicle _unit];
            _unit action ["getout", vehicle _unit];
            unAssignVehicle _unit;
        };

        while {(count (waypoints _grp)) != 0} do {deleteWaypoint ((waypoints _grp) select 0);};
        {_x doFollow leader _grp} foreach units _grp;

        _possible_sectors = (sectors_allSectors - blufor_sectors);
        if ( count _possible_sectors > 0 ) then {

            _possible_sectors = [ _possible_sectors , [getpos _unit, 5000] , { (markerPos _x) distance _input0 } , 'ASCEND' ] call BIS_fnc_sortBy;
            if ( count _possible_sectors > 0 ) then {
                _target_sector = _possible_sectors select 0;
                _waypoint = _grp addWaypoint [markerpos _target_sector, 300];
                _waypoint setWaypointType "MOVE";
                _waypoint setWaypointSpeed "FULL";
            };
        };
    };
};
