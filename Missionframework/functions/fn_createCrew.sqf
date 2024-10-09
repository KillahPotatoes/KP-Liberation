/*
	File: fn_createCrew.sqf
	Author: PiG13BR - https://github.com/PiG13BR/
	Date: 2024-26-08
	Last Update: 2024-27-08
	License: MIT License - http://www.opensource.org/licenses/MIT

	Description:
		Creates vehicle crew based on preset configuration only
	
	Parameter(s):
		_vehicle - Vehicle to add crew
		_side - crew side: KPLIB_side_enemy or KPLIB_side_player (Default: KPLIB_side_enemy)

	Returns:
		Array - [Crew created, group]
*/

params[
	["_vehicle", objNull, [objNull]],
	["_side", KPLIB_side_enemy, [sideUnknown]]

];

if (isNull _vehicle) exitWith {["No vehicle provided"] call BIS_fnc_error};

private _typeCrew = "";

// Placeholder types
switch (_side) do {
	case KPLIB_side_enemy : {
		 _typeCrew = KPLIB_o_rifleman;
	};
    case KPLIB_side_player : {
    	_typeCrew = KPLIB_b_crewUnit;
    }
};

/*
Save it for later changes
switch (_side) do {
	case KPLIB_side_enemy : {
		if (_vehicle isKindOf "Air") then {
			_typeCrew = KPLIB_o_pilot;
		} else {
			if ((_vehicle isKindOf "Tank") || {_vehicle isKindOf "Wheeled_APC_F"}) then {
				_typeCrew = KPLIB_o_crewman;
			} else {
				_typeCrew = KPLIB_o_rifleman;
			}
		}
	};
	case KPLIB_side_player : {
		if (_vehicle isKindOf "Air") then {
			_typeCrew = KPLIB_b_heliPilotUnit;
		} else {
			if ((_vehicle isKindOf "Tank") || {_vehicle isKindOf "Wheeled_APC_F"}) then {
				_typeCrew = KPLIB_b_crewUnit;
			} else {
				_typeCrew = KPLIB_b_crewStatic;
			}
		}
	}
};
*/

private _grp = createGroup [_side, true];
private _allCrew = [];

{
	private _crew = [_typeCrew, getPosATL _vehicle, _grp] call KPLIB_fnc_createManagedUnit;
	_allCrew pushBack _crew;

	if (_x isEqualTo [-1]) then {
		_crew assignAsDriver _vehicle;
		_crew moveInDriver _vehicle;
	} else {
		_crew assignAsTurret [_vehicle, _x];
		_crew moveInTurret [_vehicle, _x];
	};
} forEach (_vehicle call BIS_fnc_vehicleCrewTurrets);


// Return all the vehicle crew and its group
[_allCrew, _grp]

