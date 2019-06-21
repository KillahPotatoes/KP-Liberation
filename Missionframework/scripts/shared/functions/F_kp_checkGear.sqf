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
} forEach ((_playerItems arrayIntersect _playerItems) - KP_liberation_allowed_items);

private _playerMagazines = ((getMagazineCargo (uniformContainer player)) select 0);
_playerMagazines append ((getMagazineCargo (vestContainer player)) select 0);
_playerMagazines append ((getMagazineCargo (backpackContainer player)) select 0);
_playerMagazines = _playerMagazines apply {toLower _x};
{
    _removedItems pushBack _x;
    player removeMagazines _x;
} forEach ((_playerMagazines arrayIntersect _playerMagazines) - KP_liberation_allowed_items);

// This is essentially slightly modified CBA_fnc_removeWeaponCargo because it's not possible to remove
// weapons from containers (uniform, vest, backpack) with removeWeapon.
private _removeWeapons = {
    params [["_container", objNull, [objNull]]];
    if (isNull _container) exitWith {
        []
    };

    private _removed = [];
    private _weaponsItemsCargo = weaponsItemsCargo _container;
    clearWeaponCargoGlobal _container;

    private _weaponComponents = {
        params [["_weapon", "", [""]]];
        private _config = configFile >> "CfgWeapons" >> _weapon;

        // Return empty array if the weapon doesn't exist
        if (!isClass _config) exitWith {
            [];
        };

        // get attachments
        private _attachments = [];
        {
            _attachments pushBack toLower getText (_x >> "item");
        } forEach ("true" configClasses (_config >> "LinkedItems")); // inheritance is apparently disabled for these

        // get first parent without attachments
        private _baseWeapon = "";
        while {isClass _config && {getNumber (_config >> "scope") > 0}} do { // Some preset weapons are scope = 1
            if (count (_config >> "LinkedItems") == 0) exitWith {
                _baseWeapon = configName _config;
            };

            _config = inheritsFrom _config;
        };

        private _components = [toLower _baseWeapon];
        _components append _attachments;

        _components
    };

    {
        _x params ["_weapon", "_muzzle", "_pointer", "_optic", "_magazine", "_magazineGL", "_bipod"];

        // weaponsItems magazineGL does not exist if not loaded (not even as empty array)
        if (count _x < 7) then {
            _bipod = _magazineGL;
            _magazineGL = "";
        };

        // Some weapons don't have non-preset parents
        _components = _weapon call _weaponComponents;
        private _weaponNonPreset = _components select 0;

        if (_weaponNonPreset == "") then {
            _weaponNonPreset = _weapon;
        };

        if (toLower _weapon in KP_liberation_allowed_items) then {
            _container addWeaponCargoGlobal [_weaponNonPreset, 1];

            // If weapon does not have a non-preset parent, only add attachments that were custom added
            // Removed attachments cannot be handled (engine limitation) and will be readded due to having to readd preset weapon
            private _presetAttachments = [];
            if (_weaponNonPreset == _weapon) then {
                _presetAttachments = _components;
            };
            if !(toLower _muzzle in _presetAttachments) then {
                if (toLower _muzzle in KP_liberation_allowed_items) then {
                    _container addItemCargoGlobal [_muzzle, 1];
                } else {
                    _removed pushBack _muzzle;
                }
            };
            if !(toLower _pointer in _presetAttachments) then {
                if (toLower _pointer in KP_liberation_allowed_items) then {
                    _container addItemCargoGlobal [_pointer, 1];
                } else {
                    _removed pushBack _pointer;
                }
            };
            if !(toLower _optic in _presetAttachments) then {
                if (toLower _optic in KP_liberation_allowed_items) then {
                    _container addItemCargoGlobal [_optic, 1];
                } else {
                    _removed pushBack _optic;
                }
            };
            if !(toLower _bipod in _presetAttachments) then {
                if (toLower _optic in KP_liberation_allowed_items) then {
                    _container addItemCargoGlobal [_optic, 1];
                } else {
                    _removed pushBack _optic;
                }
            };

            _magazine params [["_magazineClass", ""], ["_magazineAmmoCount", 0]];
            if (_magazineClass != "") then {
                if (toLower _magazineClass in KP_liberation_allowed_items) then {
                    _container addMagazineAmmoCargo [_magazineClass, 1, _magazineAmmoCount];
                } else {
                    _removed pushBack _magazineClass;
                }
            };

            _magazineGL params [["_magazineGLClass", ""], ["_magazineGLAmmoCount", 0]];
            if (_magazineGLClass != "") then {
                if (toLower _magazineGLClass in KP_liberation_allowed_items) then {
                    _container addMagazineAmmoCargo [_magazineGLClass, 1, _magazineGLAmmoCount];
                } else {
                    _removed pushBack _magazineGLClass;
                }
            };
        } else {
            _removed pushBack _weapon;
        }
    } forEach _weaponsItemsCargo;

    _removed;
};

_removedItems append ([uniformContainer player] call _removeWeapons);
_removedItems append ([vestContainer player] call _removeWeapons);
_removedItems append ([backpackContainer player] call _removeWeapons);

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
