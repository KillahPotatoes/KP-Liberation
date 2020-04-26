if (!isDedicated) exitWith {};

_serverDuration = (KP_liberation_restart * 60 * 60);

[format ["Restart Timer Set To %1", _serverDuration], "RESTART"] call KPLIB_fnc_log;

private _30minspassed = false;
private _15minspassed = false;
private _5minspassed = false;
private _60secondspassed = false;

private _timeStart = diag_tickTime;

private ["_timeSinceStart","_timeUntilRestart"];
while{true} do
{
    _timeSinceStart = diag_tickTime - _timeStart;
    _timeUntilRestart = _serverDuration - _timeSinceStart;

    switch true do
    {
        case ((_timeUntilRestart < (1 * 60)) && !_60secondspassed) :
        {
            ["lib_restart_60_s"] remoteExecCall ["BIS_fnc_showNotification"];
            ["60 seconds until server restart.", "RESTART"] call KPLIB_fnc_log;
            _60secondspassed = true;
            _5minspassed = true;
            _15minspassed = true;
            _30minspassed = true;
        };
        case ((_timeUntilRestart < (5 * 60)) && !_5minspassed) :
        {
            ["lib_restart_5_min"] remoteExecCall ["BIS_fnc_showNotification"];
            ["5 minutes until server restart.", "RESTART"] call KPLIB_fnc_log;
            _5minspassed = true;
            _15minspassed = true;
            _30minspassed = true;
        };
        case ((_timeUntilRestart < (15 * 60)) && !_15minspassed) :
        {
            ["lib_restart_15_min"] remoteExecCall ["BIS_fnc_showNotification"];
            ["15 minutes until server restart.", "RESTART"] call KPLIB_fnc_log;
            _15minspassed = true;
            _30minspassed = true;
        };
        case ((_timeUntilRestart < (30 * 60)) && !_30minspassed) :
        {
            ["lib_restart_30_min"] remoteExecCall ["BIS_fnc_showNotification"];
            ["30 minutes until server restart.", "RESTART"] call KPLIB_fnc_log;
            _30minspassed = true;
        };
    };

    if(_timeSinceStart > _serverDuration) then
    {
        ["Restart timeout elapsed, attempting server shutdown.", "RESTART"] call KPLIB_fnc_log;
        sleep 5;

        private _myPass = call compile preprocessFileLineNumbers "\userconfig\restart\myPass.hpp";
        private _shutdownSuccess = _myPass serverCommand (["#restart", "#restartserver"] select ((productVersion select 6) isEqualTo "Windows"));

        if(_shutdownSuccess) then
        {
            ["Shutting down server!", "RESTART"] call KPLIB_fnc_log;
        }
        else
        {
            ["Shutdown failed!", "RESTART"] call KPLIB_fnc_log;
        };
    };
    sleep 15;
};
