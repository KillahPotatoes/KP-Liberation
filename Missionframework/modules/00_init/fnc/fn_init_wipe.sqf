/*
    KPLIB_fnc_init_wipe

    File: fn_init_wipe.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-03-29
    Last Update: 2018-11-27
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
