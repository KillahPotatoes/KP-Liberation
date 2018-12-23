/*
    KPLIB_fnc_init_fillArsenal

    File: fn_init_fillArsenal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-27
    Last Update: 2018-12-12
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches all arsenal classnames from config files and applies the blacklist or adds the chosen whitelist to the virtual arsenal.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// clear the arsenal
[missionNamespace, KPLIB_preset_arsenal_whitelist, true] call BIS_fnc_removeVirtualWeaponCargo;
[missionNamespace, KPLIB_preset_arsenal_whitelist, true] call BIS_fnc_removeVirtualMagazineCargo;
[missionNamespace, KPLIB_preset_arsenal_whitelist, true] call BIS_fnc_removeVirtualItemCargo;
[missionNamespace, KPLIB_preset_arsenal_whitelist, true] call BIS_fnc_removeVirtualBackpackCargo;

if (KPLIB_ace_enabled) then {
    [player, true, false] remoteExecCall ["ace_arsenal_fnc_removeVirtualItems", [-2, 0] select hasInterface, true];
};

// Load arsenal preset
switch (KPLIB_param_presetArsenal) do {
    case 1: {call compile preprocessFileLineNumbers "presets\arsenal\blacklist.sqf";};
    case 2: {call compile preprocessFileLineNumbers "presets\arsenal\whitelist.sqf";};
    default {};
};

// Fetch all needed config classes
private _type = [];
private _configClasses = [];
{
    _configClasses append (
        "
            _type = (configName _x) call BIS_fnc_itemType;
            (getNumber (_x >> 'scope') == 2) &&
            ((_type select 0) != '') &&
            ((_type select 0) != 'VehicleWeapon')
        " configClasses _x
    );
} forEach [(configFile >> "CfgWeapons"), (configFile >> "CfgMagazines"), (configFile >> "CfgVehicles"), (configFile >> "CfgGlasses")];

// Fetch classnames
private _allItems = [];
{
    _allItems pushBack (configName _x);
} forEach _configClasses;

// Define the blacklist depending on arsenal preset selection
private _badItems = [];
private _goodItems = [];
switch (KPLIB_param_presetArsenal) do {
    case 1: {
        // Blacklist Method
        _badItems = _allItems arrayIntersect KPLIB_preset_arsenal_blacklist;
        {
            if !(_x in _badItems) then {
                _goodItems pushBack _x;
            };
        } forEach _allItems
    };
    case 2: {
        // Whitelist Method
        _goodItems = _allItems arrayIntersect KPLIB_preset_arsenal_whitelist;
        {
            if !(_x in _goodItems) then {
                _badItems pushBack _x;
            };
        } forEach _allItems
    };
    default {
        _goodItems = true;
    };
};

if !(_goodItems isEqualTo true) then {
    // Overwrite the whitelist (it removes entries which aren't available due to missing mods or something)
    KPLIB_preset_arsenal_whitelist = +_goodItems;
} else {
    // Overwrite the whitelist (it removes entries which aren't available due to missing mods or something)
    KPLIB_preset_arsenal_whitelist = ["%ALL"];
};
// Overwrite the blacklist (it removes entries which aren't available due to missing mods or something)
KPLIB_preset_arsenal_blacklist = +_badItems;

// Check for unrestricted arsenal
if !(_goodItems isEqualTo true) then {
    // Fetch classnames and sort them to the four needed arrays
    private _weapons = [];
    private _magazines = [];
    private _items = [];
    private _backpacks = [];
    {
        _type = _x call BIS_fnc_itemType;
        switch (_type select 0) do {
            case "Weapon": {if ((_x call BIS_fnc_baseWeapon) == _x) then {_weapons pushBack _x;};};
            case "Mine";
            case "Magazine": {_magazines pushBack _x};
            case "Item";
            case "Equipment": {if ((_type select 1) == "Backpack") then {_backpacks pushBack _x} else {_items pushBack _x};};
        };
    } forEach _goodItems;

    // Fill the whitelist into arsenal
    [missionNamespace, _weapons, true] call BIS_fnc_addVirtualWeaponCargo;
    [missionNamespace, _magazines, true] call BIS_fnc_addVirtualMagazineCargo;
    [missionNamespace, _items, true] call BIS_fnc_addVirtualItemCargo;
    [missionNamespace, _backpacks, true] call BIS_fnc_addVirtualBackpackCargo;

    if (KPLIB_ace_enabled) then {
        [player, _goodItems, false] remoteExecCall ["ace_arsenal_fnc_addVirtualItems", [-2, 0] select hasInterface, true];
    };
} else {
    // Fill the arsenal
    [missionNamespace, _goodItems, true] call BIS_fnc_addVirtualWeaponCargo;
    [missionNamespace, _goodItems, true] call BIS_fnc_addVirtualMagazineCargo;
    [missionNamespace, _goodItems, true] call BIS_fnc_addVirtualItemCargo;
    [missionNamespace, _goodItems, true] call BIS_fnc_addVirtualBackpackCargo;

    if (KPLIB_ace_enabled) then {
        [player, _goodItems, false] remoteExecCall ["ace_arsenal_fnc_addVirtualItems", [-2, 0] select hasInterface, true];
    };
};

// Send updated whitelist to clients
publicVariable "KPLIB_preset_arsenal_whitelist";
// Send updated blacklist to clients
publicVariable "KPLIB_preset_arsenal_blacklist";

true
