//VAM Gorgon Vehicle Camouflage Check
disableSerialization;
waitUntil {!(VAM_check_fnc_delay)};
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _getvc = [VAM_targetvehicle] call BIS_fnc_getVehicleCustomization;

private _camo_slot = _getvc select 0;
private _current_camo = _camo_slot select 0;
private _gorgon_blufor_check = getObjectTextures VAM_targetvehicle;
private _gorgon_blufor = [
	"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext_co.paa",
	"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext2_co.paa",
	"a3\armor_f_gamma\apc_wheeled_03\data\rcws30_co.paa",
	"a3\armor_f_gamma\apc_wheeled_03\data\apc_wheeled_03_ext_alpha_co.paa",
	"a3\armor_f\data\camonet_nato_desert_co.paa",
	"a3\armor_f\data\cage_sand_co.paa"];

//Check current applied camouflage
if (_gorgon_blufor_check isEqualTo _gorgon_blufor) exitWith {
	{
		if (localize "STR_VAM_BLUFOR_CAMO" isEqualTo _x) then {
			_list_camo lbSetCurSel _forEachIndex;
		};
	} forEach camo_class_names;
	VAM_camo_check_complete = true;
};
{
	if (_current_camo isEqualTo _x) then {
		_list_camo lbSetCurSel _forEachIndex;
	};
} forEach camo_class_names;

VAM_camo_check_complete = true;