/*
    Creates a secondary objective mission that allows and requires players to bring 200 value supply crates to a 
    random friendly town in order to raise civilian reputation.
    
    Configurable options (KPLIB_config):
    KPLIB_secondary_missions_costs select 3 = intel cost for mission (default 5)
    KPLIB_secondary_objective_civ_supplies_impact = % increase in civilian rep (default 5)
*/

// Initialize variables
_supplies_present = false;
_player_towns = [];
_required_value = 200; //should move to be KPLIB_config?

// Find a random friendly town owned by the player
{
    if (_x in KPLIB_sectors_city) then {
        _player_towns pushBack _x;
    };
} forEach KPLIB_sectors_player;

// Check if town array is empty
if(count _player_towns isEqualTo 0) exitWith {
    // If empty, throw error in log and call proper intel notification
    ["There are no friendly towns to spawn supplies at!", "ERROR"] call KPLIB_fnc_log; 
    [11] remoteExec ["remote_call_intel"];
};

// Select a random town from the player-owned towns array for the supply drop-off
_objective_town = selectRandom _player_towns;


// Create a 50m radius marker at the selected town
secondary_objective_position = getMarkerPos _objective_town;
secondary_objective_position_marker = secondary_objective_position;
publicVariable "secondary_objective_position_marker";
sleep 1;

// Start the secondary mission
KPLIB_secondary_in_progress = 3; publicVariable "KPLIB_secondary_in_progress";
[9] remoteExec ["remote_call_intel"];

// Add a note in the log
[format ["Starting Humanitarian Aid objective in %1", _objective_town], "NOTIFICATION"] call KPLIB_fnc_log;


// Loop until 2x supply crates have been brought to within 50m of objective
while {!_supplies_present} do {

    // Initialize total value of supply crates to 0
    _total_value = 0;
    // Initialize _supplies_in_zone is array
    _supplies_in_zone = [];

    // Get list of all objects within the supply check radius of the marker
    _objects_to_check = vehicles inAreaArray [secondary_objective_position, 50, 50];
    
    // Loop through all objects and check if they are the correct supply crates and not currently attached to a vehicle
    {
        if (typeOf _x isEqualTo KPLIB_b_crateSupply && isNull attachedTo _x) then {
            // If they are the right crate, add to the supplies array to be counted
            _supplies_in_zone pushBack _x;
        };
    } forEach _objects_to_check;

    // If there are no supplies, wait for a period of time and check again
    if (count _supplies_in_zone isEqualTo 0) then {
        hintSilent "";
        sleep 5;
    } else {
    
        // Loop through all supply crates in the zone and add up their values
        {_total_value = _total_value + (_x getVariable ["KPLIB_crate_value", 0]);} forEach _supplies_in_zone;
        
        // If the total value is less than the required value, wait for a period of time and check again
        if (_total_value < _required_value) then {
        
            // Notify players of current supply status in area
            hintSilent format ["Supplies in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 5];
            sleep 1;
            hintSilent format ["Supplies in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 4];
            sleep 1;
            hintSilent format ["Supplies in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 3];
            sleep 1;
            hintSilent format ["Supplies in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 2];
            sleep 1;
            hintSilent format ["Supplies in area: %1/%2\nNext check will run after %3 seconds...", _total_value, _required_value, 1];
            sleep 1;
            hintSilent format ["Supplies in area: %1/%2\nChecking...", _total_value, _required_value];
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
            } forEach _supplies_in_zone;
            if (_consume_value == 0) then {_supplies_present = true;};
        };
    };
};
hintSilent "Secondary Objective Completed!";

// Add civilian rep for a completed mission based on value in KPLIB_config
[KPLIB_secondary_objective_civ_supplies_impact] spawn F_cr_changeCR;

// Display end notification
[10] remoteExec ["remote_call_intel"];

// Add +1 completed secondary mission for the campaign end screen
stats_secondary_objectives = stats_secondary_objectives + 1;

// declare secondary mission completed
KPLIB_secondary_in_progress = -1; publicVariable "KPLIB_secondary_in_progress";

// execute a save
sleep 1;
[] spawn KPLIB_fnc_doSave;

//create note in log
[format ["Humanitarian Aid secondary objective complete at %1. Increasing civ rep by %2",_objective_town, KPLIB_secondary_objective_civ_supplies_impact], "NOTIFICATION"] call KPLIB_fnc_log;
sleep 5;
hintSilent "";