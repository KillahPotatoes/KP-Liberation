#include "..\ui\defines.hpp"
/*
    KPLIB_fnc_cratefiller_getStorage

    File: fn_cratefiller_getStorage.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-05-04
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Returns the active storage.

    Parameter(s):
        NONE

    Returns:
        Active Storage [OBJECT]
*/

// Dialog controls
private _dialog = findDisplay KPLIB_IDC_CRATEFILLER_DIALOG;
private _ctrlStorage = _dialog displayCtrl KPLIB_IDC_CRATEFILLER_COMBOCARGO;

// Read controls
private _storageIndex = lbCurSel _ctrlStorage;

// Check for empty variable
if (_storageIndex isEqualTo -1) exitWith {
    objNull
};

// Get the storage object
private _storage = objectFromNetId (_ctrlStorage lbData _storageIndex);

_storage
