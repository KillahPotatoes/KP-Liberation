/*
    KPLIB_fnc_init_fillArsenal

    File: fn_init_fillArsenal.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-27
    Last Update: 2018-11-25
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches all arsenal classnames from config files and applies the blacklist or adds the chosen whitelist to the virtual arsenal.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/


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
            private _type = (configName _x) call BIS_fnc_itemType;
            (getNumber (_x >> 'scope') == 2) &&
            ((_type select 0) != '') &&
            ((_type select 0) != 'VehicleWeapon')
        " configClasses _x
    );
} forEach [(configFile >> "CfgWeapons"), (configFile >> "CfgMagazines"), (configFile >> "CfgVehicles"), (configFile >> "CfgGlasses")];

// Fetch classnames
private _allItems = [];
{
    if !(configName _x isKindOf "Weapon_Bag_Base") then {
        _allItems pushBackUnique (configName _x);
    };
} forEach _configClasses;

// Define the blacklist
switch (KPLIB_param_presetArsenal) do {
    case 1: {
        KPLIB_arsenal_blacklist = _allItems arrayIntersect KPLIB_preset_arsenal_blacklist;
        {
            if !(_x in KPLIB_arsenal_blacklist) then {
                KPLIB_arsenal_whitelist pushBack _x;
            };
        } forEach _allItems
    };
    case 2: {
        KPLIB_arsenal_whitelist = _allItems arrayIntersect KPLIB_preset_arsenal_whitelist;
        {
            if !(_x in KPLIB_arsenal_whitelist) then {
                KPLIB_arsenal_blacklist pushBack _x;
            };
        } forEach _allItems
    };
    default {
        KPLIB_arsenal_whitelist append _allItems;
        KPLIB_arsenal_blacklist = [];
    };
};

// Fill the whitelist into arsenal
[missionNamespace, KPLIB_arsenal_whitelist, true] call BIS_fnc_addVirtualWeaponCargo;
[missionNamespace, KPLIB_arsenal_whitelist, true] call BIS_fnc_addVirtualMagazineCargo;
[missionNamespace, KPLIB_arsenal_whitelist, true] call BIS_fnc_addVirtualItemCargo;
[missionNamespace, KPLIB_arsenal_whitelist, true] call BIS_fnc_addVirtualBackpackCargo;

// Send generated arsenal whitelist and blacklist to clients
publicVariable "KPLIB_arsenal_whitelist";
publicVariable "KPLIB_arsenal_blacklist";

true
