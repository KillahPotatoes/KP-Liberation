/*
    File: fn_getSectorRange.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-11-25
    Last Update: 2019-11-25
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_opforcount"];

private _corrected_sector_size = GRLIB_sector_size;

if (_opforcount >= (0.5 * GRLIB_sector_cap)) then {
    if (_opforcount <= GRLIB_sector_cap) then {
        _corrected_sector_size = GRLIB_sector_size - (GRLIB_sector_size * 0.5 * ((_opforcount / GRLIB_sector_cap) - 0.5));
    } else {
        _corrected_sector_size = GRLIB_sector_size * 0.75;
    };
};

_corrected_sector_size
