/*
    KPLIB_fnc_init_getSaveData

    File: fn_init_getSaveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-11-09
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Retrieves the module data from the global save data array. The tag is needed to specify which data should be provided.
        Returns the plain data as array or an empty array, if the tag wasn't found in the global save data array.

    Parameter(s):
        _tag - Tag of the save data which should be returned from the global save data array [STRING, defaults to ""]

    Returns:
        Save data which matched to the tag [ARRAY]
*/

params [
    ["_tag", "", [""]]
];

// Default an empty array as return value
private _return = [];

// Return an empty array, if there is no save data
if (isNil "KPLIB_save_data") exitWith {_return};

private _index = (KPLIB_save_data findIf {(_x select 0) == _tag});

if (_index isEqualTo -1) then {
    _return
} else {
    (KPLIB_save_data select _index) select 1
};
