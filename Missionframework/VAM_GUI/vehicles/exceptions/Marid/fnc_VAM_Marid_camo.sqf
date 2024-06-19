//VAM Marid Vehicle Camo Apply
disableSerialization;
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _list_selection = lbCurSel _list_camo;
private _selected_camo_class_name = camo_class_names select _list_selection;
private _hex = [
	"a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_01_opfor_co.paa",
	"a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_02_opfor_co.paa",
	"a3\data_f\vehicles\turret_opfor_co.paa",
	"a3\armor_f\data\camonet_csat_hex_desert_co.paa",
	"a3\armor_f\data\cage_csat_co.paa"
];
private _greenhex = [
	"a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_01_ghex_co.paa",
	"a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_02_ghex_co.paa",
	"a3\data_f_exp\vehicles\turret_ghex_co.paa",
	"a3\armor_f\data\camonet_csat_hex_green_co.paa",
	"a3\armor_f\data\cage_csat_green_co.paa"
];
[VAM_targetvehicle,[_selected_camo_class_name,1],nil,nil] call BIS_fnc_initVehicle;
if (_selected_camo_class_name isEqualTo "Hex") then {
	{VAM_targetvehicle setObjectTextureGlobal [_forEachIndex, _x];} forEach _hex;
};
if (_selected_camo_class_name isEqualTo "GreenHex") then {
	{VAM_targetvehicle setObjectTextureGlobal [_forEachIndex, _x];} forEach _greenhex;
};