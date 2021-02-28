//SPAWN SUPPLYBOX CONSOLE:
params [["_resource", KP_liberation_supply_crate],["_amount", 100],["_pos", getPos player]];

private _crate = _resource createVehicle getPos player;
_crate setVariable ["KP_liberation_crate_value", 100, true]; 
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate; 
clearBackpackCargoGlobal _crate; 
clearItemCargoGlobal _crate;

[_crate,3] call ace_cargo_fnc_setSize;
[_crate,3] call ace_cargo_fnc_setSpace;
["ACE_Wheel", _crate] call ace_cargo_fnc_addCargoItem;
["ACE_Track", _crate] call ace_cargo_fnc_addCargoItem;
_crate setVariable ["ACE_isRepairFacility",1];


//SPAWN AMMOBOX CONSOLE:
params [["_resource", KP_liberation_ammo_crate],["_amount", 100],["_pos", getPos player]];

private _crate = _resource createVehicle getPos player;
_crate setVariable ["KP_liberation_crate_value", 100, true]; 
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate; 
clearBackpackCargoGlobal _crate; 
clearItemCargoGlobal _crate;

[_crate,3] call ace_cargo_fnc_setSize;
[_crate, 1200] call ace_rearm_fnc_makeSource;


//SPAWN FUELBOX CONSOLE:
params [["_resource", KP_liberation_fuel_crate],["_amount", 100],["_pos", getPos player]];

private _crate = _resource createVehicle getPos player;
_crate setVariable ["KP_liberation_crate_value", 100, true]; 
clearWeaponCargoGlobal _crate; 
clearMagazineCargoGlobal _crate; 
clearBackpackCargoGlobal _crate; 
clearItemCargoGlobal _crate;

[_crate,3] call ace_cargo_fnc_setSize;
[_crate, 1200] call ace_refuel_fnc_makeSource;



["AmmoboxInit",[this,true]] call BIS_fnc_Arsenal;

nul = [this] execVM 'scripts\loadout.sqf';

_unit = _this select 0;

this and triggerActivated ziel_1;

this addeventhandler ["respawn","_this execVM 'scripts\loadout.sqf'"];

this addeventhandler ["Fired","_this execVM 'scripts\DynamicAISpawn-opfor.sqf'"]; 

this addeventhandler ["MPHit","_this execVM 'scripts\DynamicAISpawn-mercs.sqf'"];

Trigger:  OPFOR > Present; On Activation: {deleteVehicle _x} forEach thisList;

!alive zielobjekt_1;

titleText ["Ziel erfüllt", "PLAIN DOWN", 1];

condition="((rating player) < 0)";

onActivation="player addRating -(rating player)";

this allowDamage false;

{_x addCuratorEditableObjects [(allMissionObjects "All"),TRUE];} count allCurators;

bomb = "Bo_GBU12_LGB" createVehicle getPos thisTrigger;



_unit setvariable ["ace_medical_isMedicalFacility", true]; 
_unit setvariable ["ace_medical_isMedicalVehicle", true];

this setVariable ["ace_rearm_isSupplyVehicle", true]



give_to_zeus = compileFinal "
{
_x addCuratorEditableObjects [vehicles,true];
_x addCuratorEditableObjects [(allMissionObjects 'Man'),false];
_x addCuratorEditableObjects [(allMissionObjects 'Air'),true];
_x addCuratorEditableObjects [(allMissionObjects 'Ammo'),false];

} count allCurators;
";






object addAction [title, script, arguments, priority, showWindow, hideOnUse, shortcut, condition, radius, unconscious, selection, memoryPoint] 

this addAction['Wiederbeleben','scripts\cpr.sqf',nil,0,false,true,'','true',2,true]; 

this addAction['Wiederbeleben','scripts\cpr.sqf',nil,0,false,true,'','(typeof cursortarget) == 'B_soldier_M_F' and _this distance cursortarget < 2']; 

this addAction['Wiederbeleben','scripts\cpr.sqf',nil,0,false,true,'','_this != _target',2,true]; 

this addAction['Heile mich',ace_medical_fnc_treatmentAdvanced_fullHeal,nil,0,false,true,'','true',2,true]; 

this allowDamage false;









hint format ["Stage %1.", stage];




_unit addAction['Wiederbeleben','scripts\cpr.sqf',nil,0,false,true,'','_this != _target',2,true];




{_x setdamage 1} forEach thisList;





this setVariable ["ace_rearm_isSupplyVehicle", true]; 





[this, -10] call ace_refuel_fnc_makeSource; 
[this, true] call ace_dragging_fnc_setCarryable;
[this, true, [0, 1, 0], 0] call ace_dragging_fnc_setDraggable;







Huber Sepp UID:
76561197993044168




wp1_spawn = group_spawn addWaypoint [target_position, 0];
wp1_spawn setwaypointtype 'MOVE';
wp1_spawn setWaypointBehaviour 'AWARE';
wp1_spawn setWaypointSpeed 'FULL';
wp1_spawn setWaypointStatements ['true', '{deleteVehicle _x} forEach thisList;'];






Fahrzeuge Oliv

this setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0.15,0.15,0.09,3)"];

this setObjectTextureGlobal [1, "#(rgb,8,8,3)color(0.15,0.15,0.09,3)"];

this setObjectTextureGlobal [2, "#(rgb,8,8,3)color(0.15,0.15,0.09,3)"];


Fahrzeuge Dunkelgrün

this setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0.11,0.11,0.08,3)"];

this setObjectTextureGlobal[0,"#(rgb,8,8,3)color(0.13,0.14,0.09,3)"]; 


Fahrzeuge Tropentarn

this setObjectTextureGlobal [1, "#(rgb,8,8,3)color(0.26,0.23,0.17,3)"];





this setHitPointDamage ["HitLFWheel", 1]; 
this setHitPointDamage ["HitLF2Wheel", 1]; 
this setHitPointDamage ["HitLMWheel", 1]; 
this setHitPointDamage ["HitLBWheel", 1]; 
this setHitPointDamage ["HitRFWheel", 1]; 
this setHitPointDamage ["HitRF2Wheel", 1]; 
this setHitPointDamage ["HitRMWheel", 1]; 
this setHitPointDamage ["HitRBWheel", 1]; 
this setHitPointDamage ["HitEngine", 1];
this allowDamage false;







this addeventhandler ["Fired",  
{
_this spawn
{
_bullet = _this select 6;
_pos = getPosATL _bullet;
while {alive _bullet} do {_pos = getPosATL _bullet;};
_bomb = "Bo_GBU12_LGB" createVehicle _pos;
_bomb setVectorUp [0, 9, 0.1];
};
}];








spawn_vehicle removeWeaponTurret ['CMFlareLauncher',[-1]];





// Place in initPlayerLocal.sqf:

if (didJIP) then {
player setpos getmarkerpos 'respawn_west';
};










this addAction['Truppführer','scripts\loadout-trpfhr.sqf',nil,0,false,true,'','true',2,true];

this addAction['Sanitäter','scripts\loadout-san.sqf',nil,0,false,true,'','true',2,true];

this addAction['Pionier','scripts\loadout-pio.sqf',nil,0,false,true,'','true',2,true];

this addAction['MG3-Schütze','scripts\loadout-mg3.sqf',nil,0,false,true,'','true',2,true];

this addAction['Schütze','scripts\loadout-schtz.sqf',nil,0,false,true,'','true',2,true];

this addAction['Kampfschwimmer','scripts\loadout-kmpfschwmr.sqf',nil,0,false,true,'','true',2,true];








//define unit as medical-/repair-facility ACE:
_unit setVariable ["ACE_medical_isMedicalFacility", true];
_unit setVariable ["ACE_isRepairVehicle", 1];
_unit setVariable ["ACE_isRepairFacility", 1];
//medic/engineer/eod/pilot
_unit setVariable ["ACE_medical_medicClass", 2];
_unit setVariable ["ACE_isEngineer", 2];
_unit setVariable ["ACE_isEOD", true];
_unit setVariable ["ACE_GForceCoef", 0.3];
//ACE-AI (medical):
_unit setVariable ["ACE_medical_enableUnconsciousnessAI",1];
_unit setVariable ["ACE_medical_enableRevive",1];
_unit setVariable ["ACE_medical_preventInstaDeath",true];







_unit setSpeaker "NoVoice";

_unit setUnitTrait ["Medic",true];
_unit setUnitTrait ["Engineer",true];
_unit setUnitTrait ["explosiveSpecialist",true];
_unit setVariable ["ACE_medical_medicClass", 2];
_unit setVariable ["ACE_isEngineer", 1];








this addEventHandler ["Hit", {call targets_hit;}];







this disableAI 'ALL';





// revive system for single ai 
this setVariable ["ace_medical_enableRevive", 2, true];
this setVariable ["ace_medical_enableMedical", true, true];
[this] call ace_medical_fnc_init;
this setVariable ["bis_fnc_moduleRemoteControl_owner", this, true];







if(!isNil "zeus_player_1") then {
hint "YES";
} else {
hint "NO";
};







this allowDamage false; 

this enableWeaponDisassembly false; 

this addeventhandler ["Fired",   
{ 
_this spawn 
{ 
_bullet = _this select 6; 
_pos = getPosATL _bullet; 
while {alive _bullet} do {_pos = getPosATL _bullet;}; 
_bomb1 = "Bo_GBU12_LGB" createVehicle _pos; 
_bomb1 setVectorUp [0, 9, 0.1]; 
_bomb2 = "Bo_GBU12_LGB" createVehicle _pos; 
_bomb2 setVectorUp [0, 9, 0.1]; 
_bomb3 = "Bo_GBU12_LGB" createVehicle _pos; 
_bomb3 setVectorUp [0, 9, 0.1]; 
}; 
}]; 

[this, kfz_0] call ace_cargo_fnc_loadItem; 




[this, true, [0, 3, 0], 0] call ace_dragging_fnc_setCarryable; 
[this, true, [0, 3, 0], 0] call ace_dragging_fnc_setDraggable; 





// KSK
[this, true, [0, 2, 0], 0] call ace_dragging_fnc_setCarryable; 
[this, true, [0, 2, 0], 0] call ace_dragging_fnc_setDraggable; 

[this call kv13_ksk_fnc_addActionsTarn]; 

[this call kv13_ksk_fnc_addActionsBasic]; 

[this call kv13_ksk_fnc_addActionsSpezial]; 

[this call kv13_ksk_fnc_addActionsOptional];



// PnzGren
[this, true, [0, 2, 0], 0] call ace_dragging_fnc_setCarryable;  
[this, true, [0, 2, 0], 0] call ace_dragging_fnc_setDraggable; 

[this call kv13_pzgren_fnc_addActionsAll]; 

[this call kv13_pzgren_fnc_addActionsAdditional];  



// Sonstige
[this call kv13_fnc_addActionsAusbildungFleck]; 
[this call kv13_fnc_addActionsAusbildungTrop]; 
[this call kv13_fnc_addActionsKSKFleck]; 
[this call kv13_fnc_addActionsKSKSpezial]; 
[this call kv13_fnc_addActionsKSKTrop]; 
[this call kv13_fnc_addActionsPanzergrenFleck]; 
[this call kv13_fnc_addActionsPanzergrenTrop]; 
[this call kv13_fnc_addActionsUSMCDD]; 
[this call kv13_fnc_addActionsUSMCWD]; 
[this call kv13_fnc_addActionsUSOCP]; 
[this call kv13_fnc_addActionsUSUCP]; 

[this call kv13_pzgren_fnc_addActionsBasicKomplett]; 
[this call kv13_pzgren_fnc_addActionsBasic]; 
[this call kv13_pzgren_fnc_addActionsAdditional]; 






this allowDamage false; 

[this call kv13_pzgren_fnc_addActionsBasicKomplett]; 

[this call kv13_pzgren_fnc_addActionsAdditional]; 

this addAction['Truppführer','scripts\loadout-trpfhr.sqf',nil,0,false,true,'','true',3,true];

this addAction['Sanitäter','scripts\loadout-san.sqf',nil,0,false,true,'','true',3,true];

this addAction['Pionier','scripts\loadout-pio.sqf',nil,0,false,true,'','true',3,true];

this addAction['MG3-Schütze','scripts\loadout-mg3.sqf',nil,0,false,true,'','true',3,true]; 

this addAction['AT','scripts\loadout-at.sqf',nil,0,false,true,'','true',3,true];

this addAction['AA','scripts\loadout-aa.sqf',nil,0,false,true,'','true',3,true];

this addAction['Schütze','scripts\loadout-schtz.sqf',nil,0,false,true,'','true',3,true];




private _myArray = ["a", "b", "c"];




Condition:
this and {_x isKindOf "Man" or _x isKindOf "LandVehicle"} count thisList == 1


On Activation:
[thisTrigger] spawn spawn_civilian;


On Deactivation:
_cleanUp = allUnits inAreaArray thisTrigger; 
{
	if not (_x in protected_from_deletion) then {
		deleteVehicle _x;
	};
} forEach _cleanUp; 

_cleanUp = vehicles inAreaArray thisTrigger; 
{
	if not (_x in protected_from_deletion) then {
		deleteVehicle _x;
	};
} forEach _cleanUp; 








[kfz_opz_1, 120] call ace_cargo_fnc_setSpace; 
[sprit_1, kfz_opz_1, true] call ace_cargo_fnc_loadItem;
[kfz_mun_1, kfz_opz_1, true] call ace_cargo_fnc_loadItem;
[loadout_gren_1, kfz_opz_1, true] call ace_cargo_fnc_loadItem;







addMissionEventHandler ["EachFrame", {
	if([player] call ace_medical_blood_fnc_isBleeding) then {
		_bloodVolume = player getVariable ["ace_medical_bloodVolume", 6.0];
		if(_bloodVolume < 3.5) then {
			player setVariable ["ace_medical_bloodVolume", 3.5];
		};
	};
}]; 




switch (spawn_trigger_number) do {
	case 1: {thisList = list spawn_trigger_area_1; };
	case 2: {thisList = list spawn_trigger_area_2; };
	case 3: {thisList = list spawn_trigger_area_3; };
	case 4: {thisList = list spawn_trigger_area_4; };
	case 5: {thisList = list spawn_trigger_area_5; };
	case 6: {thisList = list spawn_trigger_area_6; };
	case 7: {thisList = list spawn_trigger_area_7; };
	case 8: {thisList = list spawn_trigger_area_8; };
	case 9: {thisList = list spawn_trigger_area_9; };
	case 10: {thisList = list spawn_trigger_area_10; };
	case 11: {thisList = list spawn_trigger_area_11; };
	case 12: {thisList = list spawn_trigger_area_12; };
	case 13: {thisList = list spawn_trigger_area_13; };
	case 14: {thisList = list spawn_trigger_area_14; };
	case 101: {thisList = list spawn_boat_trigger_area_1; };
	case 102: {thisList = list spawn_boat_trigger_area_2; };
};






_cleanUp = allUnits inAreaArray thisTrigger;  
{ 
 if not (_x in protected_from_deletion) then { 
  deleteVehicle _x; 
 }; 
} forEach _cleanUp;  
 
_cleanUp = vehicles inAreaArray thisTrigger;  
{ 
 if not (_x in protected_from_deletion) then { 
  deleteVehicle _x; 
 }; 
} forEach _cleanUp; 





nul = [this] execVM 'scripts\start.sqf'; 
this addeventhandler ['respawn','_this execVM "scripts\respawn.sqf"']; 
this allowDamage false;





