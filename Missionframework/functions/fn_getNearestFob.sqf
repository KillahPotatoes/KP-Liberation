/*
    File: fn_getNearestFob.sqf
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
params [["_source_position", (getpos player)]];

private _retvalue = [];

if (count GRLIB_all_fobs > 0) then {
    _retvalue = ([ GRLIB_all_fobs, [], {_source_position distance _x}, 'ASCEND'] call BIS_fnc_sortBy) select 0;
};

_retvalue
