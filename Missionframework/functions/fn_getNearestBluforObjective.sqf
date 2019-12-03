/*
    File: fn_getNearestBluforObjective.sqf
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
params ["_startpos"];

private _currentnearest = [];
private _refdistance = 99999;
private _tpositions = [];

if (count GRLIB_all_fobs != 0 || count blufor_sectors != 0) then {

    {_tpositions pushback _x;} foreach GRLIB_all_fobs;

    {
        if (_startpos distance _x < _refdistance) then {
            _refdistance = (_startpos distance _x);
            _currentnearest = [_x,_refdistance];
        };
    } forEach _tpositions;

    if (_refdistance > 4000) then {
        {
            _tpositions pushback (markerpos _x);
        } forEach blufor_sectors;

        {
            if (_startpos distance _x < _refdistance) then {
                _refdistance = (_startpos distance _x);
                _currentnearest = [_x,_refdistance];
            };
        } forEach _tpositions;
    };
} else {
    _currentnearest = _startpos;
};

_currentnearest
