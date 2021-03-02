
KPLIB_init = false;

// Version of the KP Liberation framework
KP_liberation_version = [0, 96, "7a"];

enableSaving [ false, false ];

if (isDedicated) then {debug_source = "Server";} else {debug_source = name player;};

[] call KPLIB_fnc_initSectors;
if (!isServer) then {waitUntil {!isNil "KPLIB_initServer"};};
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_liberation_config.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\init_presets.sqf";
[] call compileFinal preprocessFileLineNumbers "kp_objectInits.sqf";

// Activate selected player menu. If CBA isn't loaded -> fallback to GREUH
if (KPPLM_CBA && KP_liberation_playermenu) then {
    [] call KPPLM_fnc_postInit;
} else {
    [] execVM "GREUH\scripts\GREUH_activate.sqf";
};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
    [] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
    execVM "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
    // Get mission version and readable world name for Discord rich presence
    [
        ["UpdateDetails", [localize "STR_MISSION_VERSION", "on", getText (configfile >> "CfgWorlds" >> worldName >> "description")] joinString " "]
    ] call (missionNamespace getVariable ["DiscordRichPresence_fnc_update", {}]);

    // Add EH for curator to add kill manager and object init recognition for zeus spawned units/vehicles
    {
        _x addEventHandler ["CuratorObjectPlaced", {[_this select 1] call KPLIB_fnc_handlePlacedZeusObject;}];
    } forEach allCurators;

    waitUntil {alive player};
    if (debug_source != name player) then {debug_source = name player};
    [] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
    setViewDistance 1600;
};

// Execute fnc_reviveInit again (by default it executes in postInit)
if ((isNil {player getVariable "bis_revive_ehHandleHeal"} || isDedicated) && !(bis_reviveParam_mode == 0)) then {
    [] call bis_fnc_reviveInit;
};




// MilSimUnited ===========================================================================

["CargoNet_01_box_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,3] call ace_cargo_fnc_setSize;
	[_vehicle,3] call ace_cargo_fnc_setSpace;
	["ACE_Wheel", _vehicle] call ace_cargo_fnc_addCargoItem;
	["ACE_Track", _vehicle] call ace_cargo_fnc_addCargoItem;
	_vehicle setVariable ["ACE_isRepairFacility",1];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_CargoNet_01_ammo_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,3] call ace_cargo_fnc_setSize;
	[_vehicle, 1200] call ace_rearm_fnc_makeSource
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["CargoNet_01_barrels_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,3] call ace_cargo_fnc_setSize;
    [_vehicle, 1200] call ace_refuel_fnc_makeSource;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["RHS_MELB_MH6M", "InitPost", {
    params ["_vehicle"];
	[_vehicle,4] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["RHS_MELB_AH6M", "InitPost", {
    params ["_vehicle"];
	[_vehicle,4] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["rhsusf_M977A4_BKIT_M2_usarmy_wd", "InitPost", {
    params ["_vehicle"];
	[_vehicle,12] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_Heli_Transport_03_unarmed_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,12] call ace_cargo_fnc_setSpace;
	[
		_vehicle,
		["Green",1], 
		true
	] call BIS_fnc_initVehicle;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["RHS_CH_47F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,12] call ace_cargo_fnc_setSpace;
	[
		_vehicle,
		["Green",1], 
		true
	] call BIS_fnc_initVehicle;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["RHS_Mi8mt_vdv", "InitPost", {
    params ["_vehicle"];
	[_vehicle,8] call ace_cargo_fnc_setSpace;
	[
		_vehicle,
		["Green",1], 
		true
	] call BIS_fnc_initVehicle;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["RHS_UH60M", "InitPost", {
    params ["_vehicle"];
	[_vehicle,4] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["RHS_Mi8MTV3_heavy_vdv", "InitPost", {
    params ["_vehicle"];
	[_vehicle,4] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_Boat_Transport_01_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,3] call ace_cargo_fnc_setSize;
	[_vehicle,3] call ace_cargo_fnc_setSpace;
	[_vehicle, true, [0, 3, 0], 0] call ace_dragging_fnc_setCarryable;
	[_vehicle, true, [0, 3, 0], 0] call ace_dragging_fnc_setDraggable;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["I_C_Boat_Transport_02_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,4] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_Boat_Armed_01_minigun_F", "InitPost", {
    params ["_vehicle"];
	[_vehicle,4] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["rhsusf_mkvsoc", "InitPost", {
    params ["_vehicle"];
	[_vehicle,12] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["rhs_kamaz5350_open_msv", "InitPost", {
    params ["_vehicle"];
	[_vehicle,8] call ace_cargo_fnc_setSpace;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["O_T_MBT_04_command_F", "InitPost", {
    params ["_vehicle"];
	[
	_vehicle,
		["Jungle",1], 
		["showCamonetHull",0,"showCamonetTurret",0]
	] call BIS_fnc_initVehicle;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["rhs_btr80a_msv", "InitPost", {
    params ["_vehicle"];
	_vehicle addEventHandler ["HandleDamage", {  
		private _unit = _this select 0;
		private _hitSelection = _this select 1;
		private _damage = _this select 2;
		if (_hitSelection isEqualTo "") then {(damage _unit) + (_damage * 0.04)} else {(_unit getHit _hitSelection) + (_damage * 0.04)};
	}];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["O_T_APC_Tracked_02_cannon_ghex_F", "InitPost", {
    params ["_vehicle"];
	_vehicle addEventHandler ["HandleDamage", {  
		private _damage = _this select 2;
		_damage = _damage * 1.25;
		_damage;
	}];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_soldier_LAT_F", "InitPost", {
	params ["_vehicle"];
	_vehicle setSpeaker "NoVoice";
	_vehicle setUnitTrait ["Medic",true];
	_vehicle setUnitTrait ["Engineer",true];
	_vehicle setUnitTrait ["explosiveSpecialist",true];
	_vehicle setVariable ["ACE_medical_medicClass", 1];
	_vehicle setVariable ["ACE_isEngineer", 1];
	_vehicle setUnitAbility 2;
	removeAllWeapons _vehicle;
	removeAllItems _vehicle;
	removeAllAssignedItems _vehicle;
	removeUniform _vehicle;
	removeVest _vehicle;
	removeBackpack _vehicle;
	removeHeadgear _vehicle;
	removeGoggles _vehicle;
	_vehicle forceAddUniform "U_O_R_Gorka_01_F";
	_vehicle addVest "V_CarrierRigKBT_01_light_Olive_F";
	_vehicle addBackpack "B_AssaultPack_rgr";
	_vehicle addWeapon "rhs_weap_ak105_zenitco01_b33";
	_vehicle addPrimaryWeaponItem "rhs_acc_dtk";
	_vehicle addPrimaryWeaponItem "rhsusf_acc_su230";
	_vehicle addPrimaryWeaponItem "30Rnd_545x39_Mag_Tracer_F";
	_vehicle addWeapon "launch_NLAW_F";
	for "_i" from 1 to 4 do {_vehicle addItemToUniform "ACE_tourniquet";};
	for "_i" from 1 to 2 do {_vehicle addItemToUniform "ACE_splint";};
	_vehicle addItemToUniform "ACE_morphine";
	for "_i" from 1 to 2 do {_vehicle addItemToUniform "ACE_epinephrine";};
	_vehicle addItemToUniform "ACE_MapTools";
	_vehicle addItemToUniform "ACE_microDAGR";
	_vehicle addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 16 do {_vehicle addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 2 do {_vehicle addItemToUniform "ACE_fieldDressing";};
	_vehicle addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 4 do {_vehicle addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 5 do {_vehicle addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_vehicle addItemToVest "30Rnd_545x39_Mag_Tracer_F";};
	for "_i" from 1 to 3 do {_vehicle addItemToBackpack "ACE_salineIV";};
	_vehicle addItemToBackpack "ACE_surgicalKit";
	_vehicle addItemToBackpack "ACE_Canteen";
	_vehicle addItemToBackpack "ACE_MRE_ChickenTikkaMasala";
	_vehicle addItemToBackpack "rhs_acc_dtk4short";
	_vehicle addItemToBackpack "rhs_mag_m67";
	for "_i" from 1 to 3 do {_vehicle addItemToBackpack "SmokeShellOrange";};
	_vehicle addHeadgear "rhsusf_opscore_fg_pelt";
	_vehicle addGoggles "dvk_tacg_o_shem_altcsat";
	_vehicle linkItem "ItemMap";
	_vehicle linkItem "ItemCompass";
	_vehicle linkItem "TFAR_anprc152";
	_vehicle linkItem "NVGoggles_OPFOR";
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_soldier_AA_F", "InitPost", {
    params ["_vehicle"];
	_vehicle setSpeaker "NoVoice";
	_vehicle setUnitTrait ["Medic",true];
	_vehicle setUnitTrait ["Engineer",true];
	_vehicle setUnitTrait ["explosiveSpecialist",true];
	_vehicle setVariable ["ACE_medical_medicClass", 1];
	_vehicle setVariable ["ACE_isEngineer", 1];
	_vehicle setUnitAbility 2;
	removeAllWeapons _vehicle;
	removeAllItems _vehicle;
	removeAllAssignedItems _vehicle;
	removeUniform _vehicle;
	removeVest _vehicle;
	removeBackpack _vehicle;
	removeHeadgear _vehicle;
	removeGoggles _vehicle;
	_vehicle forceAddUniform "U_O_R_Gorka_01_F";
	_vehicle addVest "V_CarrierRigKBT_01_light_Olive_F";
	_vehicle addBackpack "B_AssaultPack_rgr";
	_vehicle addWeapon "rhs_weap_ak105_zenitco01_b33";
	_vehicle addPrimaryWeaponItem "rhs_acc_dtk";
	_vehicle addPrimaryWeaponItem "rhsusf_acc_su230";
	_vehicle addPrimaryWeaponItem "30Rnd_545x39_Mag_Tracer_F";
	_vehicle addWeapon "rhs_weap_fim92";
	_vehicle addSecondaryWeaponItem "rhs_fim92_mag";
	for "_i" from 1 to 4 do {_vehicle addItemToUniform "ACE_tourniquet";};
	for "_i" from 1 to 2 do {_vehicle addItemToUniform "ACE_splint";};
	_vehicle addItemToUniform "ACE_morphine";
	for "_i" from 1 to 2 do {_vehicle addItemToUniform "ACE_epinephrine";};
	_vehicle addItemToUniform "ACE_MapTools";
	_vehicle addItemToUniform "ACE_microDAGR";
	_vehicle addItemToUniform "ACE_EarPlugs";
	for "_i" from 1 to 16 do {_vehicle addItemToUniform "ACE_packingBandage";};
	for "_i" from 1 to 2 do {_vehicle addItemToUniform "ACE_fieldDressing";};
	_vehicle addItemToUniform "ACE_RangeCard";
	for "_i" from 1 to 4 do {_vehicle addItemToUniform "ACE_elasticBandage";};
	for "_i" from 1 to 5 do {_vehicle addItemToVest "ACE_CableTie";};
	for "_i" from 1 to 5 do {_vehicle addItemToVest "30Rnd_545x39_Mag_Tracer_F";};
	for "_i" from 1 to 3 do {_vehicle addItemToBackpack "ACE_salineIV";};
	_vehicle addItemToBackpack "ACE_surgicalKit";
	_vehicle addItemToBackpack "ACE_Canteen";
	_vehicle addItemToBackpack "ACE_MRE_ChickenTikkaMasala";
	_vehicle addItemToBackpack "rhs_acc_dtk4short";
	_vehicle addItemToBackpack "rhs_mag_m67";
	for "_i" from 1 to 3 do {_vehicle addItemToBackpack "SmokeShellOrange";};
	_vehicle addHeadgear "rhsusf_opscore_fg_pelt";
	_vehicle addGoggles "dvk_tacg_o_shem_altcsat";
	_vehicle linkItem "ItemMap";
	_vehicle linkItem "ItemCompass";
	_vehicle linkItem "TFAR_anprc152";
	_vehicle linkItem "NVGoggles_OPFOR";

}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["I_LT_01_cannon_F", "InitPost", {
    params ["_vehicle"];
	_vehicle setObjectTextureGlobal [0,"A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa"];
	_vehicle setObjectTextureGlobal [1,"A3\armor_f_tank\lt_01\data\lt_01_cannon_olive_co.paa"];
	_vehicle setObjectTextureGlobal [2,"A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa"];
	_vehicle setObjectTextureGlobal [3,"A3\armor_f\data\cage_olive_co.paa"];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["I_LT_01_AA_F", "InitPost", {
    params ["_vehicle"];
	_vehicle setObjectTextureGlobal [0,"A3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa"];
	_vehicle setObjectTextureGlobal [1,"A3\armor_f_tank\lt_01\data\lt_01_at_olive_co.paa"];
	_vehicle setObjectTextureGlobal [2,"A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa"];
	_vehicle setObjectTextureGlobal [3,"A3\armor_f\data\cage_olive_co.paa"];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Box_NATO_Equip_F", "InitPost", {
    params ["_vehicle"];
	clearItemCargoGlobal _vehicle;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["B_Slingload_01_Medevac_F", "InitPost", {
    params ["_vehicle"];
	clearItemCargoGlobal _vehicle;
	_vehicle addAction	["Endheilen",{ params ["_target", "_caller", "_actionId", "_arguments"]; [_caller,true] execVM "MilSimUnited\heal.sqf";},nil,1.5,false,true,"","true",5,false,"",""];
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

["Land_MapBoard_Enoch_F", "InitPost", {
    params ["_vehicle"];
	_vehicle setObjectTextureGlobal [0, "MilSimUnited\rules_ger.jpg"];
	_veh = createVehicle ["MapBoard_Malden_F", [getPos _vehicle select 0,(getPos _vehicle select 1)+2,getPos _vehicle select 2], [], 0, "CAN_COLLIDE"];
	_dir = getDir _vehicle;
	_veh attachTo [_vehicle, [2, 0, 0]];
	_veh setDir _dir;
	_veh setObjectTextureGlobal [0, "MilSimUnited\rules_en.jpg"];
	
	_veh enableSimulationGlobal false;
	_vehicle enableSimulationGlobal false;
}, nil, nil, true] call CBA_fnc_addClassEventHandler;

// Advanced Singloading
ASL_SLING_RULES_OVERRIDE = [ 
	["Air", "CAN_SLING", "All"]
];
// ["Air", "CANT_SLING", "Tank"],

// Advanced Towing
SA_MAX_TOWED_CARGO = 1;
SA_TOW_RULES_OVERRIDE =[
	["All", "CAN_TOW", "All"]
];
// ["Car", "CANT_TOW", "Tank"],
// ["Air", "CANT_TOW", "Air"]


// MilSimUnited ===========================================================================






KPLIB_init = true;

// Notify clients that server is ready
if (isServer) then {
    KPLIB_initServer = true;
    publicVariable "KPLIB_initServer";
};


