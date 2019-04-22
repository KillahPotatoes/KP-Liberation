/*
    KPLIB_fnc_resources_getAttachArray

    File: fn_resources_getAttachArray.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-12-15
    Last Update: 2019-04-22
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        Returns the attachTo offsets array for given storage class.

    Parameter(s):
        _storageClass - Classname of the storage to get the array from [STRING, defaults to ""]

    Returns:
        Array with offset data [ARRAY]
*/

params [
    ["_storageClass", "", [""]]
];

// Get the height offset for the crate type
switch (_storageClass) do {
    case KPLIB_preset_storageLargeE;
    case KPLIB_preset_storageLargeF: {KPLIB_resources_storageOffsetsLarge};
    case KPLIB_preset_storageSmallE;
    case KPLIB_preset_storageSmallF: {KPLIB_resources_storageOffsetsSmall};
    default {[]};
}
