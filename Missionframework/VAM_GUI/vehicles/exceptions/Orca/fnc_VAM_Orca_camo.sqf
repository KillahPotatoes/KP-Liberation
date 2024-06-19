//VAM Orca Vehicle Camo Apply
disableSerialization;
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _list_selection = lbCurSel _list_camo;
private _selected_camo_class_name = camo_class_names select _list_selection;
private _texture = "a3\air_f\heli_light_02\data\heli_light_02_ext_indp_co.paa";
if (_selected_camo_class_name isEqualTo localize "STR_VAM_AAF_CAMO") exitWith {
	[VAM_targetvehicle,["Opfor",1],nil,nil] call BIS_fnc_initVehicle;
	VAM_targetvehicle setObjectTextureGlobal [0, _texture];
};
[VAM_targetvehicle,[_selected_camo_class_name,1],nil,nil] call BIS_fnc_initVehicle;