waitUntil {!isNil "save_is_loaded"};
waitUntil {save_is_loaded};

huron = objNull;

// Detect possible huron from loaded save data
private _savedHuron = vehicles select {(toLower (typeOf _x)) isEqualTo (toLower huron_typename)};
if !(_savedHuron isEqualTo []) then {
    huron = _savedHuron select 0;
};

while {true} do {
    // Spawn new huron if not loaded or destroyed
    if !(alive huron) then {
        huron = huron_typename createVehicle [(getposATL huronspawn) select 0, (getposATL huronspawn) select 1, ((getposATL huronspawn) select 2) + 0.2];
        huron enableSimulationGlobal false;
        huron allowdamage false;
        huron setDir (getDir huronspawn);
        huron setPosATL (getposATL huronspawn);
        huron setDamage 0;
        sleep 0.5;
        huron enableSimulationGlobal true;
        huron setDamage 0;
        huron allowdamage true;
        [huron] call KPLIB_fnc_addObjectInit;
    };
    [huron] call KPLIB_fnc_clearCargo;
    huron setVariable ["ace_medical_isMedicalVehicle", true, true];
    publicVariable "huron";

    // Wait until huron is destroyed to respawn it
    waitUntil {sleep 5; !alive huron};
    stats_spartan_respawns = stats_spartan_respawns + 1;
    sleep 10;

    // Delete wreck, if near startbase
    if (huron distance startbase < 500) then {
        deletevehicle huron;
    };
};
