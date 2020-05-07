waitUntil {!isNil "save_is_loaded"};
waitUntil {save_is_loaded};

// Check if there is no FOB yet (new campaign)
if (GRLIB_all_fobs isEqualTo []) then {

    // Prebuild FOB (parameter setting) or spawn FOB box
    if (GRLIB_build_first_fob) then {
        // Only accept spawnpoints which are at least 800m away from any sector
        private _y = "";
        private _validPlaces =  sectors_opfor select {
            _y = _x;
            (sectors_allSectors findIf {((markerPos _x) distance2d (markerPos _y)) < 800}) isEqualTo -1
        };

        // Spawn first FOB on random valid spawnpoint
        [markerPos (selectRandom _validPlaces), true] remoteExec ["build_fob_remote_call", 2];
    } else {
        // Spawn FOB box and wait until the first FOB was built
        private _fobbox = objNull;
        while {GRLIB_all_fobs isEqualTo []} do {
            _fobbox = ([FOB_box_typename, FOB_truck_typename] select KP_liberation_fob_vehicle) createVehicle (getposATL base_boxspawn);
            _fobbox setdir getDir base_boxspawn;
            _fobbox setposATL (getposATL base_boxspawn);
            [_fobbox, true] call KPLIB_fnc_clearCargo;
            [_fobbox] call KPLIB_fnc_addObjectInit;

            // If the FOB box has fallen into the sea or is destroyed, start again with spawning a new one
            waitUntil {
                sleep 1;
                !(alive _fobbox) || !(GRLIB_all_fobs isEqualTo []) || (((getPosASL _fobbox) select 2) < 0)
            };
            sleep 10;
        };
        deleteVehicle _fobbox;
    };

    // Wait a short time before paradropping the start resource crates
    waitUntil {sleep 1; !(GRLIB_all_fobs isEqualTo [])};
    if (KP_liberation_tutorial && {["KPLIB_Tasks_Tutorial_Fob"] call BIS_fnc_taskExists}) then {
        waitUntil {sleep 1; ["KPLIB_Tasks_Tutorial_Fob_02"] call BIS_fnc_taskCompleted};
        sleep 3;
    } else {
        sleep 10;
    };

    // Spawn start resource crates and attach them to parachutes
    KPLIB_startCrates = [];
    private _crate = objNull;
    for "_i" from 1 to 6 do {
        _crate = createVehicle [
            (KPLIB_crates select (_i % 3)),
            [((GRLIB_all_fobs select 0) select 0), ((GRLIB_all_fobs select 0) select 1), 150],
            [],
            80,
            "FLY"
        ];
        [_crate, true] call KPLIB_fnc_clearCargo;
        _crate setVariable ["KP_liberation_crate_value", 100, true];
        [_crate, 500] remoteExec ["setMass", _crate];
        [objNull, _crate] call BIS_fnc_curatorObjectEdited;
        if (KP_liberation_ace) then {[_crate, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];};
        KPLIB_startCrates pushBack _crate;
    };

    // Spawn green smoke on the crates short before they hit the ground
    uiSleep 25;
    private _smoke = objNull;
    {
        _smoke = "SmokeShellGreen" createVehicle (getPos _x);
        _smoke attachTo [_x];
    } forEach KPLIB_startCrates;
};
