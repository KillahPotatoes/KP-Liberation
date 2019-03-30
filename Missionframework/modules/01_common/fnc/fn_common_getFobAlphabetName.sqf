/*
    KPLIB_fnc_common_getFobAlphabetName

    File: fn_common_getFobAlphabetName.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-11-27
    Last Update: 2019-03-30
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: Yes

    Description:
        Returns fob alphabet name.

    Parameter(s):
        _fob - Fob marker name [STRING, defaults to ""]

    Returns:
        Fob alphabet name [String]
*/
params [
    ["_fob", "", [""]]
];

private _index = KPLIB_sectors_fobs find _fob;

if (_index isEqualTo -1) then {
    ""
} else {
    KPLIB_preset_alphabetF select _index
}
