if ( isNil "GRLIB_arsenal_weapons" ) then { GRLIB_arsenal_weapons = [] };
if ( count GRLIB_arsenal_weapons == 0 ) then {
	private _virtualStuffWeapons = [] call LARs_fnc_addWeapons;
	private _virtualWeapons = [];
	{ if ( !(_x in blacklisted_from_arsenal_weapons) ) then { _virtualWeapons pushback _x } } foreach (_virtualStuffWeapons);
	
	[ missionNamespace, _virtualWeapons ] call BIS_fnc_addVirtualWeaponCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_weapons ] call BIS_fnc_addVirtualWeaponCargo;
};

if ( isNil "GRLIB_arsenal_magazines" ) then { GRLIB_arsenal_magazines = [] };
if ( count GRLIB_arsenal_magazines == 0 ) then {
	private _virtualStuffMagazines = [] call LARs_fnc_addMagazines;
	private _virtualMagazines = [];
	{ if ( !(_x in blacklisted_from_arsenal_magazines) ) then { _virtualMagazines pushback _x } } foreach (_virtualStuffMagazines);
	
	[ missionNamespace, _virtualMagazines ] call BIS_fnc_addVirtualMagazineCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_magazines ] call BIS_fnc_addVirtualMagazineCargo;
};

if ( isNil "GRLIB_arsenal_items" ) then { GRLIB_arsenal_items = [] };
if ( count GRLIB_arsenal_items == 0 ) then {
	private _virtualStuffItems = [] call LARs_fnc_addItems;
	private _virtualItems = [];
	{ if ( !(_x in blacklisted_from_arsenal_items) ) then { _virtualItems pushback _x } } foreach (_virtualStuffItems);
	
	[ missionNamespace, _virtualItems ] call BIS_fnc_addVirtualItemCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_items ] call BIS_fnc_addVirtualItemCargo;
};

if ( isNil "GRLIB_arsenal_backpacks" ) then { GRLIB_arsenal_backpacks = [] };
if ( count GRLIB_arsenal_backpacks == 0 ) then {
	private _virtualStuffBackpacks = [] call LARs_fnc_addBackpacks;
	private _virtualBackpacks = [];
	{ if ( !(_x in GRLIB_blacklisted_from_arsenal) ) then { _virtualBackpacks pushback _x } } foreach (_virtualStuffBackpacks);

	[ missionNamespace, _virtualBackpacks ] call BIS_fnc_addVirtualBackpackCargo;
} else {
	[ missionNamespace, GRLIB_arsenal_backpacks ] call BIS_fnc_addVirtualBackpackCargo;
};