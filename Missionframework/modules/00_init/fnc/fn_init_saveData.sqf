/*
    KPLIB_fnc_init_saveData

    File: fn_init_saveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-16
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Fetches data which is bound to the init module and send it to the global save data array.

    Parameter(s):
        NONE

    Returns:
        Function reached the end [BOOL]
*/

if (KPLIB_param_debug) then {diag_log "[KP LIBERATION] [SAVE] Init module saving...";};

// Set module data to save and send it to the global save data array
["init",
    [
        date, // Current date and time
        KPLIB_sectors_lockedVeh, // Locked Vehicles array
        KPLIB_sectors_blufor, // Blufor sectors
        KPLIB_sectors_fobs apply {getMarkerPos _x} // FOB positions
    ]
] call KPLIB_fnc_init_setSaveData;

true
