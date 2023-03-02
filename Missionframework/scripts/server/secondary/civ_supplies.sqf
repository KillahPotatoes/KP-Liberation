/*
	Creates a secondary objective mission to allow players to bring 2x supply crates to a 
	random friendly town in order to raise civilian rep.
	
	Configurable options (kp_liberation_config):
	KPLIB_secondary_missions_costs select 3 = intel cost for mission (default 5)
	KP_liberation_civ_supplies_impact = % increase in civilian rep (default 5)
*/

_supplies_present = false;

//select random blufor owned town (capture)

_player_towns = [];

//check if KPLIB_sectors_player item is contained within KPLIB_sectors_city and push into array
{
	if (_x in KPLIB_sectors_city) then {
		_player_towns pushBack _x;
	};
} forEach KPLIB_sectors_player;

// Check if town array is empty
if(count _player_towns isEqualTo 0) exitWith {
	//if empty, throw error in log and call proper intel notification
	["There are no friendly towns to spawn supplies at!", "ERROR"] call KPLIB_fnc_log; 
	[11] remoteExec ["remote_call_intel"];
};

_objective_town = selectRandom _player_towns;


//create 50m radius marker at town
secondary_objective_position = getMarkerPos _objective_town;
secondary_objective_position_marker = secondary_objective_position;
publicVariable "secondary_objective_position_marker";
sleep 1;

//start secondary mission
KPLIB_secondary_in_progress = 3; publicVariable "KPLIB_secondary_in_progress";
[9] remoteExec ["remote_call_intel"];

//create note in log
diag_log format ["Starting Humanitarian Aid objective in %1",_objective_town];

//while loop to wait until 2x supply crates have been brought to within 50m of objective
while {_supplies_present isEqualTo false} do {

	_supplies_in_zone = [];
	_objects_to_check = [];
	
	//get list of all objects in marker area
	_objects_to_check = vehicles inAreaArray [secondary_objective_position, 50, 50];
	
	
	{		
		//loop through all objects and check if they are the correct supply crates and not currently sitting inside vics
		if (typeOf _x isEqualTo KPLIB_b_crateSupply && isNull attachedTo _x) then {
			
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
KPLIB_secondary_in_progress = -1; publicVariable "KPLIB_secondary_in_progress";

//execute a save
sleep 1;
[] spawn KPLIB_fnc_doSave;

//create note in log
diag_log format ["Humanitarian Aid secondary objective complete at %1. Increasing civ rep by %2",_objective_town, KP_liberation_civ_supplies_impact];