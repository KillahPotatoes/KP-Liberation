/*
    KPLIB_fnc_cratefiller_presets

    File: fn_cratefiller_presets.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates the different categories of the whitelisted items.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Define variables
private _weapons = [];
private _grenades = [];
private _explosives = [];
private _items = [];
private _backpacks = [];
private _classNames = KPLIB_preset_arsenal_whitelist;
private _type = [];
private _specialItems = [];

// Search for special items with wrong config entrys
{
    if (_x isKindOf ["CBA_MiscItem", configfile >> "CfgWeapons"]) then {_specialItems pushBack _x};
} forEach _classNames;

// Sort all classnames into the different categories
{
    _type = _x call BIS_fnc_itemType;
    switch (_type select 0) do {
        case "Weapon": {if ((_type select 1) isEqualTo "UnknownWeapon") then {_items pushBack _x} else {if ((_x call BIS_fnc_baseWeapon) == _x) then {_weapons pushBack _x;};};};
        case "Mine": {_explosives pushBack _x};
        case "Magazine": {if ((((_type select 1) isEqualTo "Grenade") || ((_type select 1) isEqualTo "SmokeShell")) && !((getNumber (configFile >> "CfgMagazines" >> _x >> "type")) == 16)) then {_grenades pushBack _x}};
        case "Equipment": {if ((_type select 1) isEqualTo "Backpack") then {_backpacks pushBack _x}};
        case "Item": {
            switch (_type select 1) do {
                case "AccessoryMuzzle" : {};
                case "AccessoryPointer" : {};
                case "AccessorySights" : {};
                case "AccessoryBipod" : {};
                default {_items pushBack _x};
            };
        };
    };
} forEach (_classnames arrayIntersect _classnames);

_items append _specialItems;

KPLIB_cratefiller_data setVariable ["weapons", [_weapons] call KPLIB_fnc_cratefiller_sortList, true];
KPLIB_cratefiller_data setVariable ["grenades", [_grenades] call KPLIB_fnc_cratefiller_sortList, true];
KPLIB_cratefiller_data setVariable ["explosives", [_explosives] call KPLIB_fnc_cratefiller_sortList, true];
KPLIB_cratefiller_data setVariable ["items", [_items] call KPLIB_fnc_cratefiller_sortList, true];
KPLIB_cratefiller_data setVariable ["backpacks", [_backpacks] call KPLIB_fnc_cratefiller_sortList, true];

true
