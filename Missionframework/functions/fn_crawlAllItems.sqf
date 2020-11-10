/*
    File: fn_crawlAllItems.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2020-04-19
    Last Update: 2020-04-19
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Crawls through CfgWeapons, CfgMagazines, CfgVehicles and CfgGlasses to fetach all
        weapon, magazine, item and backpack classnames available in the arsenal.

    Parameter(s):
        NONE

    Returns:
        Array of classnames for weapons, magazines, items and backpacks [ARRAY]
*/

private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];
private _configClasses = [];
private _type = [];

{
    _configClasses append (
        "
            _type = (configName _x) call BIS_fnc_itemType;
            (getNumber(_x >> 'scope') isEqualTo 2) && !(((_type select 0) isEqualTo '') || ((_type select 0) isEqualTo 'VehicleWeapon'))
        " configClasses _x
    );
} forEach [
    (configFile >> "CfgWeapons"),
    (configFile >> "CfgMagazines"),
    (configFile >> "CfgVehicles"),
    (configFile >> "CfgGlasses")
];

private _classnames = _configClasses apply {configName _x};

{
    _type = _x call BIS_fnc_itemType;
    switch (_type select 0) do {
        case "Weapon": {if ((_x call BIS_fnc_baseWeapon) isEqualTo _x) then {_weapons pushBackUnique _x;};};
        case "Mine";
        case "Magazine": {_magazines pushBackUnique _x;};
        case "Item";
        case "Equipment": {if ((_type select 1) isEqualTo "Backpack") then {_backpacks pushBackUnique _x;} else {_items pushBackUnique _x;};};
    };
} forEach _classnames;

[_weapons, _magazines, _items, _backpacks]
