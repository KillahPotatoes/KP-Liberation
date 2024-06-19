//VAM Gorgon Vehicle Camo Apply
disableSerialization;
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _list_selection = lbCurSel _list_camo;
private _selected_camo_class_name = camo_class_names select _list_selection;
private _gorgon_blufor = [
	"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext_co.paa",
	"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext2_co.paa",
	"a3\armor_f_gamma\apc_wheeled_03\data\rcws30_co.paa",
	"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext_alpha_co.paa",
	"a3\armor_f\data\camonet_nato_desert_co.paa",
	"a3\armor_f\data\cage_sand_co.paa"];
if (_selected_camo_class_name isEqualTo localize "STR_VAM_BLUFOR_CAMO") exitWith {
	[VAM_targetvehicle,["Indep",1],nil,nil] call BIS_fnc_initVehicle;
	{VAM_targetvehicle setObjectTextureGlobal [_forEachIndex, _x];} forEach _gorgon_blufor;
};
[VAM_targetvehicle,[_selected_camo_class_name,1],nil,nil] call BIS_fnc_initVehicle;