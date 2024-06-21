//Vehicle Appearance Manager GUI init
if (!hasInterface) exitWith {};

//Options
//Default setting for VAM_condition_check_options is [];. Add option what you want and separate them with comma. Ex. VAM_condition_check_options = [1,2];
//For example if you change VAM_condition_check_options to [1,2] from [], you can use VAM when you are near objects those are in list OR in certain marker area
//1 : Activate when player is near vehicles those are in list.
//2 : Activate when player is in certain marker area. (Marker name should be like "VAM_service_area_0", "VAM_service_area_1". You could have multiple marker area.)
//3 : Activate when player is near KP Liberation FOB
VAM_condition_check_options = [1];
VAM_repair_vehicle_list = [
    "Land_Workbench_01_F"
];

//Exception for bug fix and additional cosmetic change. Check out fnc_VAM_GUI_check.sqf.
VAM_exceptions = [
    "I_APC_Wheeled_03_cannon_F","B_APC_Wheeled_03_cannon_F",
    "I_LT_01_AT_F","I_LT_01_scout_F","I_LT_01_AA_F","I_LT_01_cannon_F",
    "O_APC_Wheeled_02_rcws_F","O_T_APC_Wheeled_02_rcws_ghex_F",
    "O_APC_Wheeled_02_rcws_v2_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F",
    "B_Heli_Light_01_dynamicLoadout_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F",
    "B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Attack_01_F",
    "O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_v2_F",
    "B_UGV_01_rcws_F","B_T_UGV_01_rcws_olive_F","O_UGV_01_rcws_F","O_T_UGV_01_rcws_ghex_F","I_UGV_01_rcws_F"
];

//Function preload
fnc_VAM_GUI_check = compileFinal preprocessFileLineNumbers "VAM_GUI\functions\fnc_VAM_GUI_check.sqf";
fnc_VAM_action = compileFinal preprocessFileLineNumbers "VAM_GUI\functions\fnc_VAM_action.sqf";
fnc_VAM_reset = compileFinal preprocessFileLineNumbers "VAM_GUI\functions\fnc_VAM_reset.sqf";
fnc_VAM_condition_check = compileFinal preprocessFileLineNumbers "VAM_GUI\functions\fnc_VAM_condition_check.sqf";
fnc_VAM_variable_cleaner = compileFinal preprocessFileLineNumbers "VAM_GUI\functions\fnc_VAM_variable_cleaner.sqf";

//Vehicle Function
fnc_VAM_common_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\fnc_VAM_common_setup.sqf";
fnc_VAM_common_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\fnc_VAM_common_camo.sqf";
fnc_VAM_common_comp = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\fnc_VAM_common_comp.sqf";
fnc_VAM_common_camo_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\fnc_VAM_common_camo_check.sqf";
fnc_VAM_common_comp_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\fnc_VAM_common_comp_check.sqf";

fnc_VAM_Gorgon_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Gorgon\fnc_VAM_Gorgon_setup.sqf";
fnc_VAM_Gorgon_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Gorgon\fnc_VAM_Gorgon_camo.sqf";
fnc_VAM_Gorgon_camo_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Gorgon\fnc_VAM_Gorgon_camo_check.sqf";

fnc_VAM_Nyx_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Nyx\fnc_VAM_Nyx_setup.sqf";
fnc_VAM_Nyx_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Nyx\fnc_VAM_Nyx_camo.sqf";

fnc_VAM_Marid_v1_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Marid\fnc_VAM_Marid_v1_setup.sqf";
fnc_VAM_Marid_v1_comp = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Marid\fnc_VAM_Marid_v1_comp.sqf";
fnc_VAM_Marid_v1_comp_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Marid\fnc_VAM_Marid_v1_comp_check.sqf";
fnc_VAM_Marid_v2_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Marid\fnc_VAM_Marid_v2_setup.sqf";
fnc_VAM_Marid_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Marid\fnc_VAM_Marid_camo.sqf";

fnc_VAM_HBPN_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\HBPN\fnc_VAM_HBPN_setup.sqf";
fnc_VAM_HBPN_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\HBPN\fnc_VAM_HBPN_camo.sqf";
fnc_VAM_HBPN_camo_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\HBPN\fnc_VAM_HBPN_camo_check.sqf";

fnc_VAM_Blackfoot_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Blackfoot\fnc_VAM_Blackfoot_setup.sqf";
fnc_VAM_Blackfoot_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Blackfoot\fnc_VAM_Blackfoot_camo.sqf";
fnc_VAM_Blackfoot_camo_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Blackfoot\fnc_VAM_Blackfoot_camo_check.sqf";

fnc_VAM_Orca_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Orca\fnc_VAM_Orca_setup.sqf";
fnc_VAM_Orca_camo = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Orca\fnc_VAM_Orca_camo.sqf";
fnc_VAM_Orca_camo_check = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\Orca\fnc_VAM_Orca_camo_check.sqf";

fnc_VAM_UGV_rcws_setup = compileFinal preprocessFileLineNumbers "VAM_GUI\vehicles\exceptions\UGV_rcws\fnc_VAM_UGV_rcws_setup.sqf";

if !(count VAM_condition_check_options isEqualTo 0) then {[] spawn fnc_VAM_condition_check;};
[] spawn fnc_VAM_action;

["----- Vehicle Appearance Manager ready -----", "VAM"] call KPLIB_fnc_log;