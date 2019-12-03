/*
    File: fn_getNearestSector.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-12-03
    Last Update: 2019-12-03
    License: MIT License - http://www.opensource.org/licenses/MIT

    Description:
        No description added yet.

    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]

    Returns:
        Function reached the end [BOOL]
*/
// TODO
params ["_limit", ["_postosearch", getpos player]];

private _sector_to_return = "";
private _close_sectors = sectors_allSectors select {(markerPos _x) distance _postosearch < _limit};
private _close_sectors_sorted = [_close_sectors, [_postosearch, _limit], {(markerPos _x) distance _input0}, "ASCEND"] call BIS_fnc_sortBy;
if (count _close_sectors_sorted > 0) then {_sector_to_return = _close_sectors_sorted select 0;};

_sector_to_return;
