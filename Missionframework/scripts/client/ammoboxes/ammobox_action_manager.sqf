waitUntil {!isNil "build_confirmed"};
waitUntil {!isNil "one_synchro_done"};
waitUntil {!isNil "one_eco_done"};
waitUntil {one_synchro_done};
waitUntil {one_eco_done};

private ["_managed_trucks", "_managed_boxes", "_managed_areas", "_next_truck", "_next_box", "_truck_load", "_checked_trucks", "_checked_boxes", "_action_id","_action_id2","_action_id3","_action_id4","_b_action_id1","_b_action_id2","_b_action_id3","_b_action_id4"];

_managed_trucks = [];
_managed_boxes = [];
_managed_areas = [];

while {true} do {

    if ([5] call KPLIB_fnc_hasPermission) then {

        _nearammoboxes = ((getpos player) nearEntities [KPLIB_crates, 10]);
        _neartransporttrucks = ((getpos player) nearEntities [KPLIB_transport_classes, 10]);
        _nearstorageareas = nearestObjects [player, KPLIB_storageBuildings, 10];

        _checked_trucks = [];

        {
            _next_truck = _x;
            _truck_load = _next_truck getVariable ["GRLIB_ammo_truck_load", 0];

            if (!(_next_truck in _managed_trucks) && (_truck_load > 0)) then {
                    _action_id = _next_truck addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_UNLOAD_BOX" + "</t>","scripts\client\ammoboxes\do_unload_truck.sqf","",-500,true,true,"","build_confirmed == 0 && (_this distance _target < 8) && (vehicle player == player)"];
                    _next_truck setVariable [ "GRLIB_ammo_truck_action", _action_id, false ];
                    _managed_trucks pushback _next_truck;
            };

            if ((_next_truck in _managed_trucks) && _truck_load == 0) then {
                _next_truck removeAction (_next_truck getVariable ["GRLIB_ammo_truck_action", -1]);
                _managed_trucks = _managed_trucks - [_next_truck];
            };

            _checked_trucks pushback _next_truck;

        } foreach _neartransporttrucks;

        {
            _next_truck = _x;
            if (!(_next_truck in _checked_trucks)) then {
                _managed_trucks = _managed_trucks - [_next_truck];
                _next_truck removeAction ( _next_truck getVariable ["GRLIB_ammo_truck_action", -1]);
            }

        } foreach _managed_trucks;

        _checked_boxes = [];

        {
            _next_box = _x;
            if (!(_next_box in _managed_boxes) && ( isNull  attachedTo _next_box )) then {
                _b_action_id1 = _next_box addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_LOAD_BOX" + "</t>",{[_this select 0] call do_load_box;},"",-501,true,true,"","build_confirmed == 0 && (_this distance _target < 5) && (vehicle player == player)"];
                _b_action_id2 = _next_box addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_STORE_CRATE" + "</t>",{[(_this select 0), (nearestObjects [player,KPLIB_storageBuildings,20]) select 0,true] call KPLIB_fnc_crateToStorage;},"",-502,true,true,"","build_confirmed == 0 && (_this distance _target < 5) && (vehicle player == player)"];
                _b_action_id3 = _next_box addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_CRATE_VALUE" + "</t>",{[_this select 0] call KPLIB_fnc_checkCrateValue;uiSleep 3; hint "";},"",-503,true,true,"","build_confirmed == 0 && (_this distance _target < 5) && (vehicle player == player)"];
                _b_action_id4 = _next_box addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_CRATE_PUSH" + "</t>",{(_this select 0) setPos ((_this select 0) getPos [1, (player getDir (_this select 0))]);},"",-504,true,false,"","build_confirmed == 0 && (_this distance _target < 5) && (vehicle player == player)"];
                _next_box setVariable ["GRLIB_ammo_box_action", _b_action_id1, false];
                _next_box setVariable ["KP_crate_store_action", _b_action_id2, false];
                _next_box setVariable ["KP_crate_value_action", _b_action_id3, false];
                _next_box setVariable ["KP_crate_push_action", _b_action_id4, false];
                _managed_boxes pushback _next_box;
            };

            _checked_boxes pushback _next_box;
        } foreach _nearammoboxes;

        {
            _next_box = _x;
            if (!(_next_box in _managed_boxes) || !( isNull  attachedTo _next_box )) then {
                _managed_boxes = _managed_boxes - [_next_box];
                _next_box removeAction (_next_box getVariable ["GRLIB_ammo_box_action", -1]);
                _next_box removeAction (_next_box getVariable ["KP_crate_store_action", -1]);
                _next_box removeAction (_next_box getVariable ["KP_crate_value_action", -1]);
                _next_box removeAction (_next_box getVariable ["KP_crate_push_action", -1]);
            }
        } foreach _managed_boxes;

        _checked_areas = [];

        {
            _next_area = _x;
            _area_load = count (attachedObjects _x);

            if (!(_next_area in _managed_areas) && (_area_load > 0)) then {
                    _action_id = _next_area addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_UNSTORE_SUPPLY" + "</t>",{[KP_liberation_supply_crate, (_this select 0), true] call KPLIB_fnc_crateFromStorage;},"",-504,true,true,"","build_confirmed == 0 && (_this distance _target < 12) && (vehicle player == player)"];
                    _next_area setVariable ["KP_supply_unstore_action", _action_id, false];
                    _action_id2 = _next_area addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_UNSTORE_AMMO" + "</t>",{[KP_liberation_ammo_crate, (_this select 0), true] call KPLIB_fnc_crateFromStorage;},"",-505,true,true,"","build_confirmed == 0 && (_this distance _target < 12) && (vehicle player == player)"];
                    _next_area setVariable ["KP_ammo_unstore_action", _action_id2, false];
                    _action_id3 = _next_area addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_UNSTORE_FUEL" + "</t>",{[KP_liberation_fuel_crate, (_this select 0), true] call KPLIB_fnc_crateFromStorage;},"",-506,true,true,"","build_confirmed == 0 && (_this distance _target < 12) && (vehicle player == player)"];
                    _next_area setVariable ["KP_fuel_unstore_action", _action_id3, false];
                    _action_id4 = _next_area addAction ["<t color='#FFFF00'>" + localize "STR_ACTION_SORT_STORAGE" + "</t>",{[(_this select 0)] call KPLIB_fnc_sortStorage;},"",-507,true,true,"","build_confirmed == 0 && (_this distance _target < 12) && (vehicle player == player)"];
                    _next_area setVariable ["KP_storage_sort_action", _action_id4, false];
                    _managed_areas pushback _next_area;
            };

            if ((_next_area in _managed_areas) && _area_load == 0) then {
                _next_area removeAction (_next_area getVariable ["KP_supply_unstore_action", -1]);
                _next_area removeAction (_next_area getVariable ["KP_ammo_unstore_action", -1]);
                _next_area removeAction (_next_area getVariable ["KP_fuel_unstore_action", -1]);
                _next_area removeAction (_next_area getVariable ["KP_storage_sort_action", -1]);
                _managed_areas = _managed_areas - [_next_area];
            };

            _checked_areas pushback _next_area;

        } foreach _nearstorageareas;

        {
            _next_area = _x;
            if (!(_next_area in _checked_areas)) then {
                _managed_areas = _managed_areas - [_next_area];
                _next_area removeAction (_next_area getVariable ["KP_supply_unstore_action", -1]);
                _next_area removeAction (_next_area getVariable ["KP_ammo_unstore_action", -1]);
                _next_area removeAction (_next_area getVariable ["KP_fuel_unstore_action", -1]);
                _next_area removeAction (_next_area getVariable ["KP_storage_sort_action", -1]);
            }

        } foreach _managed_areas;

    };

    sleep 3;

};
