//VAM Orca Vehicle Camouflage Check
disableSerialization;
waitUntil {!(VAM_check_fnc_delay)};
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _getvc = [VAM_targetvehicle] call BIS_fnc_getVehicleCustomization;

private _camo_slot = _getvc select 0;
private _current_camo = _camo_slot select 0;
private _check = getObjectTextures VAM_targetvehicle select 0;
private _texture = "a3\air_f\heli_light_02\data\heli_light_02_ext_indp_co.paa";

//Check current applied camouflage
if (_check isEqualTo _texture) exitWith {
	{
		if (localize "STR_VAM_AAF_CAMO" isEqualTo _x) then {
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