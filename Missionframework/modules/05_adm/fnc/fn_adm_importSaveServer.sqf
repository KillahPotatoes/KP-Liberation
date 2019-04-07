/*
    KPLIB_fnc_adm_importSaveServer

    File: fn_adm_importSaveServer.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-29
    Last Update: 2018-11-10
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Imports the provided save data from a player to the server/hosting player profile.

    Parameter(s):
        _data - KP Liberation save data [ARRAY, defaults to nil

    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_data", nil, [[]]]
];

if (!isNil "_data") then {
    // Interrupt all mission functionalities, especially the saving
    KPLIB_campaignRunning = false;
    publicVariable "KPLIB_campaignRunning";

    // Import data to server profile
    profileNamespace setVariable [KPLIB_save_key, _data];
    saveProfileNamespace;
};

true
