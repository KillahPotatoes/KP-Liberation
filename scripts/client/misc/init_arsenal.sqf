if (KP_liberation_arsenalUsePreset) then {
	private ["_virtualCargo", "_virtualWeapons", "_virtualMagazines", "_virtualItems", "_virtualBackpacks"];
	_virtualCargo = [] call LARs_fnc_addAllVirtualCargo;
	_virtualWeapons = [];
	_virtualMagazines = [];
	_virtualItems = [];
	_virtualBackpacks = [];
	KP_liberation_allowed_items = [];

	if (isNil "GRLIB_arsenal_weapons") then {GRLIB_arsenal_weapons = []};
	if (isNil "GRLIB_arsenal_magazines") then {GRLIB_arsenal_magazines = []};
	if (isNil "GRLIB_arsenal_items") then {GRLIB_arsenal_items = []};
	if (isNil "GRLIB_arsenal_backpacks") then {GRLIB_arsenal_backpacks = []};
	if (isNil "blacklisted_from_arsenal") then {blacklisted_from_arsenal = []};

	if ((count GRLIB_arsenal_weapons) == 0) then {
		if ((count blacklisted_from_arsenal) == 0) then {
			_virtualWeapons = _virtualCargo select 0;
		} else {
			{if (!(_x in blacklisted_from_arsenal)) then {_virtualWeapons pushBack _x};} forEach (_virtualCargo select 0);
		};
		[missionNamespace, _virtualWeapons] call BIS_fnc_addVirtualWeaponCargo;
		KP_liberation_allowed_items append _virtualWeapons;
	} else {
		[missionNamespace, GRLIB_arsenal_weapons] call BIS_fnc_addVirtualWeaponCargo;
		KP_liberation_allowed_items append GRLIB_arsenal_weapons;
	};

	if ((count GRLIB_arsenal_magazines) == 0) then {
		if ((count blacklisted_from_arsenal) == 0) then {
			_virtualMagazines = _virtualCargo select 1;
		} else {
			{if (!(_x in blacklisted_from_arsenal)) then {_virtualMagazines pushBack _x};} forEach (_virtualCargo select 1);
		};
		[missionNamespace, _virtualMagazines] call BIS_fnc_addVirtualMagazineCargo;
		KP_liberation_allowed_items append _virtualMagazines;
	} else {
		[missionNamespace, GRLIB_arsenal_magazines] call BIS_fnc_addVirtualMagazineCargo;
		KP_liberation_allowed_items append GRLIB_arsenal_magazines;
	};

	if ((count GRLIB_arsenal_items) == 0) then {
		if ((count blacklisted_from_arsenal) == 0) then {
			_virtualItems = _virtualCargo select 2;
		} else {
			{if (!(_x in blacklisted_from_arsenal)) then {_virtualItems pushBack _x};} forEach (_virtualCargo select 2);
		};
		[missionNamespace, _virtualItems] call BIS_fnc_addVirtualItemCargo;
		KP_liberation_allowed_items append _virtualItems;
	} else {
		[missionNamespace, GRLIB_arsenal_items] call BIS_fnc_addVirtualItemCargo;
		KP_liberation_allowed_items append GRLIB_arsenal_items;
	};

	if ((count GRLIB_arsenal_backpacks) == 0) then {
		if ((count blacklisted_from_arsenal) == 0) then {
			_virtualBackpacks = _virtualCargo select 3;
		} else {
			{if (!(_x in blacklisted_from_arsenal)) then {_virtualBackpacks pushBack _x};} forEach (_virtualCargo select 3);
		};
		[missionNamespace, _virtualBackpacks] call BIS_fnc_addVirtualBackpackCargo;
		KP_liberation_allowed_items append _virtualBackpacks;
	} else {
		[missionNamespace, GRLIB_arsenal_backpacks] call BIS_fnc_addVirtualBackpackCargo;
		KP_liberation_allowed_items append GRLIB_arsenal_backpacks;
	};

	{
		if ((_x find "rhs_acc") == 0) then {
			KP_liberation_allowed_items_extension append [_x + "_3d", _x + "_pip"];
		};
		if ((_x find "rhsusf_acc") == 0) then {
			KP_liberation_allowed_items_extension append [_x + "_3d", _x + "_pip"];
		};
	} forEach KP_liberation_allowed_items;

	if ((count KP_liberation_allowed_items_extension) > 0) then {
		KP_liberation_allowed_items append KP_liberation_allowed_items_extension;
	};
} else {
	[missionNamespace, true] call BIS_fnc_addVirtualWeaponCargo;
	[missionNamespace, true] call BIS_fnc_addVirtualMagazineCargo;
	[missionNamespace, true] call BIS_fnc_addVirtualItemCargo;
	[missionNamespace, true] call BIS_fnc_addVirtualBackpackCargo;
};
