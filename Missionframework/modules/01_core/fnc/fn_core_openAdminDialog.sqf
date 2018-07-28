/*
    KPLIB_fnc_core_openAdminDialog

    File: fn_core_openAdminDialog.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-27
    Last Update: 2018-07-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Opens the admin menu dialog and enables/disables certain buttons if conditions for their usage aren't met.
    For example the import button, if there is no saved liberation data in the player profile.

    Parameter(s):
    NONE

    Returns:
    BOOLEAN
*/

createDialog "KPLIB_admin";

if (player getVariable [KPLIB_save_key + "_export", []] isEqualTo []) then {
    findDisplay 75802 displayCtrl 758021 ctrlEnable false;
};

true
