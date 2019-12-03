/*
    File: fn_secondsToTimer.sqf
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
params [ "_timer" ];
private [ "_minutes", "_seconds", "_minutes_zero", "_seconds_zero", "_retstr" ];

_minutes = floor (_timer / 60);
_seconds = _timer % 60;
_minutes_zero = '';
_seconds_zero = '';

if ( _minutes < 10 ) then { _minutes_zero = '0'; };
if ( _seconds < 10 ) then { _seconds_zero = '0'; };

_retstr = format [ '%1%2:%3%4',_minutes_zero,_minutes,_seconds_zero,_seconds ];

_retstr
