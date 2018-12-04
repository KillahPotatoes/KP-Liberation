/*
    KPLIB_fnc_adm_importSave

    File: fn_adm_importSave.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-27
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Imports the stored save data of a running Liberation campaign from the profile vars of the player.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (isServer) then {
    // If it's local hosted we can directly import the save data
    [profileNamespace getVariable [KPLIB_save_key + "_export", nil]] call KPLIB_fnc_adm_importSaveServer;
} else {
    // Otherwise send data for import to the server
    [profileNamespace getVariable [KPLIB_save_key + "_export", nil]] remoteExecCall ["KPLIB_fnc_adm_importSaveServer", 2];
};

hint localize "STR_KPLIB_DIALOG_ADMIN_IMP_NOTE";

true
