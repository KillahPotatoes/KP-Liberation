


sleep 1;



addMissionEventHandler ["EachFrame", {
	if([player] call ace_medical_blood_fnc_isBleeding) then {
		_bloodVolume = player getVariable ["ace_medical_bloodVolume", 6.0];
		if(_bloodVolume < 3.5) then {
			player setVariable ["ace_medical_bloodVolume", 3.5];
		};
	};
}]; 



protected_from_deletion = [equipment_box_1];

max_groups_base = 10;



/*
[kfz_opz_1, 120] call ace_cargo_fnc_setSpace; 
[sprit_1, kfz_opz_1, true] call ace_cargo_fnc_loadItem;
[kfz_mun_1, kfz_opz_1, true] call ace_cargo_fnc_loadItem;
[loadout_gren_1, kfz_opz_1, true] call ace_cargo_fnc_loadItem;

[kfz_opz_2, 120] call ace_cargo_fnc_setSpace; 
[loadout_gren_2, kfz_opz_2, true] call ace_cargo_fnc_loadItem;


setTerrainGrid 3.125;
setViewDistance 4000;
setObjectViewDistance [2000,100];


spawn_infantry_equipment = '
removeAllWeapons this;
this addWeapon "arifle_AK12U_F";
this addPrimaryWeaponItem "optic_Arco_AK_arid_F";
this addPrimaryWeaponItem "30rnd_762x39_AK12_Arid_Mag_Tracer_F"; 
for "_i" from 1 to 4 do {this addItemToUniform "ACE_packingBandage";};
this addItemToUniform "ACE_splint";
for "_i" from 1 to 3 do {this addItemToUniform "SmokeShell";};
for "_i" from 1 to 7 do {this addItemToVest "30rnd_762x39_AK12_Arid_Mag_Tracer_F";};
';


_count_opfor = opfor countSide allGroups;
_count_civilian = civilian countSide allGroups;
hint format ['opfor: %1 | civilian: %2', _count_opfor, _count_civilian];
	
*/



ACE_maxWeightCarry = 9999;
ACE_maxWeightDrag = 9999;



// ==============================================================================


spawn_simulation = 'this triggerDynamicSimulation false; ';

spawn_init_required = '
this triggerDynamicSimulation false; 
this forceAddUniform "U_O_R_Gorka_01_F";
this addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 8 do {this addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 2 do {this addItemToUniform "ACE_elasticBandage";};
this addItemToUniform "ACE_morphine";
for "_i" from 1 to 4 do {this addItemToUniform "ACE_epinephrine";};
for "_i" from 1 to 2 do {this addItemToUniform "ACE_salineIV";};
this addItemToUniform "ACE_splint";
this addItemToUniform "ACE_EarPlugs";
this addPrimaryWeaponItem "acc_flashlight";
this enableGunLights "forceOn";
';



spawn_infantry = compileFinal "

	_count_opfor = opfor countSide allGroups;
	_headlessClients = entities 'HeadlessClient_F';
	_humanPlayers = allPlayers - _headlessClients;
	_count_players = count _humanPlayers;
	_max_opfor = max_groups_base + (_count_players / 3);
	_player_equipment = getUnitLoadout (selectRandom _humanPlayers);
	_spawn_init = 'this setUnitLoadout _player_equipment;'+spawn_init_required;
	
	if(_count_opfor < _max_opfor) then { 	
		params ['_calling_trigger'];
		_this_trigger = _calling_trigger;
		_spawn_position = getPosWorld _this_trigger;

		for '_i' from 1 to 4 do {
			_group_spawn = createGroup opfor;
			_group_spawn enableDynamicSimulation true;
			
			'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, _spawn_init, 0.2, 'private']; sleep 1; 
			'O_R_medic_F' createUnit [_spawn_position, _group_spawn, _spawn_init, 0.2, 'private']; sleep 1; 

			_wp1_spawn = _group_spawn addWaypoint [_spawn_position, 200];
			_wp1_spawn setwaypointtype 'MOVE';
			_wp1_spawn setWaypointBehaviour 'AWARE';
			_wp1_spawn setWaypointSpeed 'FULL';

			_wp2_spawn = _group_spawn addWaypoint [_spawn_position, 200];
			_wp2_spawn setwaypointtype 'MOVE';

			_wp3_spawn = _group_spawn addWaypoint [_spawn_position, 0];
			_wp3_spawn setwaypointtype 'CYCLE';
			
			sleep 1;
		};
	};
";



spawn_civilian = compileFinal "

	_count_civilian = civilian countSide allGroups;
	_headlessClients = entities 'HeadlessClient_F';
	_humanPlayers = allPlayers - _headlessClients;
	_count_players = count _humanPlayers;
	_max_civilian = max_groups_base + (_count_players / 3);
	
	if(_count_civilian < _max_civilian) then { 	
		params ['_calling_trigger'];
		_this_trigger = _calling_trigger;
		_spawn_position = getPosWorld _this_trigger;

		for '_i' from 1 to 4 do {
			_group_spawn = createGroup civilian;
			_group_spawn enableDynamicSimulation true;
			
			'C_Man_2_enoch_F' createUnit [_spawn_position, _group_spawn, spawn_simulation, 0.3, 'private']; sleep 1;

			_wp1_spawn = _group_spawn addWaypoint [_spawn_position, 200];
			_wp1_spawn setwaypointtype 'MOVE';
			_wp1_spawn setWaypointBehaviour 'SAFE';
			_wp1_spawn setWaypointSpeed 'LIMITED';

			_wp2_spawn = _group_spawn addWaypoint [_spawn_position, 200];
			_wp2_spawn setwaypointtype 'MOVE';

			_wp3_spawn = _group_spawn addWaypoint [_spawn_position, 0];
			_wp3_spawn setwaypointtype 'CYCLE';
			
			sleep 1;
		};
	};
";



spawn_car = compileFinal "

	_count_opfor = opfor countSide allGroups;
	_headlessClients = entities 'HeadlessClient_F';
	_humanPlayers = allPlayers - _headlessClients;
	_count_players = count _humanPlayers;
	_max_opfor = max_groups_base + (_count_players / 3);
	_player_equipment = getUnitLoadout (selectRandom _humanPlayers);
	_spawn_init = 'this setUnitLoadout _player_equipment;'+spawn_init_required;
	
	if(_count_opfor < _max_opfor) then { 	
		params ['_calling_trigger'];
		_this_trigger = _calling_trigger;
		_spawn_position = getPosWorld _this_trigger;

		_group_spawn = createGroup opfor;
		_group_spawn enableDynamicSimulation true;
		
		_spawn_vehicle = 'O_G_Offroad_01_armed_F' createVehicle _spawn_position; sleep 1;
		_spawn_vehicle enableDynamicSimulation true;
		[
			_spawn_vehicle,
			['Guerilla_09',1], 
			['HideDoor1',0,'HideDoor2',0,'HideDoor3',0,'HideBackpacks',1,'HideBumper1',1,'HideBumper2',0,'HideConstruction',0]
		] call BIS_fnc_initVehicle; sleep 1;
		
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, 'this moveindriver _spawn_vehicle;'+_spawn_init, 0.4, 'private']; sleep 1;
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, 'this moveingunner _spawn_vehicle;'+_spawn_init, 0.4, 'private']; sleep 1;

		_wp1_spawn = _group_spawn addWaypoint [_spawn_position, 300];
		_wp1_spawn setwaypointtype 'MOVE';
		_wp1_spawn setWaypointBehaviour 'AWARE';
		_wp1_spawn setWaypointSpeed 'FULL';

		_wp2_spawn = _group_spawn addWaypoint [_spawn_position, 300];
		_wp2_spawn setwaypointtype 'MOVE';

		_wp3_spawn = _group_spawn addWaypoint [_spawn_position, 0];
		_wp3_spawn setwaypointtype 'CYCLE';
	};
";



spawn_tank = compileFinal "

	_count_opfor = opfor countSide allGroups;
	_headlessClients = entities 'HeadlessClient_F';
	_humanPlayers = allPlayers - _headlessClients;
	_count_players = count _humanPlayers;
	_max_opfor = max_groups_base + (_count_players / 3);
	_player_equipment = getUnitLoadout (selectRandom _humanPlayers);
	_spawn_init = 'this setUnitLoadout _player_equipment;'+spawn_init_required;
	
	if(_count_opfor < _max_opfor) then { 	
		params ['_calling_trigger'];
		_this_trigger = _calling_trigger;
		_spawn_position = getPosWorld _this_trigger;

		_group_spawn = createGroup opfor;
		_group_spawn enableDynamicSimulation true;	
		
		_spawn_vehicle = 'I_APC_Wheeled_03_cannon_F' createVehicle _spawn_position; sleep 1;
		_spawn_vehicle enableDynamicSimulation true;
		_nul = [_spawn_vehicle] execVM 'scripts\damage-tank-explode.sqf'; 
		[
		_spawn_vehicle,
		['Guerilla_01',1], 
		['showCamonetHull',0,'showBags',0,'showBags2',1,'showTools',1,'showSLATHull',0]
		] call BIS_fnc_initVehicle; sleep 1;
		
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, 'this moveindriver _spawn_vehicle;'+_spawn_init, 0.4, 'private']; sleep 1;
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, 'this moveingunner _spawn_vehicle;'+_spawn_init, 0.4, 'private']; sleep 1;
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, 'this moveIncommander _spawn_vehicle;'+_spawn_init, 0.4, 'private']; sleep 1;

		_wp1_spawn = _group_spawn addWaypoint [_spawn_position, 300];
		_wp1_spawn setwaypointtype 'MOVE';
		_wp1_spawn setWaypointBehaviour 'AWARE';
		_wp1_spawn setWaypointSpeed 'FULL';

		_wp2_spawn = _group_spawn addWaypoint [_spawn_position, 300];
		_wp2_spawn setwaypointtype 'MOVE';

		_wp3_spawn = _group_spawn addWaypoint [_spawn_position, 0];
		_wp3_spawn setwaypointtype 'CYCLE';
	};
";



spawn_air = compileFinal "

	params ['_calling_trigger', '_second_trigger'];
	_this_trigger = _calling_trigger;
	_other_trigger = _second_trigger;
	_spawn_position = getPosWorld _other_trigger;
	_target_position = getPosWorld _this_trigger;
	
	_group_spawn = createGroup opfor;
	
	_spawn_vehicle = 'O_Heli_Attack_02_dynamicLoadout_F' createVehicle _spawn_position; sleep 1;
	_spawn_vehicle removeWeaponTurret ['CMFlareLauncher',[-1]];
	
	'O_T_Helipilot_F' createUnit [_spawn_position, _group_spawn, spawn_simulation+'this moveindriver _spawn_vehicle;', 0.4, 'private']; sleep 1;
	'O_T_Helipilot_F' createUnit [_spawn_position, _group_spawn, spawn_simulation+'this moveingunner _spawn_vehicle;', 0.4, 'private']; sleep 1;

	_wp1_spawn = _group_spawn addWaypoint [_target_position, 600];
	_wp1_spawn setwaypointtype 'MOVE';
	_wp1_spawn setWaypointBehaviour 'AWARE';
	_wp1_spawn setWaypointSpeed 'FULL';

	_wp2_spawn = _group_spawn addWaypoint [_target_position, 600];
	_wp2_spawn setwaypointtype 'MOVE';

	_wp3_spawn = _group_spawn addWaypoint [_target_position, 0];
	_wp3_spawn setwaypointtype 'CYCLE';
	
";



spawn_attack = compileFinal "

	params ['_calling_trigger', '_second_trigger'];
	_this_trigger = _calling_trigger;
	_other_trigger = _second_trigger;
	_spawn_position = getPosWorld _other_trigger;
	_target_position = getPosWorld _this_trigger;
	
	for '_i' from 1 to 6 do {
		_group_spawn = createGroup opfor;
		
		_spawn_vehicle = 'O_G_Offroad_01_armed_F' createVehicle _spawn_position; sleep 1;
		[
			_spawn_vehicle,
			['Guerilla_12',1], 
			['HideDoor1',0,'HideDoor2',0,'HideDoor3',0,'HideBackpacks',1,'HideBumper1',1,'HideBumper2',1,'HideConstruction',0]
		] spawn BIS_fnc_initVehicle; sleep 1;
		
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, spawn_simulation+'this moveindriver _spawn_vehicle;', 0.4, 'private']; sleep 1;
		'O_R_Soldier_LAT_F' createUnit [_spawn_position, _group_spawn, spawn_simulation+'this moveingunner _spawn_vehicle;', 0.4, 'private']; sleep 1;

		_wp1_spawn = _group_spawn addWaypoint [_target_position, 300];
		_wp1_spawn setwaypointtype 'MOVE';
		_wp1_spawn setWaypointBehaviour 'AWARE';
		_wp1_spawn setWaypointSpeed 'FULL';

		_wp2_spawn = _group_spawn addWaypoint [_target_position, 300];
		_wp2_spawn setwaypointtype 'MOVE';

		_wp3_spawn = _group_spawn addWaypoint [_target_position, 0];
		_wp3_spawn setwaypointtype 'CYCLE';
		
		 sleep 1;
	};
";



update_groups = compileFinal "
	
	{
		_y = _x;
		
		if not (_y in protected_from_deletion) then { 
			if ( (side _y == opfor) || (side _y == civilian) ) then {
				_delete = true;
				
				{
					if ((leader _y) distance _x < 2000) then {
						_delete = false;
						[_y, 2] setWaypointPosition [getPosASL _x, 600];
					};
				} forEach allPlayers;
				
				if (_delete) then {
					{
						deleteVehicle _x;
					} forEach units _y;
					deleteGroup _y; sleep 1;
				};
				
			};
		};
	} forEach allGroups;
	
	
	{
		if not (_x in protected_from_deletion) then { 
			_y = _x;
			_delete = true;
			
			{
				if (_y distance _x < 2000) then {
					_delete = false;
				};
			} forEach allPlayers;
			
			if (_delete) then {
				deleteVehicle _y; sleep 1;
			};
		};
	} forEach vehicles; 
	
";




while {true} do
{
	
	[] spawn update_groups;
    sleep 30;
	
};













