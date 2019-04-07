/*
    KPLIB_fnc_adm_wipe

    File: fn_adm_wipe.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-03-29
    Last Update: 2018-11-27
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Creates a backup of the current save as exported save. Afterwards let the server wipe his saved campaign.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// First we backup the current save as exported save
[] call KPLIB_fnc_adm_exportSave;

// Small delay to ensure correct export. Then wipe the save on the server
[
    {
        if (isServer) then {
            [] call KPLIB_fnc_init_wipe;
        } else {
            [] remoteExecCall ["KPLIB_fnc_init_wipe", 2];
        };

        hint localize "STR_KPLIB_DIALOG_ADMIN_WIPE_NOTE";
    },
    [],
    4
] call CBA_fnc_waitAndExecute;

true
