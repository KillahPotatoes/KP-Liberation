//VAM Marid v1 Vehicle Component Check
disableSerialization;
if (VAM_check_fnc_delay) then {
	current_comp = [0,0,0,0,0];
	[VAM_targetvehicle,nil,["showBags",0,"showCanisters",0,"showTools",0,"showCamonetHull",0,"showSLATHull",0],nil] call BIS_fnc_initVehicle;
};
waitUntil {!(VAM_check_fnc_delay)};
private _VAM_display = findDisplay 4900;
private _list_comp = _VAM_display displayCtrl 4920;

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