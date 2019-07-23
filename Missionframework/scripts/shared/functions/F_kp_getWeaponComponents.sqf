/*
	F_getWeaponComponents

	File: F_kp_getWeaponComponents.sqf
	Author: Zharf, based on CBA_fnc_weaponComponents by commy2
	Date: 2019-06-21
	Last Update: 2019-06-21

	Description:
	Snatched from CBA since we don't depend on it yet.
	Reports class name of base weapon without attachments and all attachments belonging to a pre equipped weapon.
	Base weapon and attachments are reported in lower case capitalization.
	Fixed version of BIS_fnc_weaponComponents.

	Parameter(s):
		0: STRING - a weapons class name with attachments build in

	Returns:
	ARRAY
*/

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

