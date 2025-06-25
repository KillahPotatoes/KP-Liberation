/*
    File: fn_createStaticWeapons.sqf
    Author: PiG13BR - https://github.com/PiG13BR
    Date: 2024-11-22
    Last Update: 2025-04-09
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
       Create static weapons on available structures in the sector, provided the structures are defined in KPLIB_staticsConfig.sqf file

    Parameter(s):
        _sector - sector to search for buildings to spawn static weapons [STRING, defaults to ""]
		_objects - sector objects [ARRAY, defaults to []]

    Returns:
        All static weapons created [ARRAY]
*/

if (!isServer) exitWith {};

params[
	["_sector", "", [""]], 
	["_objects", [], [[]]]
];

private _allStaticWeapons = [];
if (_sector isEqualTo "") exitWith {["No sector provided in fn_createStaticWeapons", "WARNING"] call KPLIB_fnc_log; _allStaticWeapons};
if (_objects isEqualTo []) exitWith {["No objects in the sector found", "SECTOR"] call KPLIB_fnc_log; _allStaticWeapons};

// Find garrisons objects for static weapons in the activated sector
private _allGarrisons = _objects select {(typeOf _x) in KPLIB_staticConfigs_classes};

// Create a group for the static weapons for the sector
private _staticGroup = createGroup KPLIB_side_enemy;

if (count _allGarrisons > 0) then {
	// Loop the garrison objects found
	{
		private _garrison = _x;
	
		// Loop statics configuration provided in KPLIB_staticsConfigs.sqf
		{
			// Check if the object type matches one of the configuration
			if (_x # 0 == typeOf _garrison) then {
				// Count how many positions are available for static weapons by counting the second element of the main array
				private _positions = count (_x # 1);
				if (_positions > 0) then {
					for "_index" from 0 to (_positions - 1) do {
						// The provided _index number in this loop will select each array that contains the necessary values to spawn correctly the static weapon for each relative position provided in the configuration
						private _type = (((_x # 1) # _index) # 0); // Get the types
						private _relPos = (((_x # 1) # _index) # 1); // Get the relativePosition
						private _relDir = (((_x # 1) # _index) # 2); // Get the rotation

						private _typeSel = "";
						// It will select randomly the type if more than one is provided.
						if (count _type > 1) then {
							_typeSel = selectRandom _type;
						} else {
							_typeSel = _type # 0;
						};

						// For the selected type, it will check the static weapons presets
						private _staticClass = "";
						switch _typeSel do {
							case "RAISED-HMG" : {
								_staticClass = selectRandom KPLIB_o_statics_raisedHMG;
							};
							case "LOWERED-HMG" : {
								_staticClass = selectRandom KPLIB_o_statics_loweredHMG;
							};
							case "RAISED-GMG" : {
								_staticClass = selectRandom KPLIB_o_statics_raisedGMG;
							};
							case "LOWERED-GMG" : {
								_staticClass = selectRandom KPLIB_o_statics_loweredGMG;
							};
							case "AT" : {
								_staticClass = selectRandom KPLIB_o_statics_AT;
							};
							case "AA" : {
								_staticClass = selectRandom KPLIB_o_statics_AA;
							}
						};

                        if (_staticClass isEqualTo "") then {[format ["No static weapon classname found in type %1", _typeSel], "WARNING"] call KPLIB_fnc_log; continue};

						// Create the static weapon and it's crew
						_weapon = [(_garrison modelToWorld _relPos), _staticClass, (getDir _garrison + (_relDir))] call KPLIB_fnc_spawnStaticWeapon;
						if (!isNil "_weapon") then {
							_allStaticWeapons pushBack _weapon;
						};
					};
				};
			}
		}forEach KPLIB_staticsConfigs;
	}forEach _allGarrisons;
};

_allStaticWeapons
