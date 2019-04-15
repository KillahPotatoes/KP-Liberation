/*
    KPLIB_fnc_cratefiller_getStorage

    File: fn_cratefiller_getStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Returns the active storage.

    Parameter(s):
        NONE

    Returns:
        Active Storage [OBJECT]
*/

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlStorage = _dialog displayCtrl 68740;

// Read controls
private _storageIndex = lbCurSel _ctrlStorage;

// Check for empty variable
if (_storageIndex isEqualTo -1) exitWith {
    objNull
};

// Get the storage object
private _storage = objectFromNetId (_ctrlStorage lbData _storageIndex);

_storage
