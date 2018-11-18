/*
    KPLIB_fnc_arsenal_checkGear

    File: fn_arsenal_checkGear.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-11-26
    Last Update: 2018-11-18
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Checks the players gear for blacklisted items and report these items. Also returns if the player check was fine (true) or if he had bad items (false).

    Parameter(s):
        _backpack - Backpack classname of the players backpack as he entered the arsenal / load a loadout [STRING, defaults to ""]

    Returns:
        Result (see description) [BOOL]
*/

params [
    ["_backpack", "", [""]]
];

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

if (({(_x in KPLIB_arsenal_whitelist) || ((_x find "ACRE") != -1) || ((_x find "tf_") != -1) || ((_x find "TFAR_") != -1)} count _playerItems) != count _playerItems) then {
    private _text = format ["[KP LIBERATION] [BLACKLIST] Found %1 at Player %2", (_playerItems - KPLIB_arsenal_whitelist), name player];
    _text remoteExec ["diag_log",2];
    private _badItems = "";
    {if (((_x find "ACRE") == -1) && ((_x find "tf_") == -1) && ((_x find "TFAR_") == -1)) then {_badItems = _badItems + _x + "\n";};} forEach (_playerItems - KPLIB_arsenal_whitelist);
    hint format [localize "STR_KPLIB_HINT_BLACKLISTEDITEMFOUND", _badItems];
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
