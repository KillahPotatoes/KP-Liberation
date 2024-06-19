//VAM Common Vehicle Component Check
disableSerialization;
waitUntil {!(VAM_check_fnc_delay)};
private _VAM_display = findDisplay 4900;
private _list_comp = _VAM_display displayCtrl 4920;

current_comp = [];
{
	_isOn = VAM_targetvehicle animationPhase _x;
	current_comp pushBack _isOn;
} forEach comp_class_names;

//Reset list selection
{
	_list_comp lbSetSelected [_forEachIndex, false];
} forEach current_comp;

//Check current applied components
{
	if (_x isEqualTo 1) then {
		_list_comp lbSetSelected [_forEachIndex, true];
	};
} forEach current_comp;

VAM_comp_check_complete = true;