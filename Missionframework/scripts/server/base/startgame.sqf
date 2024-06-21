waitUntil {!isNil "KPLIB_saveLoaded"};
waitUntil {KPLIB_saveLoaded};

// Check if there is no FOB yet (new campaign)
if (KPLIB_sectors_fob isEqualTo []) then {

    // Prebuild FOB (parameter setting) or spawn FOB box
    if (KPLIB_param_firstFobBuilt) then {
        // Only accept spawnpoints which are at least 800m away from any sector
        private _y = "";
        private _validPlaces =  KPLIB_sectors_spawn select {
            _y = _x;
            (KPLIB_sectors_all findIf {((markerPos _x) distance2d (markerPos _y)) < 800}) isEqualTo -1
        };

        // Spawn first FOB on random valid spawnpoint
        [markerPos (selectRandom _validPlaces), true] remoteExec ["build_fob_remote_call", 2];
    } else {
        // Spawn FOB box and wait until the first FOB was built
        private _fobbox = objNull;
        while {KPLIB_sectors_fob isEqualTo []} do {
            _fobbox = ([KPLIB_b_fobBox, KPLIB_b_fobTruck] select KPLIB_param_fobVehicle) createVehicle (getposATL base_boxspawn);
            _fobbox setdir getDir base_boxspawn;
            _fobbox setposATL (getposATL base_boxspawn);
            [_fobbox, true] call KPLIB_fnc_clearCargo;
            [_fobbox] call KPLIB_fnc_addObjectInit;

            // If the FOB box has fallen into the sea or is destroyed, start again with spawning a new one
            waitUntil {
                sleep 1;
                !(alive _fobbox) || !(KPLIB_sectors_fob isEqualTo []) || (((getPosASL _fobbox) select 2) < 0)
            };
            sleep 10;
        };
        deleteVehicle _fobbox;
    };

    // Wait a short time before paradropping the start resource crates
    waitUntil {sleep 1; !(KPLIB_sectors_fob isEqualTo [])};
    if (KPLIB_param_tutorial && {["KPLIB_Tasks_Tutorial_Fob"] call BIS_fnc_taskExists}) then {
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
            [((KPLIB_sectors_fob select 0) select 0), ((KPLIB_sectors_fob select 0) select 1), 150],
            [],
            80,
            "FLY"
        ];
        [_crate, true] call KPLIB_fnc_clearCargo;
        _crate setVariable ["KPLIB_crate_value", 100, true];
        [_crate, 500] remoteExec ["setMass", _crate];
        [objNull, _crate] call BIS_fnc_curatorObjectEdited;
        _crate lockInventory true;
        if (KPLIB_ace) then {
            [_crate, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
            _crate setVariable ["ace_cargo_noRename", true];
        };
        KPLIB_startCrates pushBack _crate;
    };
    
    publicVariable "KPLIB_startCrates";

    // Spawn green smoke on the crates short before they hit the ground
    uiSleep 25;
    private _smoke = objNull;
    {
        _smoke = "SmokeShellGreen" createVehicle (getPos _x);
        _smoke attachTo [_x];
    } forEach KPLIB_startCrates;
};
