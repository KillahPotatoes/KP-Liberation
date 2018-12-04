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
