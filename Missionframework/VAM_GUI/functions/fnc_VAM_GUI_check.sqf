//VAM Check
disableSerialization;
private _VAM_display = findDisplay 4900;
private _vehicleclass = typeof VAM_targetvehicle;
private _vehiclename = getText (configFile >> "CfgVehicles" >> _vehicleclass >> "displayName");
private _currentvehicletext = _VAM_display displayCtrl 4950;
_currentvehicletext ctrlSetText _vehiclename;

if !(_vehicleclass in VAM_exceptions) exitWith {
	[] spawn fnc_VAM_common_setup;
};

Switch (true) do {
	Case (_vehicleclass in ["I_APC_Wheeled_03_cannon_F","B_APC_Wheeled_03_cannon_F"]) : {[] spawn fnc_VAM_Gorgon_setup;};
	Case (_vehicleclass in ["I_LT_01_AT_F","I_LT_01_scout_F","I_LT_01_AA_F","I_LT_01_cannon_F"]) : {[] spawn fnc_VAM_Nyx_setup;};
	Case (_vehicleclass in ["O_APC_Wheeled_02_rcws_F","O_T_APC_Wheeled_02_rcws_ghex_F"]) : {[] spawn fnc_VAM_Marid_v1_setup;};
	Case (_vehicleclass in ["O_APC_Wheeled_02_rcws_v2_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"]) : {[] spawn fnc_VAM_Marid_v2_setup;};
	Case (_vehicleclass in ["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"]) : {[] spawn fnc_VAM_HBPN_setup;};
	Case (_vehicleclass in ["B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Attack_01_F"]) : {[] spawn fnc_VAM_Blackfoot_setup;};
	Case (_vehicleclass in ["O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_v2_F"]) : {[] spawn fnc_VAM_Orca_setup;};
	Case (_vehicleclass in ["B_UGV_01_rcws_F","B_T_UGV_01_rcws_olive_F","O_UGV_01_rcws_F","O_T_UGV_01_rcws_ghex_F","I_UGV_01_rcws_F"]) : {[] spawn fnc_VAM_UGV_rcws_setup;};
	default {};
};