/*
    KPLIB_fnc_adm_deleteExport

    File: fn_adm_deleteExport.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-08-02
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Deletes the save data which is stored in the players profileNamespace for export.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Remove saved variable from the players profileNamespace
profileNamespace setVariable [KPLIB_save_key + "_export", nil];
saveProfileNamespace;

// Disable the import and delete button in the admin dialog
findDisplay 75802 displayCtrl 758021 ctrlEnable false;
findDisplay 75802 displayCtrl 758022 ctrlEnable false;

// Hint output
hint localize "STR_KPLIB_DIALOG_ADMIN_DEL_NOTE";
[{hintSilent "";}, [], 3] call CBA_fnc_waitAndExecute;

true
