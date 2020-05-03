private _recycleable_vehicles = [];
private _recycleable_classnames = [];
veh_action_detect_distance = 20;
veh_action_distance = 10;

{
    _recycleable_classnames append _x;
} forEach [
    KPLIB_b_light_classes,
    KPLIB_b_heavy_classes,
    KPLIB_b_air_classes,
    KPLIB_b_static_classes,
    KPLIB_b_support_classes,
    KPLIB_o_allVeh_classes
];

while {true} do {
    waitUntil {sleep 2; player getVariable ['KPLIB_fobDist', 99999] < GRLIB_fob_range};

    if ([4] call KPLIB_fnc_hasPermission) then {
        private _detected_vehicles = (getPos player) nearObjects veh_action_detect_distance select {
            (((toLower (typeof _x)) in _recycleable_classnames && (({alive _x} count (crew _x)) == 0 || unitIsUAV _x) && (locked _x == 0 || locked _x == 1)) ||
            (toLower (typeOf _x)) in KPLIB_b_buildings_classes ||
            (((toLower (typeOf _x)) in KPLIB_storageBuildings) && ((_x getVariable ["KP_liberation_storage_type",-1]) == 0)) ||
            (toLower (typeOf _x)) in KPLIB_upgradeBuildings ||
            (typeOf _x) in KP_liberation_ace_crates) &&
            alive _x &&
            (
                // ignore null objects left by Advanced Towing
                // see https://github.com/sethduda/AdvancedTowing/pull/46
                (((attachedObjects _x) select {!isNull _X}) isEqualTo [])
                || ((typeOf _x) == "rhsusf_mkvsoc")
            ) &&
            _x distance2d startbase > 1000 &&
            (_x distance2d ([] call KPLIB_fnc_getNearestFob)) < GRLIB_fob_range &&
            (getObjectType _x) >= 8
        };

        {
            private _next_vehicle = _x;
            private _next_vehicle_already_in_list = false;
            {
                if ((_x select 0) == _next_vehicle) exitWith {_next_vehicle_already_in_list = true;};
            } forEach _recycleable_vehicles;

            if (!_next_vehicle_already_in_list) then {
                private _idact_next = _next_vehicle addAction ["<t color='#FFFF00'>" + localize "STR_RECYCLE" + "</t> <img size='2' image='res\ui_recycle.paa'/>", "scripts\client\actions\do_recycle.sqf", "", -900, true, true, "", "build_confirmed == 0 && ((_this distance2D _target) < veh_action_distance) && (vehicle player == player)"];
                _recycleable_vehicles pushback [_next_vehicle, _idact_next] ;
            };
        } forEach _detected_vehicles;

        {
            private _next_vehicle = _x;
            private _next_vehicle_already_in_list = false;
            {
                if (_x == (_next_vehicle select 0)) exitWith {_next_vehicle_already_in_list = true;};
            } forEach _detected_vehicles;

            if (!_next_vehicle_already_in_list) then {
                (_next_vehicle select 0) removeAction (_next_vehicle select 1);
                _recycleable_vehicles = _recycleable_vehicles - [_next_vehicle];
            };
        } forEach _recycleable_vehicles;
    } else {
        {
            (_x select 0) removeAction (_x select 1);
            _recycleable_vehicles = _recycleable_vehicles - [_x];
        } forEach _recycleable_vehicles;
    };

    sleep 3;
};
