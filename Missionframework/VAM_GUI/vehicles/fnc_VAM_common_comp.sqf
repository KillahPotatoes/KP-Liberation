//VAM Common Vehicle Comp Apply
disableSerialization;
private _VAM_display = findDisplay 4900;
private _list_comp = _VAM_display displayCtrl 4920;

private _list_selection = lbSelection _list_comp select 0;
if (isNil "_list_selection") exitWith {};
private _comp_array = current_comp;
private "_comp_change";
if (_comp_array select _list_selection isEqualTo 0) then {_comp_change = 1;};
if (_comp_array select _list_selection isEqualTo 1) then {_comp_change = 0;};
_comp_array set [_list_selection, _comp_change];

private _comp_array_total = [];
{
	_comp_array_total pushBack (comp_class_names select _forEachIndex);
	_comp_array_total pushBack (_comp_array select _forEachIndex);
} forEach comp_class_names;
[VAM_targetvehicle,nil,_comp_array_total,nil] call BIS_fnc_initVehicle;

[] spawn fnc_VAM_common_comp_check;