waitUntil {!isNil "huron_typename"};

// Classnames of objects which should be added as editable for Zeus
private _vehicleClassnames = [toLower huron_typename];
{
    _vehicleClassnames append _x;
} forEach [
    KPLIB_crates,
    KPLIB_b_light_classes,
    KPLIB_b_heavy_classes,
    KPLIB_b_air_classes,
    KPLIB_b_static_classes,
    KPLIB_b_support_classes
];
if (KP_liberation_enemies_zeus) then {_vehicleClassnames append KPLIB_o_allVeh_classes;};

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
        && {((str _x) find "BIS_SUPP_HQ_") isEqualTo -1}                                        // Not a HQ entity from support module
    };

    // Add vehicles
    _valids append (vehicles select {
        (alive _x)                                                                              // Alive
        && {
            ((toLower (typeOf _x)) in _vehicleClassnames)                                       // In valid classnames
            || (_x getVariable ["KPLIB_captured", false])                                       // or captured
            || (_x getVariable ["KPLIB_seized", false])                                         // or seized
        }
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
