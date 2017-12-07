/*
	F_checkGear
	
	File: F_kp_checkGear.sqf
	Author: Wyqer - https://github.com/Wyqer
	Date: 2017-11-22
	Last Update: 2017-11-22

	Description:
	Checks the players gear for blacklisted items and report these items. Also returns if the player check was fine (true) or if he had bad items (false).

	Parameter(s):
		0: STRING - Backpack classname of the players backpack as he entered the arsenal / load a loadout. (Default "")

	Returns:
	BOOL
*/

params [["_backpack", ""]];

private _return = true;
private _playerItems = [];
if ((headgear player) != "") then {_playerItems pushBack (headgear player);};
if ((goggles player) != "") then {_playerItems pushBack (goggles player);};
if ((uniform player) != "") then {_playerItems pushBack (uniform player);};
if ((vest player) != "") then {_playerItems pushBack (vest player);};
if (((backpack player) != "") && ((backpack player) != _backpack)) then {_playerItems pushBack (backpack player);};
{_playerItems pushBackUnique _x;} forEach (assignedItems player);
{_playerItems pushBackUnique _x;} forEach (uniformItems player);
{_playerItems pushBackUnique _x;} forEach (vestItems player);
{_playerItems pushBackUnique _x;} forEach (backpackItems player);
{_playerItems pushBackUnique _x;} forEach (weapons player);
{if (_x != "") then {_playerItems pushBackUnique _x;}} forEach (primaryWeaponItems player);
{if (_x != "") then {_playerItems pushBackUnique _x;}} forEach (secondaryWeaponItems player);
{if (_x != "") then {_playerItems pushBackUnique _x;}} forEach (handgunItems player);

if (({(_x in KP_liberation_allowed_items) || ((_x find "ACRE") != -1) || ((_x find "tf_") != -1) || ((_x find "TFAR_") != -1)} count _playerItems) != count _playerItems) then {
	private _text = format ["[KP LIBERATION] [BLACKLIST] Found %1 at Player %2", (_playerItems - KP_liberation_allowed_items), name player];
	_text remoteExec ["diag_log",2];
	private _badItems = "";
	{if (((_x find "ACRE") == -1) && ((_x find "tf_") == -1) && ((_x find "TFAR_") == -1)) then {_badItems = _badItems + _x + "\n";};} forEach (_playerItems - KP_liberation_allowed_items);
	hint format [localize "STR_BLACKLISTED_ITEM_FOUND", _badItems];
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
	_return = false;
};

_return
