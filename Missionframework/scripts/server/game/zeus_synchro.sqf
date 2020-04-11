waitUntil {!isNil "huron_typename"};

// Classnames of objects which should be added as editable for Zeus
private _vehicleClassnames = [huron_typename];
_vehicleClassnames append KP_liberation_crates;
_vehicleClassnames append ((light_vehicles + heavy_vehicles + air_vehicles + static_vehicles + support_vehicles) apply {_x select 0});
if (KP_liberation_enemies_zeus) then {_vehicleClassnames append all_hostile_classnames};

private _valids = [];
private _toRemove = [];
private _toAdd = [];

while {true} do {
    waitUntil {sleep 1; !(allCurators isEqualTo [])};

    // Add units
    _valids = allUnits select {
        (alive _x)                                                                              // Alive
        && {
            (KP_liberation_enemies_zeus && {!(side (group _x) isEqualTo GRLIB_side_civilian)})  // Not civilian side, if enemy adding is enabled
            || {side (group _x) isEqualTo GRLIB_side_friendly}                                  // Player side if enemy adding is disabled
        }
    };

    // Add vehicles
    _valids append (vehicles select {
        (alive _x)                                                                              // Alive
        && {((typeof _x) in _vehicleClassnames) || (_x getVariable ["GRLIB_captured", false])}  // In valid classnames list or captured
        && {isNull (attachedTo _x)}                                                             // Not attached to something
    });

    // Add playable units
    _valids append switchableUnits;
    _valids append playableUnits;

    {
        // Remove death or attached units
        _toRemove = ((curatorEditableObjects _x) select {!(alive _x) || !(isNull (attachedTo _x))});

        // Filter already added units of this curator
        _toAdd = _valids - (curatorEditableObjects _x);

        // Add and remove units
        _x addCuratorEditableObjects [_toAdd, true];
        _x removeCuratorEditableObjects [_toRemove, true];
    } forEach allCurators;
    sleep 9;
};
