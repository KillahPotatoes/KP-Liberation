/*
	F_removeWeaponCargo

	File: F_kp_removeWeaponCargo.sqf
	Author: Zharf, based on CBA_fnc_removeWeaponCargo by Jonpas
	Date: 2019-06-21
	Last Update: 2019-06-21

	Description:
	Removes weapons not found in KP_liberation_allowed_items from a cargo space

	Warning: All weapon attachments/magazines in container will become detached.
	Warning: Preset weapons without non-preset parents will get their attachments readded (engine limitation).

	Parameter(s):
		0: OBJECT - Object with cargo

	Returns:
	ARRAY
*/

params [["_container", objNull, [objNull]]];
if (isNull _container) exitWith {
    []
};

private _removed = [];
private _weaponsItemsCargo = weaponsItemsCargo _container;
clearWeaponCargoGlobal _container;

{
    _x params ["_weapon", "_muzzle", "_pointer", "_optic", "_magazine", "_magazineGL", "_bipod"];

    // weaponsItems magazineGL does not exist if not loaded (not even as empty array)
    if (count _x < 7) then {
        _bipod = _magazineGL;
        _magazineGL = "";
    };

    // Some weapons don't have non-preset parents
    _components = _weapon call F_getWeaponComponents;
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

