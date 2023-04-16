// Initialize variables
_fuels_present = false;
_player_factory = [];
_required_value = 200;

// Find a random friendly factory owned by the player
{
    if (_x in KPLIB_sectors_factory) then {
        _player_factory pushBack _x;
    };
} forEach KPLIB_sectors_player;

// Check if factory array is empty
if(count _player_factory isEqualTo 0) exitWith {
    // If empty, throw error in log and call proper intel notification
    ["There are no friendly factory to spawn fuels at!", "ERROR"] call KPLIB_fnc_log; 
    [14] remoteExec ["remote_call_intel"];
};

// Select a random factory from the player-owned towns array for the fuel drop-off
_objective_factory = selectRandom _player_factory;


// Create a 50m radius marker at the selected factory
secondary_objective_position = getMarkerPos _objective_factory;
secondary_objective_position_marker = secondary_objective_position;
publicVariable "secondary_objective_position_marker";
sleep 1;

// Start the secondary mission
KPLIB_secondary_in_progress = 3; publicVariable "KPLIB_secondary_in_progress";
[12] remoteExec ["remote_call_intel"];

// Add a note in the log
[format ["Starting Bingo Fuel objective in %1", _objective_factory], "NOTIFICATION"] call KPLIB_fnc_log;


// Loop until 2x fuel crates have been brought to within 50m of objective
while {!_fuels_present} do {

    // Initialize total value of fuel crates to 0
    _total_value = 0;
    // Initialize _fuels_in_zone is array
    _fuels_in_zone = [];

    // Get list of all objects within the fuel check radius of the marker
    _objects_to_check = vehicles inAreaArray [secondary_objective_position, 50, 50];
    
    // Loop through all objects and check if they are the correct fuel crates and not currently attached to a vehicle
    {
        if (typeOf _x isEqualTo KPLIB_b_crateFuel && isNull attachedTo _x) then {
            // If they are the right crate, add to the fuels array to be counted
            _fuels_in_zone pushBack _x;
        };
    } forEach _objects_to_check;

    // If there are no fuels, wait for a period of time and check again
    if (count _fuels_in_zone isEqualTo 0) then {
        hintSilent "";
        sleep 5;
    } else {
    
        // Loop through all fuel crates in the zone and add up their values
        {_total_value = _total_value + (_x getVariable ["KPLIB_crate_value", 0]);} forEach _fuels_in_zone;
        
        // If the total value is less than the required value, wait for a period of time and check again
        if (_total_value < _required_value) then {
        
            // Notify players of current fuel status in area
            hintSilent format ["Fuels in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 5];
            sleep 1;
            hintSilent format ["Fuels in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 4];
            sleep 1;
            hintSilent format ["Fuels in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 3];
            sleep 1;
            hintSilent format ["Fuels in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 2];
            sleep 1;
            hintSilent format ["Fuels in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 1];
            sleep 1;
            hintSilent format ["Fuels in area: %1/%2\nChecking...", _total_value, _required_value];
            sleep 1;
            
        } else {
            
            _consume_value = _required_value;
            {
                private _crate_value = _x getVariable ["KPLIB_crate_value",0];
                if (_consume_value != 0) then {
                    if (_consume_value >= _crate_value) then {
                        _consume_value = _consume_value - _crate_value;
                        _total_value = _total_value - _crate_value;
                        deleteVehicle _x;
                    } else {
                        _x setVariable ["KPLIB_crate_value", _crate_value - _consume_value, true];
                        _consume_value = 0;
                    };
                } else {
                };
            } forEach _fuels_in_zone;
            if (_consume_value == 0) then {_fuels_present = true;};
        };
    };
};
hintSilent "Secondary Objective Completed!";

private _amount = 6;
private _spawnPos = [];
private _j = 0;

for "_i" from 1 to _amount do {
    while {_spawnPos isEqualTo []} do {
        _j = _j + 1;
        _spawnPos = ((markerPos _objective_factory) getPos [random 50, random 360]) findEmptyPosition [5, 45, KPLIB_b_crateAmmo];
        if (_j isEqualTo 10) exitWith {};
    };
    if !(_spawnPos isEqualTo []) then {
        [selectRandom KPLIB_crates, 100, _spawnpos] call KPLIB_fnc_createCrate;
        _spawnPos = [];
    } else {
        ["No suitable spawn position found."] call BIS_fnc_error;
        [format ["Couldn't find spawn position for resource crate for sector %1", _objective_factory], "WARNING"] call KPLIB_fnc_log;
    };
};

[13] remoteExec ["remote_call_intel"];
stats_secondary_objectives = stats_secondary_objectives + 1;
KPLIB_secondary_in_progress = -1; publicVariable "KPLIB_secondary_in_progress";
sleep 1;
[] spawn KPLIB_fnc_doSave;
[format ["Bingo Fuel secondary objective complete at %1.",_objective_factory], "NOTIFICATION"] call KPLIB_fnc_log;
sleep 5;
hintSilent "";