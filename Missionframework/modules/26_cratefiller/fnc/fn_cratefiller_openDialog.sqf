/*
    KPLIB_fnc_cratefiller_openDialog

    File: fn_cratefiller_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-04-06
    Last Update: 2019-04-06
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the cratefiller dialog.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create dialog
createDialog "KPLIB_cratefiller";
disableSerialization;

// Dialog controls
private _dialog = findDisplay 758026;
private _ctrlCat = _dialog displayCtrl 75810;
private _ctrlWeapon = _dialog displayCtrl 75811;

// Hide controls
_ctrlWeapon ctrlShow false;

// Reset variables
_ctrlCat lbAdd localize "STR_KPCF_LISTWEAPONS";
_ctrlCat lbAdd localize "STR_KPCF_LISTMAGAZINES";
_ctrlCat lbAdd localize "STR_KPCF_LISTATTACHMENTS";
_ctrlCat lbAdd localize "STR_KPCF_LISTGRENADES";
_ctrlCat lbAdd localize "STR_KPCF_LISTEXPLOSIVES";
_ctrlCat lbAdd localize "STR_KPCF_LISTVARIOUS";
_ctrlCat lbAdd localize "STR_KPCF_LISTBACKPACKS";

[] call KPLIB_fnc_cratefiller_showPresets;
[] call KPLIB_fnc_cratefiller_getNearStorages;

true
