/*
    KPLIB_fnc_adm_wipeServer

    File: fn_adm_wipeServer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-11
    Last Update: 2018-11-11
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Wipes all save data.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

// Interrupt all mission functionalities, especially the saving
KPLIB_campaignRunning = false;
publicVariable "KPLIB_campaignRunning";

// Delete saved data
profileNamespace setVariable [KPLIB_save_key, nil];
saveProfileNamespace;
diag_log "[KP LIBERATION] [IMPORTANT] Save wiped";

true
