if ( isNil "GRLIB_arsenal_weapons" ) then { GRLIB_arsenal_weapons = [] };
// Use weapon blacklist when whitelist is empty
if ( count GRLIB_arsenal_weapons == 0 ) then {
	private _virtualStuffWeapons = [] call LARs_fnc_addWeapons;
	private _virtualWeapons = [];

	// Don't try to filter weapons when blacklist is not defined
	if ( isNil "blacklisted_from_arsenal_weapons" ) then {
		_virtualWeapons = _virtualStuffWeapons;
	} else {
		{ if ( !(_x in blacklisted_from_arsenal_weapons) ) then { _virtualWeapons pushback _x } } foreach (_virtualStuffWeapons);
	};
	
	[ missionNamespace, _virtualWeapons ] call BIS_fnc_addVirtualWeaponCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_weapons ] call BIS_fnc_addVirtualWeaponCargo;
};

if ( isNil "GRLIB_arsenal_magazines" ) then { GRLIB_arsenal_magazines = [] };
// Use magazine blacklist when whitelist is empty
if ( count GRLIB_arsenal_magazines == 0 ) then {
	private _virtualStuffMagazines = [] call LARs_fnc_addMagazines;
	private _virtualMagazines = [];
	
	// Don't try to filter magazines when blacklist is not defined
	if (isNil "blacklisted_from_arsenal_magazines") then {
		_virtualMagazines = _virtualStuffMagazines;
	} else {
		{ if ( !(_x in blacklisted_from_arsenal_magazines) ) then { _virtualMagazines pushback _x } } foreach (_virtualStuffMagazines);
	};
	
	[ missionNamespace, _virtualMagazines ] call BIS_fnc_addVirtualMagazineCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_magazines ] call BIS_fnc_addVirtualMagazineCargo;
};

if ( isNil "GRLIB_arsenal_items" ) then { GRLIB_arsenal_items = [] };
// Use item blacklist when whitelist is empty
if ( count GRLIB_arsenal_items == 0 ) then {
	private _virtualStuffItems = [] call LARs_fnc_addItems;
	private _virtualItems = [];
	
	// Don't try to filter items when blacklist is not defined
	if (isNil "blacklisted_from_arsenal_items") then {
		_virtualItems = _virtualStuffItems;
	} else {
		{ if ( !(_x in blacklisted_from_arsenal_items) ) then { _virtualItems pushback _x } } foreach (_virtualStuffItems);
	};
	
	[ missionNamespace, _virtualItems ] call BIS_fnc_addVirtualItemCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_items ] call BIS_fnc_addVirtualItemCargo;
};

if ( isNil "GRLIB_arsenal_backpacks" ) then { GRLIB_arsenal_backpacks = [] };
// Use backpack blacklist when whitelist is empty
if ( count GRLIB_arsenal_backpacks == 0 ) then {
	private _virtualStuffBackpacks = [] call LARs_fnc_addBackpacks;
	private _virtualBackpacks = [];
	
	// Don't try to filter backpacks when blacklist is not defined
	if (isNil "GRLIB_blacklisted_from_arsenal") then {
		_virtualBackpacks = _virtualStuffBackpacks;
	} else {
		{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualBackpacks pushback _x } } foreach (_virtualStuffBackpacks);
	};

	[ missionNamespace, _virtualBackpacks ] call BIS_fnc_addVirtualBackpackCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_backpacks ] call BIS_fnc_addVirtualBackpackCargo;
};