KPLIB_control_TimeWeather = 0;

createDialog "liberation_timeweather";
waitUntil {sleep 0.1; dialog};
waitUntil {sleep 0.1; !dialog || !alive player || KPLIB_control_TimeWeather != 0};

if (KPLIB_control_TimeWeather > 0) then {
    closeDialog 0;
    waitUntil {sleep 0.1; !dialog};

    if (KPLIB_control_TimeWeather == 1) then {
        if (isNil KPLIB_inProgress_TimeWeather) then {KPLIB_inProgress_TimeWeather = false;};
        if (KPLIB_inProgress_TimeWeather) exitWith {};
        KPLIB_inProgress_TimeWeather = true;
        private _countdown = 15;
        for "_i" from _countdown to 1 step -1 do {
            [format [localize "STR_FOB_TW_ACTION_TIMESKIP_COUNTDOWN", _countdown]] remoteExec ["hint",-2];
            _countdown = _countdown - 1;
            sleep 1;
        };
        [localize "STR_FOB_TW_ACTION_TIMESKIP_START"] remoteExec ["hint",-2];
        if !(daytime < 16 && daytime > 8) then {
            private ["_currentHour", "_currentDate", "_newDate", "_nextDate", "_currentYear", "_currentDateNum", "_nextDateNum"];
            _currentHour = daytime;
            _currentDate = date;
            _currentYear = _currentDate select 0;
            if (_currentHour < 8) then {
                _newDate = [_currentDate select 0, _currentDate select 1, _currentDate select 2, 9, 0];
            } else {
                _currentDateNum = dateToNumber _currentDate;
                _nextDateNum = _currentDateNum + 0.00273973;
                if (_nextDateNum > 1) then {
                    _currentYear = _currentYear + 1; _nextDateNum = 0;
                };
                _nextDate = numberToDate [_currentYear, _nextDateNum];
                _newDate = [_nextDate select 0, _nextDate select 1, _nextDate select 2, 9, 0];
            };
            [_newDate, true, true] call BIS_fnc_setDate;
            sleep 5;
            [localize "STR_FOB_TW_ACTION_TIMESKIP_DONE_MORNING"] remoteExec ["hint",-2];
        } else {
            private ["_currentHour", "_currentDate", "_newDate", "_nextDate", "_currentYear", "_currentDateNum", "_nextDateNum"];
            _currentHour = daytime;
            _currentDate = date;
            _currentYear = _currentDate select 0;
            if (_currentHour < 21) then {
                _newDate = [_currentDate select 0, _currentDate select 1, _currentDate select 2, 21, 0];
            } else {
                _currentDateNum = dateToNumber _currentDate;
                _nextDateNum = _currentDateNum + 0.00273973;
                if (_nextDateNum > 1) then {
                    _currentYear = _currentYear + 1; _nextDateNum = 0;
                };
                _nextDate = numberToDate [_currentYear, _nextDateNum];
                _newDate = [_nextDate select 0, _nextDate select 1, _nextDate select 2, 21, 0];
            };
            [_newDate, true, true] call BIS_fnc_setDate;
            sleep 5;
            [localize "STR_FOB_TW_ACTION_TIMESKIP_DONE_NIGHT"] remoteExec ["hint",-2];
        };
        KPLIB_inProgress_TimeWeather = false;
    };

    if (KPLIB_control_TimeWeather == 2) then {
        [240, 0] remoteExecCall ["setFog", 2];
        [localize "STR_FOB_TW_ACTION_CLEARFOG_DONE"] remoteExec ["hint",-2];
    };
};
