/*
	Creates a secondary objective mission that allow and requires players to bring 200 value supply crate to a 
	random friendly town in order to raise civilian reputation.
	
	Configurable options (KPLIB_config):
	KPLIB_secondary_missions_costs select 3 = intel cost for mission (default 5)
	KPLIB_secondary_objective_civ_supplies_impact = % increase in civilian rep (default 5)
*/

// Initialize variables
_supplies_present = false;
_player_towns = [];

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

// While loop until 2x supply crates have been brought to within 50m of objective
while {_supplies_present isEqualTo false} do {

	_supplies_in_zone = [];
	_objects_to_check = [];
	
	// Get list of all objects in marker area
	_objects_to_check = vehicles inAreaArray [secondary_objective_position, 50, 50];
	
	
	{		
		// Loop through all objects and check if they are the correct supply crates and not currently attached to a vehicle
		if (typeOf _x isEqualTo KPLIB_b_crateSupply && isNull attachedTo _x) then {
			
			// If they are the right crate, add to the supplies array to be counted
			_supplies_in_zone pushBack _x;
		};
		
	} forEach _objects_to_check;
	
	// Initialize total value of supply crates to 0
	_total_value = 0;
	
	// Loop through all supply crates in the zone and add up their values
	{
		_total_value = _total_value + (_x getVariable ["KPLIB_crate_value", 0]);
	} forEach _supplies_in_zone;
	
	// If there are 2 or more of the correct crates, delete them and leave the mission while loop
	if (_total_value > 200) then {
		{
			if ((_total_value - (_x getVariable ["KPLIB_crate_value", 0])) < 200) then {
				// If the crate would bring the total value below 200, leave it unconsumed
				continue;
			} else {
				deleteVehicle _x;
			};
		} forEach _supplies_in_zone;		
		_supplies_present = true;		
	// If not, wait 5 seconds and check again	
	} else {
		sleep 5;
	};
};

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