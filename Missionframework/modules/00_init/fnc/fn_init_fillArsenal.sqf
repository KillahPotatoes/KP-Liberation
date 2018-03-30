/*
	KPLIB_fnc_init_fillArsenal
	
	File: fn_init_fillArsenal.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-10-27
	Last Update: 2018-01-05
	License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

	Description:
	Fetches all arsenal classnames from config files and applies the blacklist or adds the chosen whitelist to the virtual arsenal.

	Parameter(s):
	NONE

	Returns:
	BOOL
*/

// Load arsenal preset
switch (KPLIB_preset_arsenal) do {
	case 1: {call compile preprocessFileLineNumbers "presets\arsenal\custom.sqf";};
	default {KPLIB_arsenal_weapons = []; KPLIB_arsenal_magazines = []; KPLIB_arsenal_items = []; KPLIB_arsenal_backpacks = [];};
};

if (KPLIB_param_arsenalPreset > 0) then {
	// Fetch all needed config classes
	private _configClasses = [];
	{
		_configClasses append (
			"
				private _type = (configName _x) call BIS_fnc_itemType;
				(getNumber (_x >> 'scope') == 2) &&
				((_type select 0) != '') &&
				((_type select 0) != 'VehicleWeapon')
			" configClasses _x
		);
	} forEach [(configFile >> "CfgWeapons"), (configFile >> "CfgMagazines"), (configFile >> "CfgVehicles"), (configFile >> "CfgGlasses")];

	// Fetch classnames and sort them to the four needed arrays
	private _weapons = [];
	private _magazines = [];
	private _items = [];
	private _backpacks = [];
	{
		private _classname = configName _x;
		private _type = _classname call BIS_fnc_itemType;
		switch (_type select 0) do {
			case "Weapon": {if ((_classname call BIS_fnc_baseWeapon) == _classname) then {_weapons pushBack _classname;};};
			case "Mine";
			case "Magazine": {_magazines pushBack _classname};
			case "Item";
			case "Equipment": {if ((_type select 1) == "Backpack") then {_backpacks pushBack _classname} else {_items pushBack _classname};};
		};
	} forEach _configClasses;

	// Remove items from the configs general blacklist
	_weapons = _weapons select {!(_x in KPLIB_arsenal_generalBlacklist)};
	_magazines = _magazines select {!(_x in KPLIB_arsenal_generalBlacklist)};
	_items = _items select {!(_x in KPLIB_arsenal_generalBlacklist)};
	_backpacks = _backpacks select {!(_x in KPLIB_arsenal_generalBlacklist)};

	// Add arsenal items to global arsenal
	if (KPLIB_arsenal_weapons isEqualTo []) then {
		[missionNamespace, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;
		KPLIB_arsenal_whitelist append _weapons;
	} else {
		[missionNamespace, KPLIB_arsenal_weapons, true] call BIS_fnc_addVirtualWeaponCargo;
		KPLIB_arsenal_whitelist append KPLIB_arsenal_weapons;
	};

	if (KPLIB_arsenal_magazines isEqualTo []) then {
		[missionNamespace, _magazines, true] call BIS_fnc_addVirtualMagazineCargo;
		KPLIB_arsenal_whitelist append _magazines;
	} else {
		[missionNamespace, KPLIB_arsenal_magazines, true] call BIS_fnc_addVirtualMagazineCargo;
		KPLIB_arsenal_whitelist append KPLIB_arsenal_magazines;
	};

	if (KPLIB_arsenal_items isEqualTo []) then {
		[missionNamespace, _items, true] call BIS_fnc_addVirtualItemCargo;
		KPLIB_arsenal_whitelist append _items;
	} else {
		[missionNamespace, KPLIB_arsenal_items, true] call BIS_fnc_addVirtualItemCargo;
		KPLIB_arsenal_whitelist append KPLIB_arsenal_items;
	};

	if (KPLIB_arsenal_backpacks isEqualTo []) then {
		[missionNamespace, _backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
		KPLIB_arsenal_whitelist append _backpacks;
	} else {
		[missionNamespace, KPLIB_arsenal_backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
		KPLIB_arsenal_whitelist append KPLIB_arsenal_backpacks;
	};

	// Add generic classnames for RHS optics
	{
		if ((_x find "rhs_acc") == 0) then {
			KPLIB_arsenal_addToWhitelist append [_x + "_3d", _x + "_pip"];
		};
		if ((_x find "rhsusf_acc") == 0) then {
			KPLIB_arsenal_addToWhitelist append [_x + "_3d", _x + "_pip"];
		};
	} forEach KPLIB_arsenal_whitelist;

	KPLIB_arsenal_whitelist append KPLIB_arsenal_addToWhitelist;
} else {
	// Add everything to the arsenal if full arsenal was selected in the parameters
	[missionNamespace, true, true] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace, true, true] call BIS_fnc_addVirtualMagazineCargo;
	[missionNamespace, true, true] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace, true, true] call BIS_fnc_addVirtualBackpackCargo;
};

// Send generated arsenal whitelist to clients
publicVariable "KPLIB_arsenal_whitelist";

true
