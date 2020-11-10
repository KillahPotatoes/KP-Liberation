/*
    File: fn_getLoadout.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
/*

    AUTHOR: aeroson
    NAME: get_loadout.sqf
    VERSION: 3.4

    DOWNLOAD & PARTICIPATE:
    https://github.com/aeroson/a3-loadout
    http://forums.bistudio.com/showthread.php?148577-GET-SET-Loadout-(saves-and-loads-pretty-much-everything)

    DESCRIPTION:
    I guarantee backwards compatibility.
    These scripts allows you set/get (load/save)all of the unit's gear, including:
    uniform, vest, backpack, contents of it, all quiped items, all three weapons with their attachments, currently loaded magazines and number of ammo in magazines.
    All this while preserving order of items.
    Useful for saving/loading loadouts.
    Ideal for revive scripts where you have to set exactly the same loadout to newly created unit.
    Uses workaround with placeholders to add vest/backpack items, so items stay where you put them.

    PARAMETER(S):
    0 : target unit
    1 : (optional) array of options, default [] :
        "ammo" will save ammo count of partially emptied magazines
        "repetitive" intended for repetitive use, will not use selectWeapon, means no visible effect on solder, but will not save magazines of assigned items such as laser designator batteries

    RETURNS:
    Array : array of strings/arrays containing target unit's loadout, to be used by fnc_set_loadout.sqf

    addAction support:
    Saves player's loadout into global var loadout

*/

private ["_target","_options","_saveMagsAmmo","_isRepetitive","_isOnFoot","_currentWeapon","_currentMode","_isFlashlightOn","_isIRLaserOn","_magazinesAmmo","_loadedMagazines","_saveWeaponMagazines","_getMagsAmmo","_backPackItems","_assignedItems","_data"];

_options = [];

// addAction support
if(count _this < 4) then {
    #define PARAM_START private ["_PARAM_INDEX"]; _PARAM_INDEX=0;
    #define PARAM_REQ(A) if (count _this <= _PARAM_INDEX) exitWith { systemChat format["required param '%1' not supplied in file:'%2' at line:%3", #A ,__FILE__,__LINE__]; }; A = _this select _PARAM_INDEX; _PARAM_INDEX=_PARAM_INDEX+1;
    #define PARAM(A,B) A = B; if (count _this > _PARAM_INDEX) then { A = _this select _PARAM_INDEX; }; _PARAM_INDEX=_PARAM_INDEX+1;
    PARAM_START
    PARAM_REQ(_target)
    PARAM(_options,[])
} else {
    _target = player;
};

_saveMagsAmmo = "ammo" in _options;
_isRepetitive = "repetitive" in _options;
_isOnFoot = vehicle _target == _target;

_currentWeapon = "";
_currentMode = "";
_isFlashlightOn = false;
_isIRLaserOn = false;

_magazinesAmmo = magazinesAmmoFull _target;

// save weapon mode and muzzle
if(_isOnFoot) then {
    _currentWeapon = currentMuzzle _target;
    _currentMode = currentWeaponMode _target;
    _isFlashlightOn = _target isFlashlightOn _currentWeapon;
    _isIRLaserOn = _target isIRLaserOn _currentWeapon;
} else {
    _currentWeapon = currentWeapon _target;
};


_loadedMagazines=[];

// universal weapon saving
_saveWeaponMagazines = {
    private ["_weapon","_magazines","_muzzles","_saveMagazine"];
    _weapon = _this select 0;
    _magazines = [];

    _saveMagazine = { // find, save and eat mag for _weapon
        private ["_weapon","_magazine","_ammo"];
        _weapon = _this select 0;
        _magazine = "";
        _ammo = 0;
        {
            if((_x select 4)==_weapon) then {
                _magazine = _x select 0;
                _ammo = _x select 1;
                _x = -1;
            };
        } forEach _magazinesAmmo;
        _magazinesAmmo = _magazinesAmmo - [-1];
        if(_magazine!="") then {
            if(_saveMagsAmmo) then {
                _magazines set [count _magazines, [_magazine, _ammo]];
            } else {
                _magazines set [count _magazines, _magazine];
            };
        };
    };

    if(_weapon != "") then {
        [_weapon] call _saveMagazine;
        _muzzles = configFile>>"CfgWeapons">>_weapon>>"muzzles";
        if(isArray(_muzzles)) then {
            { // add one mag for each muzzle
                if (_x != "this") then {
                    [_x] call _saveMagazine;
                };
            } forEach getArray(_muzzles);
        };
    };

    _loadedMagazines set [count _loadedMagazines, _magazines];
};

// save loaded mags for each weapon separetely, since some weapons can use same magazines
[primaryWeapon _target] call _saveWeaponMagazines;
[handgunWeapon _target] call _saveWeaponMagazines;
[secondaryWeapon _target] call _saveWeaponMagazines;

_getMagsAmmo = { // default function with _saveMagsAmmo == false
    _this select 0;
};
if(_saveMagsAmmo) then {
    // check if input array contains magazine, if it does, find it add ammo count
    _getMagsAmmo = {
        private ["_items","_location","_item","_itemIndex"];
        _items = _this select 0;
        _location = _this select 1;
        {
            _item = _x;
            _itemIndex = _forEachIndex;
            {
                if((_x select 4)==_location && (_x select 0)==_item) then {
                    _items set[_itemIndex, [_item, _x select 1]];
                    _x = -1;
                };
            } forEach _magazinesAmmo;
            _magazinesAmmo = _magazinesAmmo - [-1];
        } forEach _items;
        _items;
    };

};

// get backpack items
_cargo = getbackpackcargo (unitbackpack _target);
_backpacks = [];
{
    for "_i" from 1 to ((_cargo select 1) select _foreachindex) do {
        _backpacks set [count _backpacks, _x];
    };
} foreach (_cargo select 0);
_backPackItems = (backpackitems _target) + _backpacks;

// get assigned items, headgear and goggles is not part of assignedItems
_assignedItems = assignedItems _target;
_headgear = headgear _target;
_goggles = goggles _target;
if((_headgear != "") && !(_headgear in _assignedItems)) then {
    _assignedItems set [count _assignedItems, _headgear];
};
if((_goggles != "") && !(_goggles in _assignedItems)) then {
    _assignedItems set [count _assignedItems, _goggles];
};



/*
// use this once magazinesAmmoFull is fixed and shows magazines of assignedItems

// get magazines of everything else except weapons, most likely assigned items
// only ["Uniform","Vest","Backpack"] locations remain, weapon locations have already been eaten
_magazines = [];
{
    if(_x select 2) then {
        if(_saveMagsAmmo) then {
            _magazines set[count _magazines, [_x select 0, _x select 1]];
        } else {
            _magazines set[count _magazines, _x select 0];
        };
        _x = -1;
    };
} forEach _magazinesAmmo;
_magazinesAmmo = _magazinesAmmo - [-1];
_loadedMagazines set [3, _magazines];
*/


// old method using selectWeapon, cycles and tries to selectWeapon all assigned items
if(!_isRepetitive) then {
    private ["_weaponHasChanged"];
    _weaponHasChanged = false;

    // get magazines of all assigned items
    _magazines = [];
    {
        _target selectWeapon _x;
        if(currentWeapon _target==_x) then {
            _weaponHasChanged = true;
            _magazine = currentMagazine _target;
            if(_magazine != "") then {
                if(_saveMagsAmmo) then {
                    _magazines set[count _magazines, [_magazine, _target ammo _x]];
                } else {
                    _magazines set[count _magazines, _magazine];
                };
            };
        };
    } forEach _assignedItems;
    _loadedMagazines set [3, _magazines];

    // select back originaly selected weapon and mode, only if weapon has changed
    if(_weaponHasChanged) then {
        if(_isOnFoot) then {
            if(_currentWeapon != "" && _currentMode != "") then {
                _muzzles = 0;
                while{ (_currentWeapon != currentMuzzle _target || _currentMode != currentWeaponMode _target ) && _muzzles < 200 } do {
                    _target action ["SWITCHWEAPON", _target, _target, _muzzles];
                    _muzzles = _muzzles + 1;
                };
                if(_isFlashlightOn) then {
                    _target action ["GunLightOn"];
                } else {
                    _target action ["GunLightOff"];
                };
                if(_isIRLaserOn) then {
                    _target action ["IRLaserOn"];
                } else {
                    _target action ["IRLaserOff"];
                };
            };
        } else {
            _currentMode = "";
        };
        if(_currentMode == "") then {
            if(_currentWeapon=="") then {
                _target action ["SWITCHWEAPON", _target, _target, 0];
            } else {
                _target selectWeapon _currentWeapon;
            };
        };
    };
};


_data = [
    _assignedItems, //0 []

    primaryWeapon _target, //1 ""
    primaryWeaponItems _target, //2 []

    handgunWeapon _target, //3 ""
    handgunItems _target, //4 []

    secondaryWeapon _target, //5 ""
    secondaryWeaponItems _target, //6 []

    uniform _target, //7 ""
    [uniformItems _target, "Uniform"] call _getMagsAmmo, //8 ["magazine without ammo count",["magazine with ammo count",30], ....]

    vest _target, //9 ""
    [vestItems _target, "Vest"] call _getMagsAmmo, //10

    backpack _target, //11  ""
    [_backPackItems, "Backpack"] call _getMagsAmmo, //12

    _loadedMagazines, //13 (optional) [[primary mags],[handgun mags],[secondary mags],[other mags]]
    _currentWeapon, //14 (optional) ""
    _currentMode //15 (optional) ""
];

// addAction support
if(count _this < 4) then {
    _data;
} else {
    loadout = _data;
    //playSound3D ["A3\Sounds_F\sfx\ZoomOut.wav", _target];
};
