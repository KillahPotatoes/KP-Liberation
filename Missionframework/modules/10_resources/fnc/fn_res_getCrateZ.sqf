/*
    KPLIB_fnc_res_getCrateZ

    File: fn_res_getCrateZ.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2018-12-15
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Gets Z offset for storage attaching.

    Parameter(s):
        _crateClass - Crateclass to get the z offset for [STRING, defaults to ""]

    Returns:
        Z Offset [NUMBER]
*/

params [
    ["_crateClass", "", [""]]
];

// Get the height offset for the crate type
switch (_crateClass) do {
    case KPLIB_preset_crateSupplyE;
    case KPLIB_preset_crateSupplyF: {0.4};
    case KPLIB_preset_crateAmmoE;
    case KPLIB_preset_crateAmmoF: {0.6};
    case KPLIB_preset_crateFuelE;
    case KPLIB_preset_crateFuelF: {0.3};
    default {0};
}
