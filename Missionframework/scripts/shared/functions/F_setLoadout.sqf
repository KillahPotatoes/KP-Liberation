/*

	AUTHOR: aeroson
	NAME: set_loadout.sqf
	VERSION: 4.3

	DOWNLOAD & PARTICIPATE:
	https://github.com/aeroson/a3-loadout
	http://forums.bistudio.com/showthread.php?148577-GET-SET-Loadout-(saves-and-loads-pretty-much-everything)

	DESCRIPTION:
	I guarantee backwards compatibility.
	These scripts allows you set/get (load/save)all of the unit's gear, including:
	uniform, vest, backpack, contents of it, all quiped items, all three weapons with their attachments, currently loaded magazines and number of ammo in magazines.
	All this while preserving order of items.
	Useful for saving/loading loadouts.
	Ideal for revive scripts where you have to set exactly the same loadout to newly created unit.
	Uses workaround with placeholders to add vest/backpack items, so items stay where you put them.

	PARAMETER(S):
	0 : target unit
	1 : array of strings/arrays containing desired target unit's loadout, obtained from get_loadout.sqf
	2 : (optional) array of options, default [] : ["ammo"]  will allow loading of partially emptied magazines, otherwise magazines will be full

	addAction support:
	Sets player's loadout from global var loadout

*/

private ["_target","_options","_loadMagsAmmo","_data","_loadedMagazines","_placeholderCount","_loadBeforeAdd","_add","_outfit","_addWeapon","_addPrimary","_addHandgun","_addSecondary","_addOrder","_currentWeapon","_currentMode"];

_options = [];

// addAction support
if(count _this < 4) then {
	#define PARAM_START private ["_PARAM_INDEX"]; _PARAM_INDEX=0;
	#define PARAM_REQ(A) if (count _this <= _PARAM_INDEX) exitWith { systemChat format["required param '%1' not supplied in file:'%2' at line:%3", #A ,__FILE__,__LINE__]; }; A = _this select _PARAM_INDEX; _PARAM_INDEX=_PARAM_INDEX+1;
	#define PARAM(A,B) A = B; if (count _this > _PARAM_INDEX) then { A = _this select _PARAM_INDEX; }; _PARAM_INDEX=_PARAM_INDEX+1;
	PARAM_START
	PARAM_REQ(_target)
	PARAM_REQ(_data)
	PARAM(_options,[])
} else {
	_target = player;
	_data = loadout;
	//playSound3D ["A3\Sounds_F\sfx\ZoomIn.wav", _target];
};

if(isNil{_data}) exitWith {
	systemChat "you are trying to set/load empty loadout";
};
if(count _data < 13) exitWith {
	systemChat "you are trying to set/load corrupted loadout";
};

#define QUOTE(A) #A
#define EL(A,B) ((A) select (B))
#define _THIS(A) EL(_this,A)

// placeholders
#define PLACEHOLDER_BACKPACK QUOTE(B_Kitbag_mcamo) // any backpack with capacity>0
#define PLACEHOLDER_ITEM QUOTE(ItemWatch) // addItem placeholder should be smallest item possible

_loadMagsAmmo = "ammo" in _options;
_loadedMagazines = [];
if(count _data > 13) then {
	if(typeName(_data select 13)=="ARRAY") then {
		_loadedMagazines = _data select 13;
	};
};

_currentWeapon = "";
if(count _data > 14) then {
	_currentWeapon = _data select 14;
};
_currentMode = "";
if(count _data > 15) then {
	_currentMode = _data select 15;
};

_placeholderCount = 0;

// basic add function intended for use with uniform and vest
_add = {
	private ["_target","_item","_callback"];
	_target = _this select 0;
	_item = _this select 1;
	_callback = _this select 2;
	if(typename _item == "ARRAY") then {
		if(_item select 0 != "") then {
			if(_loadMagsAmmo) then {
				_target addMagazine _item;
			} else {
				(_item select 0) call _callback;
			};
		};
	} else {
		if(_item != "") then {
			_item call _callback;
		};
	};
};

// remove clothes to prevent incorrect mag loading
removeUniform _target;
removeVest _target;
removeBackpack _target;


_outfit = PLACEHOLDER_BACKPACK; // we need to add items somewhere before we can assign them
_target addBackpack _outfit;
clearAllItemsFromBackpack _target;
removeAllAssignedItems _target;
removeHeadgear _target;
removeGoggles _target;

// add loaded magazines of assigned items
if(count _loadedMagazines>=3) then {
	{
		[_target, _x, { _target addItemToBackpack _x }] call _add;
	} forEach (_loadedMagazines select 3);
};

// add assigned items
{
	[_target, _x, { _target addItemToBackpack _x }] call _add;
	_target assignItem _x;
} forEach (_data select 0);

clearAllItemsFromBackpack _target;

// get assigned items, headgear and goggles is not part of assignedItems
private ["_assignedItems","_headgear","_goggles"];
_assignedItems = assignedItems _target;
_headgear = headgear _target;
_goggles = goggles _target;
if((_headgear != "") && !(_headgear in _assignedItems)) then {
	_assignedItems set [count _assignedItems, _headgear];
};
if((_goggles != "") && !(_goggles in _assignedItems)) then {
	_assignedItems set [count _assignedItems, _goggles];
};
// add asigned items that could not be added with assign item
// asuming each assigned item can be put only into one slot
{
	if(!(_x in _assignedItems)) then {
		_target addWeapon _x;
	}
} forEach (_data select 0);



// universal add weapon to hands
_addWeapon = {
	private ["_weapon","_magazines","_muzzles"];
	clearAllItemsFromBackpack _target;
	_target removeWeapon ([] call _THIS(0));
	_weapon = _data select _THIS(1);
	if(_weapon != "") then {
		if(isClass(configFile>>"CfgWeapons">>_weapon)) then {
			if (_currentWeapon == "") then {
				_currentWeapon = _weapon;
			};
			if(count _loadedMagazines > 0) then {
				_magazines = _loadedMagazines select _THIS(5); // get loaded magazines from saved loadout
				if(typename _magazines != "ARRAY") then { // backwards compatibility, make sure _magazines is array
					if(_magazines=="") then {
						_magazines = [];
					} else {
						_magazines = [_magazines];
					};
				};
			} else {
				_magazines = [getArray(configFile>>"CfgWeapons">>_weapon>>"magazines") select 0]; // generate weapon magazine
				_muzzles = configFile>>"CfgWeapons">>_weapon>>"muzzles";
				if(isArray(_muzzles)) then { // generate magazine for each muzzle
					{
						if (_x != "this") then {
							_magazines set [count _magazines, toLower(getArray(configFile>>"CfgWeapons">>_weapon>>_x>>"magazines") select 0)];
						};
					} forEach getArray(_muzzles);
				};
			};
			{
				[_target, _x, { _target addItemToBackpack _x }] call _add;
			} forEach _magazines; // add magazines
			_target addWeapon _weapon;
			{
				if(_x!="" && !(_x in ([] call _THIS(3)))) then {
					_x call _THIS(4);
				};
			} forEach (_data select (1+_THIS(1))); // add weapon items
		} else {
			systemchat format["%1 %2 doesn't exist",_THIS(2),_weapon];
			if (_currentWeapon == _weapon) then {
				_currentWeapon = "";
				_currentMode = "";
			};
		};
	};
};

// add primary weapon, add primary weapon loaded magazine, add primary weapon items
_addPrimary = {
	[
		{ primaryWeapon _target }, // 0 // get current weapon
		1, // 1 //weapon classname index in _data
		"primary", // 2 // weapon debug type
		{ primaryWeaponItems _target }, // 3 // weapon items
		{ _target addPrimaryWeaponItem _this }, // 4 // add weapon item
		0 // 5 // index in _loadedMagazines
	] call _addWeapon;
};

// add handgun weapon, add handgun weapon loaded magazine, add handgun weapon items
_addHandgun = {
	[
		{ handgunWeapon _target }, // 0 // get current weapon
		3, // 1 //weapon classname index in _data
		"handgun", // 2 // weapon debug type
		{ handgunItems _target }, // 3 // weapon items
		{ _target addHandgunItem _this }, // 4 // add weapon item
		1 // 5 // index in _loadedMagazines
	] call _addWeapon;
};

// add secondary weapon, add secondary weapon loaded magazine, add secondary weapon items
_addSecondary = {
	[
		{ secondaryWeapon _target }, // 0 // get current weapon
		5, // 1 //weapon classname index in _data in _data
		"secondary", // 2 // weapon debug type
		{ secondaryWeaponItems _target }, // 3 // weapon items
		{ _target addSecondaryWeaponItem _this }, // 4 // add weapon item
		2 // 5 // index in _loadedMagazines
	] call _addWeapon;
};


// first added weapon is selected weapon, order add functions to firstly add currently selected weapon
_addOrder=[_addPrimary,_addHandgun,_addSecondary];
if(_currentWeapon!="") then {
	_addOrder = switch _currentWeapon do {
		case (_data select 3): {[_addHandgun,_addPrimary,_addSecondary]};
		case (_data select 5): {[_addSecondary,_addPrimary,_addHandgun]};
		default {_addOrder};
	};
};
{
	[] call _x;
} forEach _addOrder;

// select weapon and firing mode
if(vehicle _target == _target && _currentWeapon != "" && _currentMode != "") then {
	_muzzles = 0;
	while { (_currentWeapon != currentMuzzle _target || _currentMode != currentWeaponMode _target ) && _muzzles < 100 } do {
		_target action ["SWITCHWEAPON", _target, _target, _muzzles];
		_muzzles = _muzzles + 1;
	};
	if(_muzzles >= 100) then {
		systemchat format["mode %1 for %2 doesn't exist", _currentMode, _currentWeapon];
		_currentMode = "";
	};
} else {
	_currentMode = "";
};
if(_currentMode == "" && _currentWeapon != "") then {
	_target selectWeapon _currentWeapon;
};

clearAllItemsFromBackpack _target;

// add uniform, add uniform items and fill uniform with item placeholders
_outfit = _data select 7;
if(_outfit != "") then {
	if(isClass(configFile>>"CfgWeapons">>_outfit)) then {
		_target forceAddUniform _outfit;
		_target addItem PLACEHOLDER_ITEM;
		if(loadUniform _target > 0) then {
			_placeholderCount = _placeholderCount + 1;
			{
				[_target, _x, { _target addItemToUniform _x }] call _add;
			} forEach (_data select 8);
			while{true} do {
				_loadBeforeAdd = loadUniform _target;
				_target addItem PLACEHOLDER_ITEM;
				if(loadUniform _target == _loadBeforeAdd) exitWith {};
				_placeholderCount = _placeholderCount + 1;
			};
		};
	} else {
		systemchat format["uniform %1 doesn't exist",_outfit];
	};
};

// add vest, add vest items and fill vest with item placeholders
_outfit = _data select 9;
if(_outfit != "") then {
	if(isClass(configFile>>"CfgWeapons">>_outfit)) then {
		_target addVest _outfit;
		_target addItem PLACEHOLDER_ITEM;
		if(loadVest _target > 0) then {
			_placeholderCount = _placeholderCount + 1;
			{
				[_target, _x, { _target addItemToVest _x }] call _add;
			} forEach (_data select 10);
			while{true} do {
				_loadBeforeAdd = loadVest _target;
				_target addItem PLACEHOLDER_ITEM;
				if(loadVest _target == _loadBeforeAdd) exitWith {};
				_placeholderCount = _placeholderCount + 1;
			};
		};
	} else {
		systemchat format["vest %1 doesn't exist",_outfit];
	};
};

// add backpack and add backpack items
removeBackpack _target;
_outfit = _data select 11;
if(_outfit != "") then {
	if(getNumber(configFile>>"CfgVehicles">>_outfit>>"isbackpack")==1) then {
		_target addBackpack _outfit;
		clearAllItemsFromBackpack _target;
		_target addItem PLACEHOLDER_ITEM;
		_placeholderCount = _placeholderCount + 1;
		if(loadBackpack _target > 0) then {
			{
				[_target, _x, { _target addItemToBackpack _x }] call _add;
			} forEach (_data select 12);
		};
	} else {
		systemchat format["backpack %1 doesn't exist",_outfit];
	};
};

// remove item placeholders
for "_i" from 1 to _placeholderCount do {
	_target removeItem PLACEHOLDER_ITEM;
};


// make loadout visible fix?
if(vehicle _target == _target) then {
	//_target switchMove (getArray(configFile>>"CfgMovesMaleSdr">>"States">>animationState player>>"ConnectTo") select 0);
	_target setPosATL (getPosATL _target);
};

[ _target ] call F_correctLaserBatteries;