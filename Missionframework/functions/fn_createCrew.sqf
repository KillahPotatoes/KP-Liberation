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
	["_side", KPLIB_side_enemy,[sideUnknown]]
];

if (isNull _vehicle) exitWith {["No vehicle provided"] call BIS_fnc_error};

private _typeCrew = "";

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

// Get all available sets from the vehicle
private _seats = fullCrew [_vehicle, "", true];
/*
	Return example:
	[
	[<NULL-object>,"driver",-1,[],false,<NULL-object>,"$STR_POSITION_DRIVER"],
	[<NULL-object>,"gunner",-1,[0],false,<NULL-object>,"$STR_POSITION_GUNNER"],
	[<NULL-object>,"commander",-1,[0,0],false,<NULL-object>,"$STR_POSITION_COMMANDER"]
	]
*/

private _grp = createGroup [_side, true];
private _allCrew = [];

{	
	_checkSeat = _x select 0; // Unit - For empty seat must retun <NULL-object>
	_role = _x select 1; // Role - "driver", "gunner", "turret", "cargo", "commander"
	_index = _x select 2; // Index - "-1", "0", "1", etc.
	_turretPath = _x select 3; // Turret Path - [number]
	_crew = objNull;
	
	// If it's empty
	if (isNull _checkSeat) then {

		switch (_role) do {
			case "driver" : {
				_crew = [_typeCrew, getPos _vehicle, _grp] call KPLIB_fnc_createManagedUnit;
				_crew assignAsDriver _vehicle;
				_crew moveInDriver _vehicle;
			};
			case "gunner" : {
				_crew = [_typeCrew, getPos _vehicle, _grp] call KPLIB_fnc_createManagedUnit;
				_crew assignAsGunner _vehicle;
				_crew moveInGunner _vehicle;
			};
			case "commander" : {
				_crew = [_typeCrew, getPos _vehicle, _grp] call KPLIB_fnc_createManagedUnit;
				_crew assignAsCommander _vehicle;
				_crew moveInCommander _vehicle;
			};
			case "turret" : {
				//Cargo index -1 = copilot (vanilla models)
				if ((_vehicle isKindOf "Air") && (_index == -1)) then {
					_crew = [_typeCrew, getPos _vehicle, _grp] call KPLIB_fnc_createManagedUnit;
					_crew assignAsTurret [_vehicle, _turretPath];
					_crew moveInTurret [_vehicle, _turretPath];
				}
			}
		};

		// Check if the vehicle crew spawned is in the vehicle, if not, delete it
		if !(_crew in (crew _vehicle)) then {
			deleteVehicle _crew;
		} else {
			_allCrew pushBack _crew;
			_crew addMPEventHandler ["MPKilled", {
				params ["_unit", "_killer"];
				["KPLIB_manageKills", [_unit, _killer]] call CBA_fnc_localEvent;
			}];
		}
	}
}forEach _seats;

// Return all the vehicle crew and its group
[_allCrew,_grp]