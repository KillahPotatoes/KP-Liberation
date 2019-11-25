/*
    File: fn_getFobName.sqf
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
params [ "_fob" ];
private [ "_fobindex", "_currentidx", "_fobname" ];

_fobname = "";
_fobindex = -1;
_currentidx = 0;
{
    if ( _x distance _fob < 100 ) then {
        _fobindex = _currentidx;
    };
    _currentidx = _currentidx + 1;
} foreach GRLIB_all_fobs;

_fobname = "";
if ( _fobindex != -1 ) then {
    _fobname = military_alphabet select _fobindex;
};

_fobname
