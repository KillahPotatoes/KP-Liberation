/*
    KPLIB_fnc_cratefiller_showInventory

    File: fn_cratefiller_showInventory.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Displays the items of the active storage.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlInventory = _dialog displayCtrl 75822;
private _ctlrProgress = _dialog displayCtrl 75823;

// Check if dialog is open
if (isNull _dialog) exitWith {};

// Reset variables
lbClear _ctrlInventory;

private _config = "";
private _type = "";
private _itemMass = 0;
private _index = 0;

// Get the active storage
private _storage = [] call KPLIB_fnc_cratefiller_getStorage;

// Get the storage inventory
private _inventory = [] call KPLIB_fnc_cratefiller_getInventory;

// Fill the controls
{
    _index = _ctrlInventory lbAdd (format ["%1x %2", str (_x select 2), _x select 0]);
    _config = [_x select 1] call KPLIB_fnc_cratefiller_getConfigPath;
    _ctrlInventory lbSetPicture [_index, getText (configFile >> _config >> (_x select 1) >> "picture")];
} forEach _inventory;

private _load = 0;

// Check for an active storage
if (isNull _storage) exitWith {
    _ctlrProgress progressSetPosition 0;
};

// Get the mass of each item
{
    _type = (_x select 1);
    _config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
    if (_config isEqualTo "CfgWeapons") then {
        _itemMass = getNumber (configfile >> _config >> _type >> "WeaponSlotsInfo" >> "mass");
        if (_itemMass isEqualTo 0) then {
            _itemMass = getNumber (configfile >> _config >> _type >> "ItemInfo" >> "mass");
        };
    } else {
        _itemMass = getNumber (configFile >> _config >> _type >> "mass");
    };
    _load = _load + (_itemMass * (_x select 2));
} forEach _inventory;

_type = typeOf _storage;
_config = [_type] call KPLIB_fnc_cratefiller_getConfigPath;
private _maxLoad = getNumber (configFile >> _config >> _type >> "maximumLoad");
private _loadFactor = _load / _maxLoad;

_ctlrProgress progressSetPosition _loadFactor;

true
