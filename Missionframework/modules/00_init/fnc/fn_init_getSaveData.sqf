/*
    KPLIB_fnc_init_getSaveData

    File: fn_init_getSaveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Retrieves the module data from the global save data array. The tag is needed to specify which data should be provided.
    Returns the plain data as array or an empty array, if the tag wasn't found in the global save data array.

    Parameter(s):
        0: STRING - Tag of the save data which should be returned from the global save data array.

    Returns:
    ARRAY
*/

params [
    ["_tag", "", [""]]
];

// Default an empty array as return value
private _return = [];

// Return an empty array, if there is no save data
if (isNil "KPLIB_save_data") exitWith {_return};

_return = KPLIB_save_data select {(_x select 0) == _tag};

if (_return isEqualTo []) then {
    _return
} else {
    _return select 0 select 1
};
