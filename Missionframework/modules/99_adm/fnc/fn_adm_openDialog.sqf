/*
    KPLIB_fnc_adm_openDialog

    File: fn_adm_openDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-27
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Opens the admin menu dialog and enables/disables certain buttons if conditions for their usage aren't met.
        For example the import button, if there is no saved liberation data in the player profile.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Create admin dialog
createDialog "KPLIB_admin";

// Disable the import and delete button in the admin dialog, when there is no exported data in the players profileNamespace
if (profileNamespace getVariable [KPLIB_save_key + "_export", []] isEqualTo []) then {
    findDisplay 75802 displayCtrl 758021 ctrlEnable false;
    findDisplay 75802 displayCtrl 758022 ctrlEnable false;
};

true
