/*
	DONE Step 1: Get list of blufor towns and select one at random
	DONE Step 2: Create a 50m radius marker at town
	*** LATER Step 3: spawn a civilian leader near the center
	DONE Step 4: Create while loop to check if 2 of proper crates have been brought to the point
	DONE Step 5: Delete crates and raise civilian rep by the defined amount

	TODO: 	- Spawn civilians near crate and delete later
			DONE use KP civ rep manager script
			DONE Add check to empty town array
			DONE End secondary mission
			DONE intel notification fixes
			DONE ensure it won't proc with crates in vics
			DONE UI implimentation
			DONE configurable rep increase amount
			DONE change colors
			- fix diags
			

*/

_supplies_present = false;

//select random blufor owned town (capture)

_blufor_towns = [];

//check if blufor_sectors item is contained within sectors_capture and push into array
{
	if (_x in sectors_capture) then {
		_blufor_towns pushBack _x;
	};
} forEach blufor_sectors;

// Check if town array is empty
if(count _blufor_towns == 0) exitWith {
	//if empty, throw error in log and call proper intel notification
	["There are no friendly towns to spawn supplies at!", "ERROR"] call KPLIB_fnc_log; 
	[11] remoteExec ["remote_call_intel"];
};

_objective_town = selectRandom _blufor_towns;


//create 50m radius marker at town
secondary_objective_position = getMarkerPos _objective_town;
secondary_objective_position_marker = secondary_objective_position;
publicVariable "secondary_objective_position_marker";
sleep 1;

//start secondary mission
GRLIB_secondary_in_progress = 3; publicVariable "GRLIB_secondary_in_progress";
[9] remoteExec ["remote_call_intel"];

//create note in log
diag_log format ["Starting Humanitarian Aid objective in %1",_objective_town];

//while loop to wait until 2x supply crates have been brought to within 50m of objective
while {_supplies_present == false} do {

	_supplies_in_zone = [];
	_objects_to_check = [];
	
	//get list of all objects in marker area
	_objects_to_check = vehicles inAreaArray [secondary_objective_position, 50, 50];
	
	
	{		
		//loop through all objects and check if they are the correct supply crates and not currently sitting inside vics
		if (typeOf _x == KP_liberation_supply_crate && isNull attachedTo _x) then {
			
			//if they are the right crate, add to the supplies array to be counted
			_supplies_in_zone pushBack _x;
		};
		
	} forEach _objects_to_check;
	
	//if there are 2 or more of the correct crates, delete them and leave the mission while loop
	if (count _supplies_in_zone > 1) then {
		
		{
			deleteVehicle _x;
		} forEach _supplies_in_zone;
		
		_supplies_present = true;
		
	//if not, wait 5 seconds and check again	
	} else {
		sleep 5;
	};

};

//add civ rep for a completed mission based on value in kp_liberation_config
[KP_liberation_civ_supplies_impact] spawn F_cr_changeCR;

//display end notificaiton
[10] remoteExec ["remote_call_intel"];

//add +1 completed secondary mission for the campaign end screen
stats_secondary_objectives = stats_secondary_objectives + 1;

//declare secondary mission completed
GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress";

//execute a save
sleep 1;
[] spawn KPLIB_fnc_doSave;

//create note in log
diag_log format ["Humanitarian Aid secondary objective complete at %1. Increasing civ rep by %2",_objective_town, KP_liberation_civ_supplies_impact];