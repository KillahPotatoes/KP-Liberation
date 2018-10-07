/*
    KPLIB_fnc_init_setSaveData

    File: fn_init_setSaveData.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-07
    Last Update: 2018-10-07
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Adds the provided data array to the global save data array for saving. A tag as string is needed to identify the corresponding module in the save data array.

    Parameter(s):
        0: STRING - Tag in the global save data array for the module data.
        1: ARRAY - The data of the module which should be saved.

    Returns:
    BOOL
*/

params [
    ["_tag", "", [""]],
    ["_data", [], [[]]]
];

KPLIB_save_data pushBack [_tag, _data];

true
