/*
    File: fn_checkGear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-22
    Last Update: 2020-04-16
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        Checks the players gear for blacklisted items.
        Found items are removed from the loadout.
        Furthermore a hint with the found items is displayed to the player
        while a server log entry is created for the admin.

    Parameter(s):
        _backpack - Backpack classname of the players current backpack [STRING, defaults to ""]

    Returns:
        Player checked without findings [BOOL]
*/

params [
    ["_backpack", "", [""]]
];

private _removedItems = [];

// Check single item slots
if !(toLower (headgear player) in KP_liberation_allowed_items) then {
    _removedItems pushBack (headgear player);
    removeHeadgear player;
};
if !(toLower (goggles player) in KP_liberation_allowed_items) then {
    _removedItems pushBack (goggles player);
    removeGoggles player;
};
if !(toLower (uniform player) in KP_liberation_allowed_items) then {
    _removedItems pushBack (uniform player);
    removeUniform player;
};
if !(toLower (vest player) in KP_liberation_allowed_items) then {
    _removedItems pushBack (vest player);
    removeVest player;
};
if (!(toLower (backpack player) in KP_liberation_allowed_items) && ((backpack player) != _backpack)) then {
    _removedItems pushBack (backpack player);
    removeBackpack player;
};

// Check items
private _items = assignedItems player;
_items append ((getItemCargo (uniformContainer player)) select 0);
_items append ((getItemCargo (vestContainer player)) select 0);
_items append ((getItemCargo (backpackContainer player)) select 0);
_items = _items apply {toLower _x};
{
    _removedItems pushBack _x;
    player unassignItem _x;
    player removeItems _x;
} forEach (((_items arrayIntersect _items) - KP_liberation_allowed_items) select {!([_x] call KPLIB_fnc_isRadio)});

// Check magazines
_items = ((getMagazineCargo (uniformContainer player)) select 0);
_items append ((getMagazineCargo (vestContainer player)) select 0);
_items append ((getMagazineCargo (backpackContainer player)) select 0);
_items = _items apply {toLower _x};
{
    _removedItems pushBack _x;
    player removeMagazines _x;
} forEach ((_items arrayIntersect _items) - KP_liberation_allowed_items);

// Check weapons stored in inventory containers
{
    if (!isNull _x) then {_removedItems append ([_x] call KPLIB_fnc_checkWeaponCargo);};
} forEach [uniformContainer player, vestcontainer player, backpackContainer player];

// Check equipped weapons
_items = (weapons player) apply {toLower ([_x] call BIS_fnc_baseWeapon)};
{
    _removedItems pushBack _x;
    player removeWeapon _x;
} forEach (_items - KP_liberation_allowed_items);

// Check weapon items of primary weapon
_items = primaryWeaponItems player;
_items append primaryWeaponMagazine player;
_items = _items apply {toLower _x};
{
    _removedItems pushBack _x;
    player removePrimaryWeaponItem _x;
} forEach (_items - KP_liberation_allowed_items);

// Check weapon items of secondary weapon
_items = secondaryWeaponItems player;
_items append secondaryWeaponMagazine player;
_items = _items apply {toLower _x};
{
    _removedItems pushBack _x;
    player removeSecondaryWeaponItem _x;
} forEach (_items - KP_liberation_allowed_items);

// Check weapon items of handgun
_items = handgunItems player;
_items append handgunMagazine player;
_items = _items apply {toLower _x};
{
    _removedItems pushBack _x;
    player removeHandgunItem _x;
} forEach (_items - KP_liberation_allowed_items);

// Remove duplicates and empty strings
_removedItems = (_removedItems arrayIntersect _removedItems) - [""];

// Show hint and log list, if something was found
if !(_removedItems isEqualTo []) exitWith {
    [_removedItems] spawn {
        params ["_removedItems"];
        [format ["Found %1 at player %2", _removedItems, name player], "BLACKLIST"] remoteExecCall ["KPLIB_fnc_log", 2];
        hint format [localize "STR_BLACKLISTED_ITEM_FOUND", _removedItems joinString "\n"];
        sleep 6;
        hintSilent "";
    };
    false
};

true
