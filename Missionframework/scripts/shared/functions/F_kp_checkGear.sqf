/*
    F_checkGear

    File: F_kp_checkGear.sqf
    Author: Wyqer - https://github.com/Wyqer
    Date: 2017-11-22
    Last Update: 2019-07-23

    Description:
    Checks the players gear for blacklisted items and report these items. Also returns if the player check was fine (true) or if he had bad items (false).

    Parameter(s):
        0: STRING - Backpack classname of the players backpack as he entered the arsenal / load a loadout. (Default "")

    Returns:
    BOOL
*/

params [["_backpack", ""]];

private _return = true;
private _removedItems = [];

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

private _playerItems = assignedItems player;
_playerItems append ((getItemCargo (uniformContainer player)) select 0);
_playerItems append ((getItemCargo (vestContainer player)) select 0);
_playerItems append ((getItemCargo (backpackContainer player)) select 0);
_playerItems = _playerItems apply {toLower _x};
{
    _removedItems pushBack _x;
    player unassignItem _x;
    player removeItems _x;
} forEach (((_playerItems arrayIntersect _playerItems) - KP_liberation_allowed_items) select {!([_x] call F_isRadio)});

private _playerMagazines = ((getMagazineCargo (uniformContainer player)) select 0);
_playerMagazines append ((getMagazineCargo (vestContainer player)) select 0);
_playerMagazines append ((getMagazineCargo (backpackContainer player)) select 0);
_playerMagazines = _playerMagazines apply {toLower _x};
{
    _removedItems pushBack _x;
    player removeMagazines _x;
} forEach ((_playerMagazines arrayIntersect _playerMagazines) - KP_liberation_allowed_items);

_removedItems append ([uniformContainer player] call F_removeWeaponCargo);
_removedItems append ([vestContainer player] call F_removeWeaponCargo);
_removedItems append ([backpackContainer player] call F_removeWeaponCargo);

private _weapons = weapons player;
_weapons = _weapons apply {toLower _x};
{
    player removeWeapon _x;
    _removedItems pushBack _x;
} forEach (_weapons - KP_liberation_allowed_items);

private _weaponItems = primaryWeaponItems player;
_weaponItems append primaryWeaponMagazine player;
_weaponItems = _weaponItems apply {toLower _x};
{
    player removePrimaryWeaponItem _x;
    _removedItems pushBack _x;
} forEach (_weaponItems - KP_liberation_allowed_items);

_weaponItems = secondaryWeaponItems player;
_weaponItems append secondaryWeaponMagazine player;
_weaponItems = _weaponItems apply {toLower _x};
{
    player removeSecondaryWeaponItem _x;
    _removedItems pushBack _x;
} forEach (_weaponItems - KP_liberation_allowed_items);

_weaponItems = handgunItems player;
_weaponItems append handgunMagazine player;
_weaponItems = _weaponItems apply {toLower _x};
{
    player removeHandgunItem _x;
    _removedItems pushBack _x;
} forEach (_weaponItems - KP_liberation_allowed_items);

_removedItems = (_removedItems arrayIntersect _removedItems) - [""];
if !(_removedItems isEqualTo []) then {
    private _text = format ["[KP LIBERATION] [BLACKLIST] Found %1 at Player %2", (_removedItems), name player];
    _text remoteExec ["diag_log",2];
    hint format [localize "STR_BLACKLISTED_ITEM_FOUND", _removedItems joinString "\n"];
    _return = false;
};

_return
