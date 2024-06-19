//VAM Blackfoot Vehicle Camouflage Check
disableSerialization;
waitUntil {!(VAM_check_fnc_delay)};
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _check = getObjectTextures VAM_targetvehicle select 0;

//Check current applied camouflage
{
	if (_check isEqualTo _x) then {
		_list_camo lbSetCurSel _forEachIndex;
	};
} forEach camo_class_names;

VAM_camo_check_complete = true;